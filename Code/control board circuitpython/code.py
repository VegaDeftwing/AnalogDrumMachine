# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT
# simple_test
import time

# import random
import usb_midi
import adafruit_midi
from adafruit_midi.control_change import ControlChange
from adafruit_midi.note_off import NoteOff
from adafruit_midi.note_on import NoteOn
#from adafruit_midi.pitch_bend import PitchBend
import board
import digitalio


import busio

channel1i2c = busio.I2C(board.GP3, board.GP4)
channel2i2c = busio.I2C(board.GP7, board.GP6)
channel3i2c = busio.I2C(board.GP11, board.GP10)
channel4i2c = busio.I2C(board.GP15, board.GP14)
channel5i2c = busio.I2C(board.GP19, board.GP18)

chipAddress = 0x2F #default address for module with only one digipot

fmChipAddress0 = 0x2F
fmChipAddress1 = 0x2E
fmChipAddress2 = 0x2D

led0 = digitalio.DigitalInOut(board.GP25) #Channel 1 LED
led0.direction = digitalio.Direction.OUTPUT
led1 = digitalio.DigitalInOut(board.GP26)
led1.direction = digitalio.Direction.OUTPUT #Channel 2 LED
led2 = digitalio.DigitalInOut(board.GP27)
led2.direction = digitalio.Direction.OUTPUT #Channel 3 LED
led3 = digitalio.DigitalInOut(board.GP28)
led3.direction = digitalio.Direction.OUTPUT #Channel 4 LED
led4 = digitalio.DigitalInOut(board.A3) #GP29 as it's labeled on the PCB is actually A3 here.
led4.direction = digitalio.Direction.OUTPUT #Channel 5 LED
# Triggers are on pins 5,9,13,17,21
trig0 = digitalio.DigitalInOut(board.GP5)
trig0.direction = digitalio.Direction.OUTPUT
trig1 = digitalio.DigitalInOut(board.GP9)
trig1.direction = digitalio.Direction.OUTPUT
trig2 = digitalio.DigitalInOut(board.GP13)
trig2.direction = digitalio.Direction.OUTPUT
trig3 = digitalio.DigitalInOut(board.GP17)
trig3.direction = digitalio.Direction.OUTPUT
trig4 = digitalio.DigitalInOut(board.GP21)
trig4.direction = digitalio.Direction.OUTPUT

bassDrumState = False

print(usb_midi.ports)
midi = adafruit_midi.MIDI(
    midi_in=usb_midi.ports[0],
    in_channel=(0, 1, 2, 3, 4),
    midi_out=usb_midi.ports[1],
    out_channel=0,
)
print("Midi test")
# Convert channel numbers at the presentation layer to the ones musicians use
# print("Default output channel:", midi.out_channel + 1)
# print("Listening on input channel:", midi.in_channel + 1)
while True:
    msg = midi.receive()
    if msg is not None:
        if (msg.channel == 0):  # Channel 1 - Bass Drum
            if type(msg) == ControlChange: #decay
                print(msg.value)
                if(msg.control == 0):
                    while not channel1i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        decay = msg.value
                        registerValue *= 16
                        byteList = [registerValue, decay]
                        print(byteList)
                        #writing to digipot
                        channel1i2c.writeto(chipAddress, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel1i2c.unlock()
            elif type(msg) == NoteOn:
                led0.value = True
                bassDrumState = not bassDrumState
                trig0.value = bassDrumState
                while not channel1i2c.try_lock():
                        pass
                try:
                    registerValue = 0x00
                    frequency = msg.note
                    level = msg.velocity
                    registerValue *= 16
                    byteList = [registerValue, frequency]
                    print(byteList)
                    #writing to digipot
                    channel1i2c.writeto(chipAddress, bytes(byteList))
                finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                    channel1i2c.unlock()
            elif type(msg) == NoteOff:
                led0.value = False
                pass
        elif msg.channel == 1: #Channel 2 - FM Drum
            if(type(msg) == ControlChange):
                if(msg.control == 0): #digi 2 (U3 wiper 0)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress0, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 1): #digi 1 (U3 wiper 1)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress0, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()

                if(msg.control == 2): #digi 4 (U6 wiper 0)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress1, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()

                if(msg.control == 3): #digi 3 (U6 wiper 1)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress1, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()

                if(msg.control == 4): #buffer pot (U7 wiper 0)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress2, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 5): #APC1 out (U7 wiper 1)
                    while not channel2i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel2i2c.writeto(fmChipAddress2, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
            elif type(msg) == NoteOn:
                led1.value = True
                bassDrumState = not bassDrumState
                trig1.value = bassDrumState
            elif type(msg) == NoteOff:
                led1.value = False
                pass
        elif(msg.channel == 2): #Channel 3 - Snare
            if(type.msg == ControlChange):
                if(msg.control == 0): #digi 1
                    while not channel3i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel3i2c.writeto(chipAddress, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel3i2c.unlock()
                if(msg.control == 1): #digi 2
                    while not channel3i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel3i2c.writeto(chipAddress, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel3i2c.unlock()
            elif type(msg) == NoteOn:
                led2.value = True
                snareState = not snareState
                trig2.value = snareState
            elif type(msg) == NoteOff:
                led2.value = False
                #  trig0.value = True
                pass
        if(msg.channel == 3): #Channel 4 - HiHat
            if type(msg) == NoteOn:
                led3.value = True
                hiHatState = not hiHatState
                trig3.value = hiHatState

                while not channel4i2c.try_lock():
                        pass
                try:
                    register0Value = 0x00
                    register1Value = 0x01
                    hiHatDecay = msg.note
                    hiHatLevel = msg.velocity
                    registerValue *= 16
                    byteList = [register0Value, hiHatDecay]
                    #print(byteList)
                    #writing to digipot
                    channel4i2c.writeto(chipAddress, bytes(byteList))

                    byteList = [register1Value, hiHatLevel]
                    channel4i2c.writeto(chipAddress, bytes(byteList))
                finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                    channel4i2c.unlock()
            elif type(msg) == NoteOff:
                led3.value = False
                #  trig0.value = True
                pass
        if(msg.channel == 4): #Channel 5 - Tom Drum
            if type(msg) == ControlChange:
                led4.value = True
                print(msg.value)

                if(msg.control == 0):
                    while not channel5i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x00
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel5i2c.writeto(chipAddress, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel5i2c.unlock()
                elif(msg.control == 1):
                    while not channel5i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        digiPotValue = msg.value
                        registerValue *= 16
                        byteList = [registerValue, digiPotValue]
                        print(byteList)
                        #writing to digipot
                        channel5i2c.writeto(chipAddress, bytes(byteList))
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel5i2c.unlock()
            elif type(msg) == NoteOn:
                led4.value = True
                bassDrumState = not bassDrumState
                trig0.value = bassDrumState
            elif type(msg) == NoteOff:
                #trig0.value = True
                led4.value = False
                pass
    else:
        #led.value = False
        print("Error: Null Message")
    # print("Received:", msg, "at", time.monotonic())
