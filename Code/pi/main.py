

#   ██████╗ █████╗ ██████╗ ███████╗████████╗ ██████╗ ███╗   ██╗███████╗     ██████╗  ██╗ ██████╗ ███████╗
#  ██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗████╗  ██║██╔════╝    ██╔════╝ ███║██╔════╝ ██╔════╝
#  ██║     ███████║██████╔╝███████╗   ██║   ██║   ██║██╔██╗ ██║█████╗      ██║  ███╗╚██║███████╗ ███████╗
#  ██║     ██╔══██║██╔═══╝ ╚════██║   ██║   ██║   ██║██║╚██╗██║██╔══╝      ██║   ██║ ██║██╔═══██╗╚════██║
#  ╚██████╗██║  ██║██║     ███████║   ██║   ╚██████╔╝██║ ╚████║███████╗    ╚██████╔╝ ██║╚██████╔╝███████║
#   ╚═════╝╚═╝  ╚═╝╚═╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝╚══════╝     ╚═════╝  ╚═╝ ╚═════╝ ╚══════╝
#                                                                                                        
# Vega, Kaleb, Reid, & Cole  -  2021 & 2022
#    _____ 
#   |_   _|
#     | |  
#     |_|his code is meant to run on a Raspberry pi with both the Pimoroni Unicorn Hat Mini and Micodot Phats, hooked up on a hat-hacker interface
#        Furthermore, this code is only part of a larger system, sending data out through MIDI to a Purr-Data script which plays back drum samples
#        as well as sending data to a custom RP2040 (pi pico) based board to send per-step trigger and value information to multiple analog drum
#        modules. That is to say that while, yes, this code has useful, reuseable bits in it, it's really meant to be used as part of a larger
#        project and as such if you, random future individual that is reading this code, want to steal code from this, you **can** but be aware
#        a large part of the reason for the complexity here is the surounding interface and project as a whole... so, here be dragons.
#

#------------------------------------------------------------------------------------------------------------------------------------------------------
# Imports
#------------------------------------------------------------------------------------------------------------------------------------------------------
from __future__ import annotations
from asyncio import base_events
from microdotphat import write_string, scroll, set_pixel, clear, show, WIDTH, HEIGHT # Microdot phat (text mostly)
# See https://learn.pimoroni.com/article/getting-started-with-micro-dot-phat
from gpiozero import Button
from pyrsistent import b #Unicorn Hat Buttons
from unicornhatmini import UnicornHATMini #Unicorn Hat LEDs
from colorsys import hsv_to_rgb
from PIL import Image, ImageDraw, ImageFont
import keyboard
from collections import defaultdict
# The unicorn hat library has a built in font - see https://github.com/pimoroni/unicornhatmini-python/blob/master/examples/text.py
# This shouldn't be necessary since the microdot phat does text much better, but it's nice to have the option

import time # needed for event scheduling - see http://pymotw.com/2/sched/ - This should really only be used for sending the MIDI data
import random
from os.path import exists
import pickle

#from pyo import * #DSP stuff

from rich import pretty, print
import pretty_errors
pretty.install()
#from icecream import ic

import sys

import mido # midi messages - https://mido.readthedocs.io/en/latest/
# Note, PureData must be running FIRST as port = mido.open_output("Pure Data Midi-In 1") will not work otherwise
# Plus, some start up delay will be necessary to make sure PD has had enough time to initizalize.
import psutil # check if puredata is running - https://github.com/giampaolo/psutil#further-process-apis

from operator import mul #used for working with GRB tuple values

from dataclasses import dataclass #used for sending data from the drums to the steps
from dataclasses import asdict

import copy

#------------------------------------------------------------------------------------------------------------------------------------------------------
# (Most of the) Globals
#------------------------------------------------------------------------------------------------------------------------------------------------------


uh = UnicornHATMini()
uh.set_brightness(0.5)

bpm = 120 # This is the default value, it can be changed by the user later

skip_print_count = 0
skip_print_state = False
skip_RGB_print_count = 0
skip_RGB_print_state = False
param_step = 0
param_microstep = 0
param_index = 0
last_param_index = 0;
pattern_seq_step_loop = 0
temp_steps = None
copy_type = None
bpm_recently_updated = False

#------------------------------------------------------------------------------------------------------------------------------------------------------
# Small helper FNs
#------------------------------------------------------------------------------------------------------------------------------------------------------

def clamp(n, minn, maxn):
    return max(min(maxn, n), minn)

def midi_clamp(n):
    return clamp(n, 0, 127)

# modified from https://stackoverflow.com/questions/8380006/file-open-function-with-try-except-python-2-7-1/8380019
def file_check(fn):
    try:
      return(pickle.load(open( fn, "rb" )))
    except IOError:
      print("Error: File '{}' does not appear to exist.".format(fn))
      return(0)

#     _____ _                 
#    / ____| |                
#   | (___ | |_ ___ _ __  ___ 
#    \___ \| __/ _ \ '_ \/ __|
#    ____) | ||  __/ |_) \__ \
#   |_____/ \__\___| .__/|___/
#                  | |        
#                  |_|    
#
# Steps have a generic "DATA" field because each drum has its own needs for
# storing per-step data.    

class MicroStep:
    #TODO: add a place to store a data struct that can vary per drum, and which can be read by each drum's play step.
    def __init__(self,data):
        self.microstep = False
        self.data = data
    
    def set_microstep(self,state):
        self.microstep = state

    def flip_microstep(self):
        self.microstep = not self.microstep
    
    def get_microstep(self):
        return self.microstep

    def get_data(self):
        return self.data

        
class Step:
    def __init__(self,data):
        self.step = []
        self.active = False
        for i in range(4):
            self.step.append(MicroStep(copy.copy(data)))
    
    def flip_microstep(self, pos):
        self.step[pos].flip_microstep()

        for i in range(4):
            if self.step[i].get_microstep():
                self.active = True
                break
        else:
            self.active = False

    def zero_step(self):
        for i in range(4):
            self.step[i].set_microstep(False)
        
        self.active = False
    
    def get_microsteps(self):
        return [self.step[0].get_microstep(),self.step[1].get_microstep(),self.step[2].get_microstep(),self.step[3].get_microstep()]

    #Pos is the microstep number, 0,1,2,or 3
    def get_microstep(self,pos):
        return self.step[pos].get_microstep()

    #Pos is the microstep number, 0,1,2,or 3
    def get_data(self,pos):
        data = self.step[pos].data
        #print("data fetched is @ {}".format(hex(id(data))))
        return data
    
    def get_active(self):
        return self.active

#  888888ba   888888ba  dP     dP 8888ba.88ba  .d88888b  
#  88    `8b  88    `8b 88     88 88  `8b  `8b 88.    "' 
#  88     88 a88aaaa8P' 88     88 88   88   88 `Y88888b. 
#  88     88  88   `8b. 88     88 88   88   88       `8b 
#  88    .8P  88     88 Y8.   .8P 88   88   88 d8'   .8P 
#  8888888P   dP     dP `Y88888P' dP   dP   dP  Y88888P  
#                                                       
# These are the "Tracks" in the the patterns, because of a refactor
# which rolled drums and tracks into the same "Drum" class, which
# then get's subclassed like this.
# This is the cleanest way I could come up with to handle storing
# different data per microstep, and having various play_step() methods.

@dataclass
class DrumData:
    level: int

@dataclass
class DigitalDrumData(DrumData):
    note: int
    pan: int
    delay: int
    dtime: int
    reverb: int
    #Sample is stored as int, but used really weird,
    # as it's actually a bank, so sample the first 
    # digit is the bank, the sencond the sample itself.
    sample: int

