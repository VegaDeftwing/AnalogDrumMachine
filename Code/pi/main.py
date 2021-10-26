from microdotphat import write_string, scroll, set_pixel, clear, show, WIDTH, HEIGHT # Microdot phat (text mostly)
# See https://learn.pimoroni.com/article/getting-started-with-micro-dot-phat
from gpiozero import Button #Unicorn Hat Buttons
from unicornhatmini import UnicornHATMini #Unicorn Hat LEDs
from colorsys import hsv_to_rgb
from PIL import Image, ImageDraw, ImageFont
# The unicorn hat library has a built in font - see https://github.com/pimoroni/unicornhatmini-python/blob/master/examples/text.py
# This shouldn't be necessary since the microdot phat does text much better, but it's nice to have the option

import sched, time # needed for event scheduling - see http://pymotw.com/2/sched/ - This should really only be used for sending the MIDI data
from os.path import exists
import pickle

#from pyo import * #DSP stuff

from rich import pretty, print
import pretty_errors
pretty.install()
import sys

def clamp(n, minn, maxn):
    return max(min(maxn, n), minn)

def midiclamp(n):
    return clamp(n, 0, 127)

# modified from https://stackoverflow.com/questions/8380006/file-open-function-with-try-except-python-2-7-1/8380019
def filecheck(fn):
    try:
      return(pickle.load(open( fn, "rb" )))
    except IOError:
      print("Error: File '{}' does not appear to exist.".format(fn))
      return(0)

class Drum:
    def __init__(self,type):
        self.offsets = [0,0,0,0,0,0] #7-bit offsets. These are the per-step locks
        self.analog = type

class AnalogDrum(Drum):
    def __init__(self):
        self.present = False
        super().__init__(True)
    pass

class BassDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass

class TomDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass
class SnareDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass

class HiHatDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass
class FMDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass
class DroneDrumModule(AnalogDrum):
    def __init__(self):
        pass
    pass

class KSDrumModule(AnalogDrum): #Karplus Strong
    def __init__(self):
        pass
    pass

class DigitalDrum(Drum):
    def __init__(self):
        self.sample = [0,0] #[%5,%15] #TODO update product spec, moving pattern lock state to give as many sample banks as sample slots
        self.volume = 127
        self.pitch = 63
        self.pan = 63
        self.srr = 63 #sample rate reduction
        self.e1 = 0 #effect 1 depth
        self.e2 = 0 # effect 2 depth
        super().__init__(False)
    def setsamplebank():
        #%35
        pass
    def setsample():
        #%15
        pass
    def sete1():
        pass
    def sete2():
        pass

class MicroStep:
    def __init__(self,drum):
        self.microstep = False
        self.drum = drum
        self.offsets = [0,0,0,0,0,0]
        if type(drum) is DigitalDrum:
            self.sample = [0,0]
        if type(drum) is AnalogDrum:
            if type(drum) is BassDrumModule:
                pass
            elif type(drum) is TomDrumModule:
                self.model = 0 # 0=low, 1=mid 2=hi - uses same LEDs as sample selection from digital drum
            elif type(drum) is SnareDrumModule:
                pass
            elif type(drum) is HiHatDrumModule:
                pass
            elif type(drum) is FMDrumModule:
                pass
            elif type(drum) is DroneDrumModule:
                pass
            elif type(drum) is KSDrumModule:
                pass
    
    def setmicrostep(self,state):
        self.microstep = state

    def flipmicrostep(self):
        self.microstep = not self.microstep
    
    def getmicrostep(self):
        return self.microstep

    #edge cases
    #TODO tom drum has an analog mux that needs set per step
    #TODO 

        
class Step:
    def __init__(self,drum):
        self.step = []
        self.active = False
        self.drum = drum
        for i in range(4):
            self.step.append(MicroStep(self.drum))
    
    def flipmicrostep(self, pos):
        self.step[pos].flipmicrostep()

        for i in range(4):
            if self.step[i].getmicrostep():
                self.active = True
                break
        else:
            self.active = False

    def zerostep(self):
        for i in range(4):
            self.step[i].setmicrostep(False)
        
        self.active = False
    
    def getmicrosteps(self):
        return [self.step[0].getmicrostep(),self.step[1].getmicrostep(),self.step[2].getmicrostep(),self.step[3].getmicrostep()]

    def getactive(self):
        return self.active
        
