#HOLDS LATEST VERSION OF code.py

import time
import usb_midi
import adafruit_midi
from adafruit_midi.control_change import ControlChange
from adafruit_midi.note_off import NoteOff
from adafruit_midi.note_on import NoteOn
import board
import digitalio
import busio

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
hiHatState = False
snareState = False
fmDrumState = False
tomDrumState = False

print(usb_midi.ports)
midi = adafruit_midi.MIDI(
    midi_in=usb_midi.ports[0],
    in_channel=(0, 1, 2, 3, 4),
    midi_out=usb_midi.ports[1],
    out_channel=0,
)
print("Midi test")
# Convert channel numbers at the presentation layer to the ones musicians use
while True:
    msg = midi.receive()
    if msg is not None:
        print(msg.channel)
        if (msg.channel == 0):  # Channel 1 - Bass Drum
            if type(msg) == ControlChange: #decay
                print(msg.value)
                if(msg.control == 0):
                    channel1i2c = busio.I2C(board.GP3, board.GP2)
                    while not channel1i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        decay = msg.value
                        registerValue *= 16
                        byteList = [registerValue, decay]
                        print(byteList)
                        #writing to digipot
                        channel1i2c.writeto(chipAddress, bytes(byteList))
                    except:
                        pass
                    finally:
                        channel1i2c.unlock()
                        channel1i2c.deinit()
            elif type(msg) == NoteOn:
                led0.value = True
                bassDrumState = not bassDrumState
                trig0.value = bassDrumState
                channel1i2c = busio.I2C(board.GP3, board.GP2)
                while not channel1i2c.try_lock():
                        pass
                try:
                    registerValue = 0x00
                    frequency = msg.note
                    level = msg.velocity
                    registerValue *= 16
                    byteList = [registerValue, 1]
                    print(byteList)
                    #writing to digipot
                    channel1i2c.write(0x2F, bytes(byteList)) #frequency
                except:
                    pass
                finally:
                    channel1i2c.unlock()
                    channel1i2c.deinit()
            elif type(msg) == NoteOff:
                led0.value = False
                pass
        elif msg.channel == 1: #Channel 2 - FM Drum - NOT INCLUDED IN FINAL DEMO
            if(type(msg) == ControlChange):
                if(msg.control == 0): #digi 2 (U3 wiper 0)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 1): #digi 1 (U3 wiper 1)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 2): #digi 4 (U6 wiper 0)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 3): #digi 3 (U6 wiper 1)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 4): #buffer pot (U7 wiper 0)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
                if(msg.control == 5): #APC1 out (U7 wiper 1)
                    channel2i2c = busio.I2C(board.GP7, board.GP6)
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
                    except:
                        pass
                    finally:  # unlock the i2c bus when ctrl-c'ing out of the loop
                        channel2i2c.unlock()
            elif type(msg) == NoteOn:
                led1.value = True
                fmDrumState = not fmDrumState
                trig1.value = fmDrumState
            elif type(msg) == NoteOff:
                led1.value = False
                pass
        elif(msg.channel == 2): #Channel 3 - Snare
            if(type(msg) == NoteOn):
                channel3i2c = busio.I2C(board.GP11, board.GP10)
                print(msg.channel)
                led2.value = True
                snareState = not snareState
                trig2.value = False
                print("This Print Is Acting As A Delay") #Do not remove!!!!
                trig2.value = True
                print(msg.note)
                print(msg.velocity)
                print("Next")

                while not channel3i2c.try_lock():
                        pass
                try:
                    register0Value = 0x00
                    register1Value = 0x01
                    snareFreq = msg.note
                    snareLevel = msg.velocity
                    register1Value *= 16
                    byteList = [register0Value, snareFreq]
                    print(byteList)
                    #writing to digipot
                    channel3i2c.writeto(0x2F, bytes(byteList))

                    byteList = [register1Value, snareLevel]
                    print(byteList)
                    channel3i2c.writeto(0x2F, bytes(byteList))
                except:
                    pass
                finally:
                    channel3i2c.unlock()
                    channel3i2c.deinit()
            elif type(msg) == NoteOff:
                led2.value = False
        if(msg.channel == 3): #Channel 4 - HiHat
            highHatDeviceAddress = 0x2F
            if type(msg) == NoteOn:
                channel4i2c = busio.I2C(board.GP15, board.GP14)
                print(msg.channel)
                led3.value = True
                trig3.value = False
                print("This Print Is Acting As A Delay") #Do not remove!!!!
                trig3.value = True
                print(msg.note)
                print(msg.velocity)
                print("Next")

                while not channel4i2c.try_lock():
                        pass
                try:
                    register0Value = 0x00
                    register1Value = 0x01
                    hiHatDecay = msg.note
                    hiHatLevel = msg.velocity
                    register1Value *= 16
                    byteList = [register0Value, hiHatDecay]
                    print(byteList)
                    #writing to digipot
                    channel4i2c.writeto(highHatDeviceAddress, bytes(byteList))

                    byteList = [register1Value, hiHatLevel]
                    print(byteList)
                    channel4i2c.writeto(highHatDeviceAddress, bytes(byteList))
                except:
                    pass
                finally:
                    channel4i2c.unlock()
                    channel4i2c.deinit()
            elif type(msg) == NoteOff:
                led3.value = False
                #  trig0.value = True
                pass
        elif (msg.channel == 4):  # Channel 5 - Bass Drum
            if type(msg) == ControlChange: #decay
                print(msg.value)
                if(msg.control == 0):
                    channel5i2c = busio.I2C(board.GP19, board.GP18)
                    while not channel1i2c.try_lock():
                        pass
                    try:
                        registerValue = 0x01
                        decay = msg.value
                        registerValue *= 16
                        byteList = [registerValue, decay]
                        print(byteList)
                        #writing to digipot
                        channel5i2c.writeto(chipAddress, bytes(byteList))
                    except:
                        pass
                    finally:
                        channel5i2c.unlock()
                        channel5i2c.deinit()
            elif type(msg) == NoteOn:
                led4.value = True
                bassDrumState = not bassDrumState
                trig4.value = bassDrumState
                channel5i2c = busio.I2C(board.GP19, board.GP18)
                while not channel5i2c.try_lock():
                        pass
                try:
                    registerValue = 0x00
                    frequency = msg.note
                    level = msg.velocity
                    registerValue *= 16
                    byteList = [registerValue, frequency]
                    print(byteList)
                    #writing to digipot
                    channel5i2c.write(0x2F, bytes(byteList)) #frequency
                except:
                    pass
                finally:
                    channel5i2c.unlock()
                    channel5i2c.deinit()
            elif type(msg) == NoteOff:
                led4.value = False
                pass