@dataclass
class AnalogDrumData(DrumData):
    # This is here incase it becomes helpful.
    # Right now it's just an extra, useless layer of OO
    pass

@dataclass
class BassDrumData(AnalogDrumData):
    freq: int
    decay: int

@dataclass
class TomDrumData(AnalogDrumData):
    freq: int
    decay: int

@dataclass
class SnareDrumData(AnalogDrumData):
    frequency: int

@dataclass
class HiHatDrumData(AnalogDrumData):
    decay: int

#FM and Drone are the same
@dataclass
class FMDrumData(AnalogDrumData):
    apc_one_freq: int
    apc_two_freq: int
    apc_one_duty_cycle: int
    apc_two_duty_cycle: int
    fm_depth: int

class Drum:
    def __init__(self, name, active, number):
        self.number = number
        self.active = active
        self.current_step = 0
        self.current_step_state = False
        self.name = name
        self.steps = []

    def advance_step(self):
        self.play_step()
        if(self.current_step < 63):
            self.current_step = self.current_step + 1
        else:
            self.current_step = 0
        #enabling this print for debug WILL eat a core of the CPU
        #print("current step = {}::{} = {}".format(self.current_step//4,self.current_step%4,self.steps[self.current_step//4].get_microstep(self.current_step%4)))
        self.current_step_state = self.steps[self.current_step//4].get_microstep(self.current_step%4)
        #print("track {} step {} is {}".format(self.number, self.current_step, self.current_step_state))

    def get_microsteps(self, pos):
        return self.steps[pos].get_microsteps()

    def flip_whole_step(self, pos):
        if self.steps[pos].get_active() is False:
            self.steps[pos].flip_microstep(0)
        else:
            self.steps[pos].zerostep()

    def flip_microstep(self,pos,micropos):
        self.steps[pos].flip_microstep(micropos)
        pass

    def print_all_steps(self):
        print("--------- Track number {} -----------".format(self.number))
        for i in range(16):
            print('step {0:2d} - active = {1} : {2}' .format(i, self.steps[i].get_active(), self.get_microsteps(i)))

    def rgb_display_all_steps(self):
        for i in range(16):
            microsteps = self.get_microsteps(i)
            for j in range(4):
                x = ((4*i+j)%16)
                y = int((4*i+j)//16)
                if(microsteps[j]):
                    if(j==0):
                        uh.set_pixel(x, y, 0, 255, 0)
                    else:
                        uh.set_pixel(x, y, 255, 0, 0)
                else:
                    uh.set_pixel(x, y, 0, 0, 0)
                
                if(self.current_step == (4*i)+j):
                    uh.set_pixel(x, y, 255, 255, 255)
            #uh.show()

    def play_step(self):
        print("This should NEVER be called. A step of a non-type'd drum step was played.")

    def get_number(self):
        return self.number

    def get_name(self):
        return "bad"

    def get_current_microstep(self):
        return self.steps[self.current_step//4].get_microstep(self.current_step%4)

    def get_current_microstep_data(self):
        return self.steps[self.current_step//4].get_data(self.current_step%4)

    #This will fail if called on a basic drum or basic analog drum, as they don't have drum data to work on.
    def check_offset(self):
        #for values in dataclass
        base_dict = asdict(self.base)
        offset_dict = asdict(self.get_current_microstep_data())
        keys = base_dict.keys()
        for key in keys:
            max_pos_offset = 127 - base_dict[key]
            max_neg_offset = -1 * base_dict[key]
            if (offset_dict[key] > max_pos_offset):
                #print("offset value {} to high @ {} + {} = {}".format(key,offset_dict[key],base_dict[key],offset_dict[key]+base_dict[key]))
                setattr(self.get_current_microstep_data(),key,max_pos_offset)
                #print("setting it to {}".format(getattr(self.get_current_microstep_data(),key)))
            elif (offset_dict[key] < max_neg_offset):
                #print("offset value {} to low @ {} + {} = {}".format(key,offset_dict[key],base_dict[key],offset_dict[key]+base_dict[key]))
                setattr(self.get_current_microstep_data(),key,max_neg_offset)
                #print("setting it to {}".format(getattr(self.get_current_microstep_data(),key)))

    #Very similar to check_offset; however, this gets called on base value change to ensure all offsets are sane
    def check_all_offsets(self):
        #for values in dataclass
        base_dict = asdict(self.base)
        for i_step in self.steps:
            for microstep in i_step.step:
                offset_dict = asdict(microstep.get_data())
                keys = base_dict.keys()
                for key in keys:
                    max_pos_offset = 127 - base_dict[key]
                    max_neg_offset = -1 * base_dict[key]
                    if (offset_dict[key] > max_pos_offset):
                        #print("offset value {} to high @ {} + {} = {}".format(key,offset_dict[key],base_dict[key],offset_dict[key]+base_dict[key]))
                        setattr(microstep.get_data(),key,max_pos_offset)
                        #print("setting it to {}".format(getattr(self.get_current_microstep_data(),key)))
                    elif (offset_dict[key] < max_neg_offset):
                        #print("offset value {} to low @ {} + {} = {}".format(key,offset_dict[key],base_dict[key],offset_dict[key]+base_dict[key]))
                        setattr(microstep.get_data(),key,max_neg_offset)
                        #print("setting it to {}".format(getattr(self.get_current_microstep_data(),key)))

    #This will fail if called on a basic drum or basic analog drum, as they don't have drum data to work on.
    #This updates with a value delta, as it is called from a UI event and is relative
    def change_base_value(self,value_delta):
        global skip_print_count
        global skip_print_state
        global param_index
        global last_param_index
        global bpm_recently_updated
        # if value_delta == 0:
        #     return

        base_dict = asdict(self.base)
        i = 0
        param_index = param_index % len(base_dict.keys())

        if skip_print_state == False or param_index != last_param_index or value_delta == 1 or value_delta == -1:
            for key in base_dict.keys():
                if i == param_index:
                    last_param_index = param_index
                    current_value = getattr(self.base,key)
                    check_value = current_value + value_delta
                    new_value = midi_clamp(current_value+value_delta)
                    if check_value == 128:
                        write_string(str(key)+"▲",kerning=False)
                    elif check_value == -1:
                        write_string(str(key)+"▼",kerning=False)
                    elif value_delta > 0:
                        write_string(str(key)+"+",kerning=False)
                    elif value_delta < 0:
                        write_string(str(key)+"-",kerning=False)
                    elif (value_delta == 0) and (bpm_recently_updated == False):
                        write_string(str(key),kerning=False)
                    else:
                        bpm_recently_updated = False
                    setattr(self.base,key,new_value)
                i += 1

        if skip_print_state == False:
            skip_print_count = 20
            skip_print_state = True
        # check the new base values don't create bad offsets
        self.check_all_offsets()

    #This gets called from keyboard events, with the step_num and microstep_num being respective to the held keys
    # when this function is called
    #This updates with a value delta, as it is called from a UI event and is relative
    def change_step_value(self,value_delta,step_num,microstep_num):
        global skip_print_count
        global skip_print_state
        global skip_RGB_print_count
        global skip_RGB_print_state
        global param_index
        if value_delta == 0:
            return

        if skip_print_state == False:
            skip_print_count = 20
            skip_print_state = True
        if skip_RGB_print_state == False:
            skip_RGB_print_count = 20
            skip_RGB_print_state = True

        base_dict = asdict(self.base)
        param_index = param_index % len(base_dict.keys())
        i = 0
        for key in base_dict.keys():
            if i == param_index:
                current_value = getattr(self.steps[step_num].get_data(microstep_num),key)
                base_value = getattr(self.base,key)
                check_value = base_value + current_value + value_delta
                if (check_value < 0):
                    print("clamped to 0")
                    new_value = -base_value
                elif (check_value > 127):
                    print("clamped to 127")
                    new_value = 127 - base_value
                else:
                    new_value = value_delta + current_value

                target_microstep_data = self.steps[step_num].step[microstep_num].get_data()
                print("Offset {} of {} changed from ({} + ) {} to {} -- input delta of {}, check value of {} -- Step {}:{}={} @ {}".format(key,self.name,base_value,current_value,new_value,value_delta,check_value,step_num,microstep_num,target_microstep_data,hex(id(target_microstep_data))))
                if check_value == 128:
                    write_string(str(key)+"△",kerning=False)
                elif check_value == -1:
                    write_string(str(key)+"▽",kerning=False)
                elif value_delta > 0:
                    write_string(str(key)+"+",kerning=False)
                elif value_delta < 0:
                    write_string(str(key)+"-",kerning=False)
                else:
                    write_string("?????",kerning=False)
                setattr(target_microstep_data,key,new_value)
            i += 1


class AnalogDrum(Drum):
    def __init__(self,name, active, number):
        active = False
        super().__init__(name, active, number)
    pass

    def play_step(self):
        #This should be called if there's an empty analog drum socket.
        pass
    
    def get_name(self):
        return "empty"

class BassDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = BassDrumData(100,64,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(BassDrumData(0,0,0)))

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        total_frequency = self.base.freq + self.get_current_microstep_data().freq
        total_decay = self.base.decay + self.get_current_microstep_data().decay
        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
            #----PARAM----
            msg = mido.Message('control_change', control=16, value=total_decay, channel=self.number) #Decay is on 
            port_pico.send(msg)
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_frequency, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off',  channel=self.number)
            port_pico.send(msg)
    
    def get_name(self):
        return "BASS"

class TomDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = TomDrumData(100,64,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(TomDrumData(0,0,0)))

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        total_frequency = self.base.freq + self.get_current_microstep_data().freq
        total_decay = self.base.decay + self.get_current_microstep_data().decay
        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
            #----PARAM----
            msg = mido.Message('control_change', control=16, value=total_decay, channel=self.number) #Decay is on 
            port_pico.send(msg)
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_frequency, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off',  channel=self.number)
            port_pico.send(msg)
    
    def get_name(self):
        return "TOM "

class SnareDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = SnareDrumData(100,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(SnareDrumData(0,0)))

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        total_frequency = self.base.frequency + self.get_current_microstep_data().frequency
        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_frequency, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off', channel=self.number)
            port_pico.send(msg)

    def get_name(self):
        return "SNR "

class HiHatDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = HiHatDrumData(100,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(HiHatDrumData(0,0)))

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        total_decay = self.base.decay + self.get_current_microstep_data().decay
        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_decay, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off', channel=self.number)
            port_pico.send(msg)

    def get_name(self):
        return "HAT "

class FMDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = FMDrumData(100,64,64,64,64,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(FMDrumData(0,0,0,0,0,0)))

    # apc_one_freq: int
    # apc_two_freq: int
    # apc_one_duty_cycle: int
    # apc_two_duty_cycle: int
    # fm_depth: int

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        
        total_apc_one_freq = self.base.apc_one_freq + self.get_current_microstep_data().apc_one_freq
        total_apc_two_freq = self.base.apc_two_freq + self.get_current_microstep_data().apc_two_freq
        total_apc_one_duty_cycle = self.base.apc_one_duty_cycle + self.get_current_microstep_data().apc_one_duty_cycle
        total_apc_two_duty_cycle = self.base.apc_two_duty_cycle + self.get_current_microstep_data().apc_two_duty_cycle

        total_fm_depth = self.base.fm_depth + self.get_current_microstep_data().fm_depth


        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
             #----PARAM----
            msg = mido.Message('control_change', control=0, value=total_apc_two_freq, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=1, value=total_apc_one_duty_cycle, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=2, value=total_apc_two_duty_cycle, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=3, value=total_fm_depth, channel=self.number)
            port.send(msg)
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_apc_one_freq, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off', channel=self.number)
            port_pico.send(msg)
        
    def get_name(self):
        return "FM  "

class DroneDrumModule(AnalogDrum):
    def __init__(self,name, active, number):
        super().__init__(name, active, number)
        self.base = FMDrumData(100,64,64,64,64,64)
        for i in range(16): #16 steps per track
            self.steps.append(Step(FMDrumData(0,0,0,0,0,0)))

        # apc_one_freq: int
    # apc_two_freq: int
    # apc_one_duty_cycle: int
    # apc_two_duty_cycle: int
    # fm_depth: int

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        
        total_apc_one_freq = self.base.apc_one_freq + self.get_current_microstep_data().apc_one_freq
        total_apc_two_freq = self.base.apc_two_freq + self.get_current_microstep_data().apc_two_freq
        total_apc_one_duty_cycle = self.base.apc_one_duty_cycle + self.get_current_microstep_data().apc_one_duty_cycle
        total_apc_two_duty_cycle = self.base.apc_two_duty_cycle + self.get_current_microstep_data().apc_two_duty_cycle

        total_fm_depth = self.base.fm_depth + self.get_current_microstep_data().fm_depth


        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        if self.current_step_state == True:
             #----PARAM----
            msg = mido.Message('control_change', control=0, value=total_apc_two_freq, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=1, value=total_apc_one_duty_cycle, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=2, value=total_apc_two_duty_cycle, channel=self.number)
            port.send(msg)
            msg = mido.Message('control_change', control=3, value=total_fm_depth, channel=self.number)
            port.send(msg)
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_apc_one_freq, velocity=total_level, channel=self.number) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port_pico.send(msg)
            msg = mido.Message('note_off', channel=self.number)
            port_pico.send(msg)
    
    def get_name(self):
        return "DRN "


class DigitalDrum(Drum):
    def __init__(self,name, active, number):
        self.base = DigitalDrumData(100,64,64,0,32,0,0)
        super().__init__(name, active, number)
        for i in range(16): #16 steps per track
            self.steps.append(Step(DigitalDrumData(0,0,0,0,0,0,0)))
    def setsamplebank():
        #%3
        pass
    def setsample():
        #%5
        pass
    def sete1():
        pass
    def sete2():
        pass

    def play_step(self):
        total_level = self.base.level + self.get_current_microstep_data().level
        total_note = 127 - (self.base.note + self.get_current_microstep_data().note)
        total_pan = self.base.pan + self.get_current_microstep_data().pan
        total_dtime = self.base.dtime + self.get_current_microstep_data().dtime
        total_delay = self.base.delay + self.get_current_microstep_data().delay
        total_reverb = 127 - (self.base.reverb + self.get_current_microstep_data().reverb)
        total_sample = self.base.sample + self.get_current_microstep_data().sample

        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        note = 2

        if self.current_step_state == True and self.number >= 5 : #tracks 5,6,7,8,9 are digital
            #----PARAM----
            msg = mido.Message('control_change', control=16, value=total_pan, channel=self.number-5) #Pan is on CC 16
            port.send(msg)
            msg = mido.Message('control_change', control=17, value=total_delay, channel=self.number-5) #Delay Mix is on CC 17
            port.send(msg)
            msg = mido.Message('control_change', control=18, value=total_dtime, channel=self.number-5) #Delay Time is on CC 18
            port.send(msg)
            msg = mido.Message('control_change', control=19, value=total_reverb, channel=self.number-5) #Reverb is on CC 19
            port.send(msg)
            #----SAMPLE----
            msg = mido.Message('control_change', control=20, value=total_sample%29, channel=self.number-5) #Sample BANK selection is on CC 20 TODO: Mod29 here only because sample banks are not yet full
            port.send(msg)
            #-----PLAY-----
            #print("Playing Drum {} on key {} w/ velocity {} on CH. ".format(self.name,total_note,total_level,self.number-4))
            msg = mido.Message('note_on', note=total_note, velocity=total_level, channel=self.number-5) # channel number is off-by-1 from real, that is channel=0 actually sends on what PD calls channel 1
            port.send(msg)


    def kill_step(self,note):
        time.sleep(.009)
        msg = mido.Message('note_off', note=note)
        port.send(msg)

    def get_name(self):
        return "DGTL"

#    _____      _   _                      
#   |  __ \    | | | |                     
#   | |__) |_ _| |_| |_ ___ _ __ _ __  ___ 
#   |  ___/ _` | __| __/ _ \ '__| '_ \/ __|
#   | |  | (_| | |_| ||  __/ |  | | | \__ \
#   |_|   \__,_|\__|\__\___|_|  |_| |_|___/
#                                          
#                                          

class Pattern:
    def __init__(self,id,modules):
        self.tracks = []
        self.id = id
        self.active_track = 0
        for i in range(0,5):
            drum_type = modules[i]
            if(drum_type == "BD"):
                self.tracks.append(BassDrumModule("BD  {}".format(i),True,i))
            elif(drum_type == "TOM"):
                self.tracks.append(TomDrumModule("TOM {}".format(i),True,i))
            elif(drum_type == "SNARE"):
                self.tracks.append(SnareDrumModule("SNR {}".format(i),True,i))
            elif(drum_type == "HAT"):
                self.tracks.append(HiHatDrumModule("HAT {}".format(i),True,i))
            elif(drum_type == "FM"):
                self.tracks.append(FMDrumModule("FM  {}".format(i),True,i))
            elif(drum_type == "DRONE"):
                self.tracks.append(DroneDrumModule("DRN {}".format(i),True,i))
            else:
                self.tracks.append(AnalogDrum("ADRM{}".format(i),True,i))
        for i in range(5,10):
            self.tracks.append(DigitalDrum("DDRM{}".format(i),True,i))
    
    def get_active_track(self):
        return self.tracks[self.active_track]

    def change_step_value(self,value_delta,step_num,microstep_num):
        self.get_active_track().change_step_value(value_delta,step_num,microstep_num)

    def change_base_value(self,value_delta):
        self.get_active_track().change_base_value(value_delta)

    def get_active_track_num(self):
        return self.tracks[self.active_track].get_number()

    def get_active_track_name(self):
        return self.tracks[self.active_track].get_name()

    def set_active_track(self, track_num):
        self.active_track = track_num
        for i in range(10):
            if track_num == i:
                self.tracks[i].active = True
            else:
                self.tracks[i].active = False

    def advance_all_track_steps(self):
        for i in range(0,10):
            self.tracks[i].advance_step()

    def rgb_step_display(self):
        self.get_active_track().rgb_display_all_steps()

    def track_select_display(self):
        y = 5
        offset = 5
        for x in range(offset,offset+5):
            uh.set_pixel(x, y, 10,10,100)
        y = 6
        for x in range(offset,offset+5):
            uh.set_pixel(x, y, 10,100,10)
        active_track_led = self.active_track
        if(self.active_track > 4):
            active_track_led -= 5
            uh.set_pixel(active_track_led+offset, y, 255, 255, 255)
        else:
            uh.set_pixel(active_track_led+offset, y-1, 255, 255, 255 )

    def rgb_sample_select_display(self,step,microstep):
        base = self.get_active_track().base.sample
        base_bank = base//9
        base_sample = ((base-(base_bank*9))%9)+1
        if step == -1:
            offset = self.get_active_track().get_current_microstep_data().sample
        else:
            offset = self.get_active_track().steps[step].get_data(microstep).sample
        offset_bank = base_bank + offset//9
        offset_sample = base_sample + ((offset-(offset_bank*9))%9)
        y = 0
        #print(f"BASE:{base}::base_bank:{base_bank};base_sample:{base_sample} -- OFFSET:{offset}::offset_bank:{offset_bank};offset_sample:{offset_sample}")
        for x in range(0,3):
            if x == base_bank:
                base_brightness = 255
            else:
                base_brightness = 0
            if x == offset_bank:
                offset_brightness = 255
            else:
                offset_brightness = 0
            uh.set_pixel(x+5,y,10,base_brightness,offset_brightness)

        led_num = 0
        for x in range(0,3):
            for y in range(1,4):
                led_num += 1
                if led_num == base_sample:
                    base_brightness = 255
                else:
                    base_brightness = 0
                if led_num == offset_sample:
                    offset_brightness = 255
                else:
                    offset_brightness = 0
                uh.set_pixel(x+5,y,base_brightness,10,offset_brightness)
                
        pass
    #Should probably typecheck on None, but making it -1 is easy and works
    def rgb_step_params_display(self,step,microstep):
        global skip_RGB_print_count
        global skip_RGB_print_state

        step_size = 18

        active_track = self.get_active_track()
        #This gets the names of each of the parameters for each drum
        params = active_track.base.__dataclass_fields__.keys()        
        #Then, get the number of parameters there are
        num_params = len(params)
        #But the digital drums and toms both have a weird, special
        # parameter, which needs corrected for. I'm sure there's
        # a more elegant way to do this, but ╮(─▽─)╭
        param_values = asdict(active_track.base).values()
        local_param_list = []
        for val in param_values:
            local_param_list.append(val)
        # Now, to get this particular step's offsets. Default to the active step, but iff step and microstep
        # are passed in, we need to use those instead
        if step == -1:
            param_step_values = asdict(active_track.get_current_microstep_data()).values()
        else:
            param_step_values = asdict(active_track.steps[step].get_data(microstep)).values()
            if skip_RGB_print_state == False:
                skip_RGB_print_count = 20
                skip_RGB_print_state = True
            
        local_step_param_list = []
        for val in param_step_values:
            local_step_param_list.append(val)

        if "sample" in params or "range_switch" in params:
            num_params = num_params - 1
            local_param_list.pop()
            local_step_param_list.pop()

        if "sample" in params:
            self.rgb_sample_select_display(step,microstep)
        
        #add the base value to the offset value, for showing on the display
        for i in range(0,num_params):
            local_step_param_list[i] += local_param_list[i]
        
        
        i = 0
        for x in range(17-num_params,17):
            next_base_step_off = False
            next_local_step_off = False
            for y in range(0,7): #TODO, the bar grapgh is going to need better code
                # all parameters are defined over the range of 0-127
                base_brightness = 0
                if local_param_list[i] > (y+1)*step_size:
                    base_brightness = 255
                else:
                    #Show the value in the diming
                    dim = (local_param_list[i]) % ((y+2)*step_size) 
                    dim = (dim * (256//step_size))
                    #This is a very hacky fix because I'm tired of dealing with quantization error
                    if dim > 1008:
                        dim += 10
                    base_brightness = dim%256
                    if next_base_step_off:
                        base_brightness = 0
                    next_base_step_off = True

                step_brightness = 0
                if local_step_param_list[i] > (y+1)*step_size:
                    step_brightness = 255
                else:
                    #Show the value in the diming
                    dim = (local_step_param_list[i]) % ((y+2)*step_size) 
                    dim = (dim * (256//step_size))
                    #This is a very hacky fix because I'm tired of dealing with quantization error
                    if dim > 1008:
                        dim += 10
                    step_brightness = dim%256
                    if next_local_step_off:
                        step_brightness = 0
                    next_local_step_off = True
                
                rgb = step_brightness//3,step_brightness//3,base_brightness//3

                uh.set_pixel(x,abs(6-y),*rgb)
            i += 1
            
#     _____                       
#    / ____|                      
#   | (___   ___  _ __   __ _ ___ 
#    \___ \ / _ \| '_ \ / _` / __|
#    ____) | (_) | | | | (_| \__ \
#   |_____/ \___/|_| |_|\__, |___/
#                        __/ |    
#                       |___/     

class Song:
    def __init__(self,modules):
        self.patterns = [[],[],[],[]]
        for i in range(4):
            for j in range(4):
                self.patterns[i].append(Pattern(4*i+j,modules))
        self.pattern_seq = []
        self.pattern = []
        self.pattern_seq_len = 7 #keep in mind this is 0 indexed!
        self.current_pattern = 0
        self.current_pattern_seq_step = 0
        self.pattern_locked = False
        self.display_mode = 0
        for i in range(8):
            # valid are "stay" "left" "right" "up" "down"
            self.pattern_seq.append("stay")
    
    def get_current_pattern(self):
        #return self.pattern[self.current_pattern]
        pattern_dict = {
            0:[0,0],1:[0,1],2:[0,2],3:[0,3],
            4:[1,0],5:[1,1],6:[1,2],7:[1,3],
            8:[2,0],9:[2,1],10:[2,2],11:[2,3],
            12:[3,0],13:[3,1],14:[3,2],15:[3,3],
        }
        pos = pattern_dict[self.current_pattern]
        p_row = self.patterns[pos[0]]
        pattern = p_row[pos[1]]
        #print("pattern {} at addr: {}".format(self.current_pattern, pattern))
        return pattern

    def advance_current_pattern_steps(self):
        self.get_current_pattern().advance_all_track_steps()
    
    def set_pattern_seq_step(self, step, dir): #step in the pattern seq, not a normal step
        #TODO add check for if step is less than len
        self.pattern_seq[step] = dir

    def set_pattern_seq_len(self, len):
        self.pattern_seq_len = len

    def flip_pattern_lock(self):
        self.pattern_locked = not self.pattern_locked
        if(self.pattern_locked == True):
            print("locked to pattern {}".format(self.current_pattern))
        else:
            print("un-locked pattern {}".format(self.current_pattern))

    def inc_pattern(self):
        if self.pattern_locked == False:
            if self.pattern_seq[self.current_pattern_seq_step] == "stay":
                self.current_pattern = self.current_pattern #literally don't do anything
            elif self.pattern_seq[self.current_pattern_seq_step] == "up":
                self.current_pattern = (self.current_pattern - 4)%16 # mod 16 needed in case we need to wrap around
            elif self.pattern_seq[self.current_pattern_seq_step] == "down":
                self.current_pattern = (self.current_pattern + 4)%16
            elif self.pattern_seq[self.current_pattern_seq_step] == "left":
                if self.current_pattern in {0,4,8,12}:
                    self.current_pattern = (self.current_pattern + 3)
                else:
                    self.current_pattern = (self.current_pattern - 1)
            elif self.pattern_seq[self.current_pattern_seq_step] == "right":
                if self.current_pattern in {3,7,11,15}:
                    self.current_pattern = (self.current_pattern - 3)
                else:
                    self.current_pattern = (self.current_pattern + 1)

            if self.current_pattern_seq_step < self.pattern_seq_len:
                self.current_pattern_seq_step = self.current_pattern_seq_step + 1 #increment
            else:
                self.current_pattern_seq_step = 0

    def force_pattern_left(self):
        if self.current_pattern in {0,4,8,12}:
            self.current_pattern = (self.current_pattern + 3)
        else:
            self.current_pattern = (self.current_pattern - 1)

    def force_pattern_right(self):
        if self.current_pattern in {3,7,11,15}:
            self.current_pattern = (self.current_pattern - 3)
        else:
            self.current_pattern = (self.current_pattern + 1)

    def force_pattern_up(self):
        self.current_pattern = (self.current_pattern - 4)%16

    def force_pattern_down(self):
        self.current_pattern = (self.current_pattern + 4)%16

    def force_pattern(self,direction):
        if direction == "up":
            self.force_pattern_up()
        elif direction == "down":
            self.force_pattern_down()
        elif direction == "left":
            self.force_pattern_left()
        elif direction == "right":
            self.force_pattern_right()
        else:
            print("Invalid force direction!")
        

    def show_pattern_seq(self):
        #TODO make current step brighter
        for i in range(8):
            x = i%4
            if i >= 4:
                y = 6
            else:
                y = 5

            if i > self.pattern_seq_len:
                rgb = 0,0,0
            elif self.pattern_seq[i] == "up":
                rgb = 31,0,0
            elif self.pattern_seq[i] == "down":
                rgb = 0,0,31
            elif self.pattern_seq[i] == "right":
                rgb = 0,31,0
            elif self.pattern_seq[i] == "left":
                rgb = 31,0,31
            elif self.pattern_seq[i] == "stay":
                rgb = 31,31,31

            if i == self.current_pattern_seq_step:
                rgb = tuple(map(mul, rgb, (8,8,8)))

            uh.set_pixel(x, y, *rgb)
            if self.pattern_locked:
                uh.set_pixel(4,5,255,0,0)
            else:
                uh.set_pixel(4,5,0,255,0)
            #uh.show()

    def show_patterngrid(self):
        for x in range(4):
            for y in range(4):
                x_curr = self.current_pattern % 4
                y_curr = self.current_pattern // 4
                if x == x_curr and y == y_curr: # stay
                    rgb = 31,31,31
                    if self.pattern_seq[self.current_pattern_seq_step] == "stay":
                        rgb = 255,255,255
                elif x==x_curr and y == (y_curr + 1)%4: #down
                    rgb = 0,0,31
                    if self.pattern_seq[self.current_pattern_seq_step] == "down":
                        rgb = 0,0,255
                elif x==x_curr and y == (y_curr - 1)%4: #up
                    rgb = 31,0,0
                    if self.pattern_seq[self.current_pattern_seq_step] == "up":
                        rgb = 255,0,0
                elif x==(x_curr - 1)%4 and y == y_curr: #left
                    rgb = 31,0,31
                    if self.pattern_seq[self.current_pattern_seq_step] == "left":
                        rgb = 255,0,255
                elif x==(x_curr + 1)%4 and y == y_curr: #right
                    rgb = 0,31,0
                    if self.pattern_seq[self.current_pattern_seq_step] == "right":
                        rgb = 0,255,0
                else:
                    rgb = 5,5,5

                uh.set_pixel(x, y, *rgb)
        #uh.show()

    def enter_patternseq_step(self,direction):
        global pattern_seq_step_loop
        # if w is held, each keypress set's the next pattern step, looping. The w checking happens in the key handler.
        if pattern_seq_step_loop > self.pattern_seq_len:
            pattern_seq_step_loop = 0
        self.pattern_seq[pattern_seq_step_loop] = direction
        pattern_seq_step_loop += 1


    def show_bpm(self):
        global bpm
        write_string(str(bpm),kerning=False)
    
    def show_track_num(self):
        write_string('TRK {}'.format(self.get_current_pattern().get_active_track_num()),kerning=False)
        #show()

    def show_track_name(self):
        write_string(self.get_current_pattern().get_active_track_name()+ " " +str(self.get_current_pattern().get_active_track_num()),kerning=False)
        #show()

    def rgb_step_display(self):
        self.get_current_pattern().rgb_step_display()
    
    def track_select_display(self):
        self.get_current_pattern().track_select_display()
    
    def update_display(self):
        global skip_RGB_print_count
        global skip_RGB_print_state
        global skip_print_count
        global skip_print_state
        global param_step
        global param_microstep
        # Clear the screen
        for x in range(0,17):
            for y in range(0,7):
                uh.set_pixel(x,y,0,0,0)

        if self.display_mode == 0:
            # STEP DISPLAY MODE
            # self.show_track_name()                          #GREEN
            if skip_print_count == 0:
                self.show_bpm()                             #GREEN
                skip_print_state = False
            else:
                skip_print_count = skip_print_count - 1
            self.rgb_step_display()                         #RGB
            self.show_pattern_seq()                         #RGB
            self.track_select_display()                     #RGB
            
        elif self.display_mode == 1:
            # PATTERN DISPLAY MODE
            if skip_print_count == 0:
                self.show_bpm()                             #GREEN
                skip_print_state = False
            else:
                skip_print_count = skip_print_count - 1
            self.show_patterngrid()                         #RGB
            self.show_pattern_seq()                         #RGB
            self.track_select_display()                     #RGB
            if skip_RGB_print_count == 0:
                self.rgb_step_params_display(-1,-1)         #RGB
                skip_RGB_print_state = False
            else:
                skip_RGB_print_count = skip_RGB_print_count - 1
                #print("skip print count = {}".format(skip_print_count))
                self.rgb_step_params_display(param_step,param_microstep)    #RGB
        # Seriously DO NOT call these any more than necessary, it tanks performance.
        uh.show()
        show()

    def change_display_mode(self,mode):
        self.display_mode = mode

    def rgb_step_params_display(self,step,microstep):
        self.get_current_pattern().rgb_step_params_display(step,microstep)

    def change_step_value(self,value_delta,step_num,microstep_num):
        self.get_current_pattern().change_step_value(value_delta,step_num,microstep_num)

    def change_base_value(self,value_delta):
        self.get_current_pattern().change_base_value(value_delta)
        

#         _       _        _               
#        | |     | |      | |              
#        | |_   _| | _____| |__   _____  __
#    _   | | | | | |/ / _ \ '_ \ / _ \ \/ /
#   | |__| | |_| |   <  __/ |_) | (_) >  < 
#    \____/ \__,_|_|\_\___|_.__/ \___/_/\_\
#                                          
#                                          

class Jukebox:
    def __init__(self,modules):
        self.active_song = 1
        self.songs = []
        self.playing = True
        for i in range(16):
            self.songs.append(Song(modules))
            # Attempt to load in all 16 saved songs from pickles
            self.songs[i] = file_check("songs/s{}.p".format(i))

    def get_active_song(self):
        return self.songs[self.active_song]
   
    def save_song(self,song_num):
        pickle.dump( self.songs[song_num], open( "songs/s{}.p".format(song_num), "wb" ) )
        pass
    
    def save_all_songs(self):
        for i in range(16):
            self.save_song(i)

    def restore_all_songs(self):
        for i in range(16):
            self.songs[i] = file_check("songs/s{}.p".format(i))

    def get_song(self, song_num):
        return self.songs[song_num]

    def change_song(self, song_num):
        self.active_song = song_num

    def inc_pattern(self):
        self.songs[self.active_song].inc_pattern()

    def flip_lock(self):
        self.songs[self.active_song].flip_pattern_lock()

    def play_pause_toggle(self):
        self.playing = not self.playing

    def is_locked(self):
        return self.songs[self.active_song].pattern_locked

    def get_active_pattern(self):
        return self.songs[self.active_song].get_current_pattern()

    def get_active_track(self):
        return self.get_active_pattern().get_active_track()

    def set_active_track(self,num):
        self.get_active_pattern().set_active_track(num)

    def flip_microstep(self,pos,micropos):
        self.get_active_track().flip_microstep(pos,micropos)

    def advance_step(self):
        self.songs[self.active_song].advance_current_pattern_steps()

    def update_display(self):
        self.songs[self.active_song].update_display()

    def change_display_mode(self,mode):
        # this is basically just shadowing songs' but is done so that
        # changing the song can go into the display mode that song was last
        # set to.
        self.songs[self.active_song].change_display_mode(mode)

    def change_step_value(self,value_delta,step_num,microstep_num):
        self.get_active_song().change_step_value(value_delta,step_num,microstep_num)

    def change_base_value(self,value_delta):
        self.get_active_song().change_base_value(value_delta)

    def force_pattern(self,direction):
        self.get_active_song().force_pattern(direction)

    def enter_patternseq_step(self,direction):
        self.get_active_song().enter_patternseq_step(direction)
        
#   ____  ____  __   ____  ____  _  _  ____ 
#  / ___)(_  _)/ _\ (  _ \(_  _)/ )( \(  _ \
#  \___ \  )( /    \ )   /  )(  ) \/ ( ) __/
#  (____/ (__)\_/\_/(__\_) (__) \____/(__)  

def show_startup(uh):
    write_string('VEGA',kerning=False)
    show()
    time.sleep(.3)
    write_string('REID',kerning=False)
    show()
    time.sleep(.3)
    write_string('KALEB',kerning=False)
    show()
    time.sleep(.3)
    write_string('COLE',kerning=False)
    show()
    time.sleep(.3)
    write_string("CAPSTONE '21-22         ",kerning=False)

    # Folowing code mostly stolen from https://github.com/pimoroni/unicornhatmini-python/blob/master/examples/text.py
    display_width, display_height = uh.get_shape()
    text = "Starting up..."
    font = ImageFont.truetype("./5x7.ttf", 8)
    text_width, text_height = font.getsize(text)
    image = Image.new('P', (text_width + display_width + display_width, display_height), 0)
    draw = ImageDraw.Draw(image)
    draw.text((display_width, -1), text, font=font, fill=255)
    offset_x = 0
    # This range value is deteremined experimentally to be just long enough to hide the startup time
    for t in range(120):
        scroll()
        show()
        time.sleep(0.03)

        for y in range(display_height):
            for x in range(display_width):
                hue = (time.time() / 10.0) + (x / float(display_width * 2))
                r, g, b = [int(c * 255) for c in hsv_to_rgb(hue, 1.0, 1.0)]
                if image.getpixel((x + offset_x, y)) == 255:
                    uh.set_pixel(x, y, r, g, b)
                else:
                    uh.set_pixel(x, y, 0, 0, 0)

        offset_x += 1
        if offset_x + display_width > image.size[0]:
            offset_x = 0

        uh.show()

    clear()
    uh.clear()
    time.sleep(1)

#   .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
#  | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
#  | |  ___  ____   | || |  _________   | || |  ____  ____  | || |   ______     | || |     ____     | || |      __      | || |  _______     | || |  ________    | |
#  | | |_  ||_  _|  | || | |_   ___  |  | || | |_  _||_  _| | || |  |_   _ \    | || |   .'    `.   | || |     /  \     | || | |_   __ \    | || | |_   ___ `.  | |
#  | |   | |_/ /    | || |   | |_  \_|  | || |   \ \  / /   | || |    | |_) |   | || |  /  .--.  \  | || |    / /\ \    | || |   | |__) |   | || |   | |   `. \ | |
#  | |   |  __'.    | || |   |  _|  _   | || |    \ \/ /    | || |    |  __'.   | || |  | |    | |  | || |   / ____ \   | || |   |  __ /    | || |   | |    | | | |
#  | |  _| |  \ \_  | || |  _| |___/ |  | || |    _|  |_    | || |   _| |__) |  | || |  \  `--'  /  | || | _/ /    \ \_ | || |  _| |  \ \_  | || |  _| |___.' / | |
#  | | |____||____| | || | |_________|  | || |   |______|   | || |  |_______/   | || |   `.____.'   | || ||____|  |____|| || | |____| |___| | || | |________.'  | |
#  | |              | || |              | || |              | || |              | || |              | || |              | || |              | || |              | |
#  | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
#   '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
# This is why this script needs to be ran as root....
#
### Workaround for down key events retriggering adapted from https://github.com/boppreh/keyboard/issues/158

key_state = defaultdict(lambda: 'up')
current_display_mode = 0

def pressed(name, event):
    return key_state[name] == 'up' and name == event.name and event.event_type == 'down'
def released(name, event):
    return key_state[name] == 'down' and name == event.name and event.event_type == 'up'
def held(name):
    return key_state[name] == 'held'

def handle_microstep(name):  #this is super ugly, but I can't think of a better way to do it.
    # if (released(name,event)):
    #     return
    
    if(name == "f9"):
        microstep_pos = 0
    elif(name == "f10"):
        microstep_pos = 1
    elif(name == "f11"):
        microstep_pos = 2
    elif(name == "f12"):
        microstep_pos = 3
    else:
        return

    mapping = {
        "1":0,"2":1,"3":2,"4":3,"5":4,"6":5,"7":6,"8":7,"f1":8,"f2":9,"f3":10,"f4":11,"f5":12,"f6":13,"f7":14,"f8":15
    }

    for key in mapping:
        if(key_state[key] == 'held'):
            J1.flip_microstep(mapping[key],microstep_pos)
            print("flipped step {}:{}::{}:{} ".format(J1.get_active_pattern,J1.get_active_track(),mapping[key],microstep_pos))

def change_step_param(name):
    global param_step
    global param_microstep
    global param_index
    #TODO: These need changed when the QMK code get's fixed later
    if(name == "g"):
        delta = 1
    elif(name == "h"):
        delta = -1
    else:
        delta = 0

    step_mapping = {
        "1":0,"2":1,"3":2,"4":3,"5":4,"6":5,"7":6,"8":7,"f1":8,"f2":9,"f3":10,"f4":11,"f5":12,"f6":13,"f7":14,"f8":15
    }

    microstep_mapping = {
        "f9":0,"f10":1,"f11":2,"f12":3
    }

    # Which step
    for step_key in step_mapping:
        if(key_state[step_key] == 'held'):
            # Which microstep
            for microstep_key in microstep_mapping:
                if(key_state[microstep_key] == 'held' ):
                    param_step = step_mapping[step_key]
                    param_microstep = microstep_mapping[microstep_key]
                    #print("Kep pressed, Changing Param of Step {}:{}, Delta of {}".format(step_mapping[step_key],microstep_mapping[microstep_key],delta))
                    J1.change_step_value(delta,step_mapping[step_key],microstep_mapping[microstep_key])


def change_base_param(name):
    global param_index
    if(name == "t"):
        delta = 1
    elif(name == "y"):
        delta = -1
    else:
        delta = 0

    J1.change_base_value(delta)

def change_param_index(name):
    global param_index
    if name == "u":
        param_index += 1
    elif name == "i":
        param_index -= 1
    else:
        pass

def change_track(name):
    global skip_print_count
    global skip_print_state
    track_mapping = {
        "1":0,"2":1,"3":2,"4":3,"5":4,"f1":5,"f2":6,"f3":7,"f4":8,"f5":9
    }
    for track_key in track_mapping:
        if(key_state["q"] == 'held'):
            if(track_key == name):
                J1.set_active_track(track_mapping[track_key])
                J1.get_active_song().show_track_name()
                skip_print_count = 30
                skip_print_state = True
                show()
                print("changed track")

def change_bpm(name):
    global bpm
    global bpm_recently_updated
    if(name == "j"):
        bpm = int(bpm+2)
        if bpm <= 0:
            bpm = 0
        else:
            print("BPM decremented")
        write_string(str(bpm),kerning=False)
        bpm_recently_updated = True
        show()
    elif(name == "k"):
        bpm = int(bpm-2)
        print("BPM incremented")
        write_string(str(bpm),kerning=False)
        bpm_recently_updated = True
        show()

def change_display_mode(name):
    if(name == "d"):
        global current_display_mode
        current_display_mode = (current_display_mode + 1)%2
        J1.change_display_mode(current_display_mode)
        print("Display Mode Changed")

def pattern_handler(name):
    if name in ["up","down","left","right","r"]:
        if key_state["w"] == 'held':
            if name == 'r':
                direction = "stay"
            else:
                direction = name
            J1.enter_patternseq_step(direction)
        else:
            if name != "r": #only for pattern seq
                J1.force_pattern(name)

def save_all_songs(name):
    if name == "s":
        previous_state = J1.playing
        J1.playing = False
        write_string("Saving",kerning=False)
        J1.save_all_songs()
        J1.playing = previous_state

def restore_all_songs(name):
    if name == "z":
        previous_state = J1.playing
        J1.playing = False
        write_string("Restor",kerning=False)
        J1.restore_all_songs()
        J1.playing = previous_state

def change_song(name):
    # Use same mapping as for sequencer
    mapping = { "1":0,"2":1,"3":2,"4":3,"5":4,"6":5,"7":6,"8":7,"f1":8,"f2":9,"f3":10,"f4":11,"f5":12,"f6":13,"f7":14,"f8":15 }
    for key in mapping:
        if(key_state["a"] == 'held'):
            if(key == name):
                previous_state = J1.playing
                J1.playing = False
                print(f"changing song to {mapping[key]}")
                write_string(f"Song{mapping[key]}",kerning=False)
                J1.change_song(mapping[key])
                J1.playing = previous_state

def copy_paste_track_steps(name):
    global temp_steps
    global copy_type
    if name == "c" or name == "v" or name == "b":
        if name == "c":
            print("Copied Track")
            write_string("COPY!",kerning=False)
            temp_steps = copy.deepcopy(J1.get_active_track().steps)
            copy_type = type(J1.get_active_track())
        if name == "b":
            print("Copied Track")
            write_string("~COPY!",kerning=False)
            temp_steps = J1.get_active_track().steps
            copy_type = type(J1.get_active_track())
        if name == "v":
            if temp_steps == None:
                write_string("ERR:",kerning=False)
                time.sleep(0.3)
                write_string("no buf",kerning=False)
                time.sleep(0.3)
                return
            if type(J1.get_active_track()) != copy_type:
                write_string("ERR:",kerning=False)
                time.sleep(0.3)
                write_string("wrong",kerning=False)
                time.sleep(0.3)
                write_string("type!",kerning=False)
                time.sleep(0.3)
                print(f"active track:{type(J1.get_active_track())} != {copy_type}")
                return
            print("Pasting Track")
            write_string("PASTE!",kerning=False)
            J1.get_active_track().steps = temp_steps



def handler(event: keyboard.KeyboardEvent):
    if (key_state[event.name] == 'down' and event.event_type == 'down'):
        key_state[event.name] = 'held'
        return

    if (key_state[event.name] == 'held' and event.event_type == 'up'):
        key_state[event.name] = event.event_type
        return

    if pressed(event.name, event):
        print('pressed', event.name)
        if(event.name == "l"):
            J1.flip_lock()
        if(event.name == "space"):
            print("PLAY/PAUSE TOGGLED")
            J1.play_pause_toggle()
        change_track(event.name)
        change_display_mode(event.name)
        change_bpm(event.name)
        change_param_index(event.name)
        change_step_param(event.name) 
        change_base_param(event.name)
        handle_microstep(event.name)
        pattern_handler(event.name)
        save_all_songs(event.name)
        restore_all_songs(event.name)
        change_song(event.name)
        copy_paste_track_steps(event.name)


    if released(event.name, event):
        #This means released without being held, a quick 'tap'
        print('released', event.name)

    if held(event.name):
        #print('held', event.name)
        return

    key_state[event.name] = event.event_type

#                                                                               
#                ,,                                   ,,    ,,                  
#    .g8"""bgd `7MM                       `7MM      `7MM    db            mm    
#  .dP'     `M   MM                         MM        MM                  MM    
#  dM'       `   MMpMMMb.  .gP"Ya   ,p6"bo  MM  ,MP'  MM  `7MM  ,pP"Ybd mmMMmm  
#  MM            MM    MM ,M'   Yb 6M'  OO  MM ;Y     MM    MM  8I   `"   MM    
#  MM.           MM    MM 8M"""""" 8M       MM;Mm     MM    MM  `YMMMa.   MM    
#  `Mb.     ,'   MM    MM YM.    , YM.    , MM `Mb.   MM    MM  L.   I8   MM    
#    `"bmmmd'  .JMML  JMML.`Mbmmd'  YMbmd'.JMML. YA..JMML..JMML.M9mmmP'   `Mbmo 
#                                                                               
#   This is the code that makes sure everything is working, before we get off the ground

def check_input():
    if exists("/dev/hidraw0"):
        print("Handwired Keyboard Detected")
    else:
        write_string('KB1 NF',kerning=False)
        show()
        time.sleep(1.5)
        print("[bold red]Handwired Keyboard NOT found[bold red]")
        sys.exit()

    if exists("/dev/hidraw1"): #
        print("BDN9 Keyboard Detected")
    else:
        write_string('KB2 NF',kerning=False)
        show()
        time.sleep(1.5)
        print("[bold red]BDN9 Keyboard NOT found[bold red]")
        sys.exit()
    # checking /dev/hidraw* may not be consistant, and the tested keyboard actually creates hidraw0 and hidraw1, but reading from /dev/usb didn't
    # seem to be as consistant, or was at the very least slower. If it needs changed later so be it

PD_running = False

while PD_running == False:
    #`purr-data -nogui -open X.pd`
    # purr-data -nogui -open dsponfix.pd
    for proc in psutil.process_iter(['name']):
        if proc.info["name"] == "purr-data":
            PD_running = True
            break
    if PD_running:
        break
    time.sleep(.5)
    print("PD not yet running")

if PD_running:
    print("PD is running, initalizing MIDI")
    time.sleep(.25)
    port = mido.open_output("Pure Data Midi-In 1")

port_pico = mido.open_output("Pico MIDI 1")

check_input()

#TODO check for connection to pico

#TODO check and see what analog drums are connected.

hook = keyboard.hook(handler)

from multiprocessing import Process
p = Process(target=show_startup, args=(uh,))
p.start()

#  ______            __    __               _____            __                  __                           
# /      |          /  |  /  |             /     |          /  |                /  |                          
# $$$$$$/  _______  $$/  _$$ |_            $$$$$ | __    __ $$ |   __   ______  $$ |____    ______   __    __ 
#   $$ |  /       \ /  |/ $$   |              $$ |/  |  /  |$$ |  /  | /      \ $$      \  /      \ /  \  /  |
#   $$ |  $$$$$$$  |$$ |$$$$$$/          __   $$ |$$ |  $$ |$$ |_/$$/ /$$$$$$  |$$$$$$$  |/$$$$$$  |$$  \/$$/ 
#   $$ |  $$ |  $$ |$$ |  $$ | __       /  |  $$ |$$ |  $$ |$$   $$<  $$    $$ |$$ |  $$ |$$ |  $$ | $$  $$<  
#  _$$ |_ $$ |  $$ |$$ |  $$ |/  |      $$ \__$$ |$$ \__$$ |$$$$$$  \ $$$$$$$$/ $$ |__$$ |$$ \__$$ | /$$$$  \ 
# / $$   |$$ |  $$ |$$ |  $$  $$/       $$    $$/ $$    $$/ $$ | $$  |$$       |$$    $$/ $$    $$/ /$$/ $$  |
# $$$$$$/ $$/   $$/ $$/    $$$$/         $$$$$$/   $$$$$$/  $$/   $$/  $$$$$$$/ $$$$$$$/   $$$$$$/  $$/   $$/ 
#                                                                                                             

# "BD","TOM","SNARE","HAT","FM", or "DRONE". There can be duplicates. Order matters.

# modules = ["BD","TOM","SNARE","HAT","FM"]
modules = ["BD","FM","SNARE","HAT","TOM"]

J1 = Jukebox(modules)
# # This Jukebox object contains 16 songs, each song contains 16 patterns, each pattern 10 tracks/drums,
# # each track/drum 16 steps, and each step has 4 'micro steps'
# # Because of this, this jukebox object is actually fairly large - 163840 microsteps (bools) in total
# # and that's before considering the other data stored per step per drum


#    _____ _            _     ___   ___  ____  
#   |_   _| |__   ___  | |   / _ \ / _ \|  _ \ 
#     | | | '_ \ / _ \ | |  | | | | | | | |_) |
#     | | | | | |  __/ | |__| |_| | |_| |  __/ 
#     |_| |_| |_|\___| |_____\___/ \___/|_|    
#     
# This is the beating heart

p.join()
start_time = time.time()
correction = 0
first_run = True

while True:
    if J1.playing == True:
        #TODO make BPM offset time update per step.
        #This *might* not work due to the very low sleep values
        #but it's worth trying.
        #If nothing else, it should probably be every 8 microsteps or so.
        current_time = time.time()
        elapsed = current_time - start_time
        #print("Last loop took {} seconds".format(elapsed))
        actual_bpm = (1/(elapsed/16))*60
        if(first_run): # We need to ignore the first garbage run
            actual_bpm = bpm
            first_run = False
        #print("That is {} BPM".format(actual_bpm))
        start_time = time.time()
        # Timing correction. This may take a while to converge
        # Changing the porportional value here may help improve convergence time,
        # At the cost of overshoot/settling time
        if(actual_bpm < bpm): #if to slow, we need to speed up
            #print("bpm to slow, correcting by {}".format(correction))
            correction += .0006 * abs(bpm-actual_bpm)
        else:
            #print("bpm to fast, correcting by {}".format(correction))
            correction -= .0006 * abs(bpm-actual_bpm)

        for i in range(64):
            sleepy_time = 60/(bpm*4) # This needs to be a responsive control, hence it being placed in here
            sleepy_time -= (.01+correction) 
            #time.sleep is in SECONDS not milliseconds
            time.sleep(sleepy_time) # roughly 120bpm

            J1.advance_step()
            J1.update_display()
            #If pause is hit, we need to stop immediately, but the outside stuff needs captured
            #too. This is probably bad to check it twice like this, but ╮(─▽─)╭
            if J1.playing == False:
                break

            if(J1.is_locked()==False and i == 63):
                print("Pattern Incremented")
                J1.inc_pattern()
    else:
        first_run = True
        time.sleep(.05)
        J1.update_display()
    #print("pattern at addr: {}".format(J1.get_active_pattern()))