class Track:
    def __init__(self, clock, active, number, type):
        self.number = number
        self.steps = []
        self.clock = clock
        self.active = active
        if type == "analog":
            self.drum = AnalogDrum()
        elif type == "digital":
            self.drum = DigitalDrum()
        else:
            sys.exit('Provided drum type needs to be either "analog" or "digital"')

        for i in range(16): #16 steps per track
            self.steps.append(Step(self.drum))


    def getmicrossteps(self, pos):
        return self.steps[pos].getmicrosteps()

    def flipwholestep(self, pos):
        if self.steps[pos].getactive() is False:
            self.steps[pos].flipmicrostep(0)
        else:
            self.steps[pos].zerostep()

    def flipmicrostep(self,pos,micropos):
        self.steps[pos].flipmicrostep(micropos)

    def printallsteps(self):
        print("--------- Track number {} -----------".format(self.number))
        for i in range(16):
            print('step {0:2d} - active = {1} : {2}' .format(i, self.steps[i].getactive(), self.getmicrossteps(i)))

class Pattern:
    def __init__(self,id):
        self.tracks = []
        self.id = id
        for i in range(0,5):
            #tracks default to clock=1 (base) active=True
            self.tracks.append(Track(1,True,i,"analog"))
        for i in range(5,10):
            self.tracks.append(Track(1,True,i,"digital"))

class Song:
    def __init__(self):
        self.patterns = [[],[],[],[]]
        for i in range(4):
            for j in range(4):
                self.patterns[i].append(Pattern(4*i+j))

class Jukebox:
    def __init__(self):
        self.songs = []
        for i in range(16):
            self.songs.append(Song())
            # Attempt to load in all 16 saved songs from pickles
            self.songs[i] = filecheck("songs/s{}.p".format(i))

    def savesong(self,songnum):
        pickle.dump( self.songs[songnum], open( "songs/s{}.p".format(songnum), "wb" ) )
    
    def saveallsongs(self):
        for i in range(16):
            self.savesong(i)
        

def showStartup(uh):
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

def checkInput():
    if exists("/dev/hidraw0"):
        print("Handwired Keyboard Detected")
    else:
        write_string('KB1 NF',kerning=False)
        show()
        time.sleep(.5)
        print("[bold red]Handwired Keyboard NOT found[bold red]")

    if exists("/dev/hidraw1"): #
        print("BDN9 Keyboard Detected")
    else:
        write_string('KB2 NF',kerning=False)
        show()
        time.sleep(.5)
        print("[bold red]BDN9 Keyboard NOT found[bold red]")
    # checking /dev/hidraw* may not be consistant, and the tested keyboard actually creates hidraw0 and hidraw1, but reading from /dev/usb didn't
    # seem to be as consistant, or was at the very least slower. If it needs changed later so be it


J1 = Jukebox()
# This Jukebox object contains 16 songs, each song contains 16 patterns, each pattern 10 tracks,
# each track 16 steps & an associated drum, and each step has 4 'micro steps'
# Because of this, this jukebox object is actually fairly large - 163840 microsteps (bools) in total.

J1.saveallsongs()
uh = UnicornHATMini()
# showStartup(uh)

# TODO this is still a tad illogical, as it ties the analog modules id, sample, etc to each pattern, even though it really should be tied to a song
# Also, once that id is tied to the song, that probably makes it necessary to display a scrolling message on the display saying what module needs to be
# in what slot for a saved song, probably with the option to override that and lose data. That could be messy.
# This also dosen't yet make it possible to change parameters of the drums per step/microstep.

# First things first, we need to ensure connection to all the peripherals, if they're not there, complain loudly.
#
# Check Hats (MicroDot, Unicorn)

# Will add if necessary, as is, I'm not really worried about this failing.

# Check Keyboards (BDN9 and Alpha)
checkInput()
# Check Connection to Pico

# Next, we need to ensure PureData has started up and is running

# Then, we need to establish communication with PD via OSC

# Everything is working, load song from slot 0 if it exists


# check if an extenal MIDI clock is connected to the Pico

# check what module are connected to the drum bus

# Check what modules are connected to the effects bus

# Proclaim Joy for system is ready to start - flash all LEDs with fancy pattern. Helps find any dead LEDs

# 

