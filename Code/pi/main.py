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



uh = UnicornHATMini()
uh.set_brightness(0.5)

bpm = 300 # This is the default value
sleepytime = (1/bpm)/4

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
    def __init__(self,name):
        self.name = name
        self.offsets = [0,0,0,0,0,0] #7-bit offsets. These are the per-step locks

class AnalogDrum(Drum):
    def __init__(self,name):
        
        super().__init__(name)
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

class DigitalDrum(Drum):
    def __init__(self,name):
        self.sample = [0,0] #[%5,%15] #TODO update product spec, moving pattern lock state to give as many sample banks as sample slots
        self.volume = 127 #Midi Vel - drives above a certain threshold
        self.pitch = 63 #Midi Note
        self.fc = 63 #Filter Cutt off - CC 21
        self.srr = 63 #Sample Rate Reduction - CC 22
        self.verb = 0 #Reverb Mix - CC 23
        self.e2 = 0 # effect 2 depth
        super().__init__(name)
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
        #self.microstep = not bool(random.getrandbits(2))
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
            # elif type(drum) is KSDrumModule:
            #     pass
    
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

    def getmicrostep(self,pos):
        return self.step[pos].getmicrostep()
    
    def getactive(self):
        return self.active
        
class Track:
    def __init__(self, clock, active, number, type):
        self.number = number
        self.steps = []
        self.clock = clock
        self.active = active
        self.currentstep = 0
        self.currentstepstate = False
        if type == "analog":
            self.drum = AnalogDrum("ADRM{}".format(number))
        elif type == "digital":
            self.drum = DigitalDrum("DDRM{}".format(number))
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

    def rgbstepdisplayallsteps(self):
        for i in range(16):
            microsteps = self.getmicrossteps(i)
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
                
                if(self.currentstep == (4*i)+j):
                    uh.set_pixel(x, y, 255, 255, 255)
            #uh.show()

    def killstep(self,note):
        time.sleep(.009)
        msg = mido.Message('note_off', note=note)
        port.send(msg)


    def playstep(self):
        # the responsability for playing a drum should probably be attached to a particular drum type in 
        # the drum's class itself, but ╮(─▽─)╭
        #if isinstance(type(self.drum), DigitalDrum):
        #msg = mido.Message('note_on', note=self.drum.pitch)
        # This line prevents a rare-ish bug where the msg variable gets refranced before assignment, for some reason
        msg = mido.Message('note_on', note=2)
        note = 2

        if self.currentstepstate == True and self.number >= 5 : #tracks 5,6,7,8,9 are digital
            if self.number == 5:
                msg = mido.Message('note_on', note=60, channel=0)
                note = 60
            elif self.number == 6:
                msg = mido.Message('note_on', note=63, channel=1)
                note = 63
            elif self.number == 7:
                msg = mido.Message('note_on', note=66, channel=2)
                note = 66
            elif self.number == 8:
                msg = mido.Message('note_on', note=69, channel=3)
                note = 69
            elif self.number == 9:
                msg = mido.Message('note_on', note=72, channel=4)
                note = 72
            #msg.copy(channel= self.number - 4) #the track number determines the MIDI channel, subtract 4 to make the midi channels 1,2,3,4,5
            #print("playing note on MIDI Ch. {}".format(self.number -  5) )

            #Having this on a thread isn't terribly ideal, but it's pretty heavily blocking, and this helps bring the project rate up
            #mt = Process(target=port.send(msg))
            #mt.start
            port.send(msg)
            ## This stoping thread isn't needed with the current implimentation.
            #stop = threading.Thread(target=self.killstep, args=(note,))
            #stop.start() # yes, I know how dumb this line sounds. It means that the thread that will kill
                         # the note after .001 seconds should be started.
        elif self.currentstepstate == True and self.number <= 4 : # tracks 0,1,2,3,4 are analog
            pass #TODO send trigger to pi
        else:
            pass
            



    def advancestep(self):
        self.playstep()
        if(self.currentstep < 63):
            self.currentstep = self.currentstep + 1
        else:
            self.currentstep = 0
        #enabling this print for debug WILL eat a core of the CPU
        #print("current step = {}::{} = {}".format(self.currentstep//4,self.currentstep%4,self.steps[self.currentstep//4].getmicrostep(self.currentstep%4)))
        self.currentstepstate = self.steps[self.currentstep//4].getmicrostep(self.currentstep%4)
        #print("track {} step {} is {}".format(self.number, self.currentstep, self.currentstepstate))

    def getnumber(self):
        return self.number

    def getname(self):
        return self.drum.name

class Pattern:
    def __init__(self,id):
        self.tracks = []
        self.id = id
        self.activetrack = 0
        self.tracks.append(Track(1,True,0,"analog"))
        for i in range(1,5):
            #tracks default to clock=1 (base) active=True
            self.tracks.append(Track(1,False,i,"analog"))
        for i in range(5,10):
            self.tracks.append(Track(1,False,i,"digital"))
    
    def getactivetrack(self):
        return self.tracks[self.activetrack]

    def getactivetracknum(self):
        return self.tracks[self.activetrack].getnumber()

    def getactivetrackname(self):
        return self.tracks[self.activetrack].getname()

    def setactivetrack(self, tracknum):
        self.activetrack = tracknum
        for i in range(10):
            if tracknum == i:
                self.tracks[i].active = True
            else:
                self.tracks[i].active = False

    def advancealltrackssteps(self):
        for i in range(0,10):
            self.tracks[i].advancestep()

    def rgbstepdisplay(self):
        self.getactivetrack().rgbstepdisplayallsteps()

    def trackseldisplay(self):
        y = 5
        offset = 5
        for x in range(offset,offset+5):
            uh.set_pixel(x, y, 10,10,100)
        y = 6
        for x in range(offset,offset+5):
            uh.set_pixel(x, y, 10,100,10)
        activetrackled = self.activetrack
        if(self.activetrack > 4):
            activetrackled -= 5
            uh.set_pixel(activetrackled+offset, y, 255, 255, 255)
        else:
            uh.set_pixel(activetrackled+offset, y-1, 255, 255, 255 )
            
        

class Song:
    def __init__(self):
        self.patterns = [[],[],[],[]]
        for i in range(4):
            for j in range(4):
                self.patterns[i].append(Pattern(4*i+j))
                self.patternseq = []
        self.pattern = []
        self.patternseqlen = 7 #keep in mind this is 0 indexed!
        self.currentpattern = 0
        self.currentpatternseqstep = 0
        self.patternlocked = False
        self.displaymode = 0
        for i in range(8):
            # valid are "stay" "left" "right" "up" "down"
            self.patternseq.append("stay")
    
    def getcurrentpattern(self):
        #return self.pattern[self.currentpattern]
        patterndict = {
            0:[0,0],1:[0,1],2:[0,2],3:[0,3],
            4:[1,0],5:[1,1],6:[1,2],7:[1,3],
            8:[2,0],9:[2,1],10:[2,2],11:[2,3],
            12:[3,0],13:[3,1],14:[3,2],15:[3,3],
        }
        pos = patterndict[self.currentpattern]
        prow = self.patterns[pos[0]]
        pattern = prow[pos[1]]
        #print("pattern {} at addr: {}".format(self.currentpattern, pattern))
        return pattern

    def advancecurrentpatternsteps(self):
        self.getcurrentpattern().advancealltrackssteps()
    
    def setpatternseqstep(self, step, dir): #step in the pattern seq, not a normal step
        #TODO add check for if step is less than len
        self.patternseq[step] = dir

    def setpatternseqlen(self, len):
        self.patternseqlen = len

    def flippatternlock(self):
        self.patternlocked = not self.patternlocked
        if(self.patternlocked == True):
            print("locked to pattern {}".format(self.currentpattern))
        else:
            print("un-locked pattern {}".format(self.currentpattern))

    def incpattern(self):
        if self.patternlocked == False:
            if self.patternseq[self.currentpatternseqstep] == "stay":
                self.currentpattern = self.currentpattern #literally don't do anything
            elif self.patternseq[self.currentpatternseqstep] == "up":
                self.currentpattern = (self.currentpattern - 4)%16 # mod 16 needed in case we need to wrap around
            elif self.patternseq[self.currentpatternseqstep] == "down":
                self.currentpattern = (self.currentpattern + 4)%16
            elif self.patternseq[self.currentpatternseqstep] == "left":
                if self.currentpattern in {0,4,8,12}:
                    self.currentpattern = (self.currentpattern + 3)
                else:
                    self.currentpattern = (self.currentpattern - 1)
            elif self.patternseq[self.currentpatternseqstep] == "right":
                if self.currentpattern in {3,7,11,15}:
                    self.currentpattern = (self.currentpattern - 3)
                else:
                    self.currentpattern = (self.currentpattern + 1)

            if self.currentpatternseqstep < self.patternseqlen:
                self.currentpatternseqstep = self.currentpatternseqstep + 1 #increment
            else:
                self.currentpatternseqstep = 0

    def showpatternseq(self):
        #TODO make current step brighter
        for i in range(8):
            x = i%4
            if i >= 4:
                y = 6
            else:
                y = 5

            if i > self.patternseqlen:
                r = 0
                g = 0
                b = 0
            elif self.patternseq[i] == "up":
                r = 31
                g = 0
                b = 0
            elif self.patternseq[i] == "down":
                r = 0
                g = 0
                b = 31
            elif self.patternseq[i] == "right":
                r = 0
                g = 31
                b = 0
            elif self.patternseq[i] == "left":
                r = 31
                g = 0
                b = 31
            elif self.patternseq[i] == "stay":
                r = 31
                g = 31
                b = 31

            if i == self.currentpatternseqstep:
                r = int(r * 8)
                g = int(g * 8)
                b = int(b * 8)

            uh.set_pixel(x, y, r, g, b)
            if self.patternlocked:
                uh.set_pixel(4,5,255,0,0)
            else:
                uh.set_pixel(4,5,0,255,0)
            #uh.show()

    def showpatterngrid(self):
        for i in range(4):
            for j in range(4):
                x = i
                y = j
                xcurr = self.currentpattern % 4
                ycurr = self.currentpattern // 4
                if x == xcurr and y == ycurr: # stay
                    r = 31
                    g = 31
                    b = 31
                    if self.patternseq[self.currentpatternseqstep] == "stay":
                        r = 255
                        g = 255
                        b = 255
                elif x==xcurr and y == (ycurr + 1)%4: #down
                    r = 0
                    g = 0
                    b = 31
                    if self.patternseq[self.currentpatternseqstep] == "down":
                        b = 255
                elif x==xcurr and y == (ycurr - 1)%4: #up
                    r = 31
                    g = 0
                    b = 0
                    if self.patternseq[self.currentpatternseqstep] == "up":
                        r = 255
                elif x==(xcurr - 1)%4 and y == ycurr: #left
                    r = 31
                    g = 0
                    b = 31
                    if self.patternseq[self.currentpatternseqstep] == "left":
                        b = 255
                        r = 255
                elif x==(xcurr + 1)%4 and y == ycurr: #right
                    r = 0
                    g = 31
                    b = 0
                    if self.patternseq[self.currentpatternseqstep] == "right":
                        g = 255
                else:
                    r = 5
                    g = 5
                    b = 5

                uh.set_pixel(x, y, r, g, b)
        #uh.show()
    
    def showtracknum(self):
        write_string('TRK {}'.format(self.getcurrentpattern().getactivetracknum()),kerning=False)
        #show()

    def showtrackname(self):
        write_string(self.getcurrentpattern().getactivetrackname(),kerning=False)
        #show()

    def rgbstepdisplay(self):
        self.getcurrentpattern().rgbstepdisplay()
    
    def trackseldisplay(self):
        self.getcurrentpattern().trackseldisplay()
    
    def updatedisplay(self):
        if self.displaymode == 0:
            self.showtracknum() # Track num doesn't need displayed on the microdot display because it can be shown on the RGBs
            self.rgbstepdisplay()
            self.showpatternseq()
            self.trackseldisplay()
            
        elif self.displaymode == 1:
            self.showpatterngrid()
            self.showpatternseq()
            self.trackseldisplay()
        # Seriously DO NOT call these any more than necessary, it tanks performance.
        uh.show()
        show()

    def changedisplaymode(self,mode):
        self.displaymode = mode
        




class Jukebox:
    def __init__(self):
        self.activesong = 1
        self.songs = []
        for i in range(16):
            self.songs.append(Song())
            # Attempt to load in all 16 saved songs from pickles
            #self.songs[i] = filecheck("songs/s{}.p".format(i))

    def getactivesong(self):
        return self.songs[self.activesong]
   
    def savesong(self,songnum):
        #pickle.dump( self.songs[songnum], open( "songs/s{}.p".format(songnum), "wb" ) )
        pass
    
    def saveallsongs(self):
        for i in range(16):
            self.savesong(i)

    def getsong(self, songnum):
        return self.songs[songnum]

    def changesong(self, songnum):
        self.activesong = songnum

    def incpattern(self):
        self.songs[self.activesong].incpattern()

    def fliplock(self):
        self.songs[self.activesong].flippatternlock()

    def islocked(self):
        return self.songs[self.activesong].patternlocked

    def getactivepattern(self):
        return self.songs[self.activesong].getcurrentpattern()

    def getactivetrack(self):
        return self.getactivepattern().getactivetrack()

    def setactivetrack(self,num):
        self.getactivepattern().setactivetrack(num)

    def flipmicrostep(self,pos,micropos):
        self.getactivetrack().flipmicrostep(pos,micropos)

    def advancestep(self):
        self.songs[self.activesong].advancecurrentpatternsteps()

    def updatedisplay(self):
        self.songs[self.activesong].updatedisplay()

    def changedisplaymode(self,mode):
        # this is basically just shadowing songs' but is done so that
        # changing the song can go into the display mode that song was last
        # set to.
        self.songs[self.activesong].changedisplaymode(mode)
        

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
#showStartup(uh)

#------------------------------------------------------------------------------------------------------------------------------------------------------
# This is just setting stuff up for testing, to avoid needing to enter these by hand for now
#------------------------------------------------------------------------------------------------------------------------------------------------------

S1 = J1.getsong(1)

S1.setpatternseqstep(0, "up")
S1.setpatternseqstep(1, "up")
S1.setpatternseqstep(2, "down")
S1.setpatternseqstep(3, "left")

S1.setpatternseqstep(4, "right")
S1.setpatternseqstep(5, "right")
S1.setpatternseqstep(6, "right")
S1.setpatternseqstep(7, "stay")

#set it to the first digital drum track
# TODO, this might require a bigger change, as right now the
# active track is tied to the pattern, meaning on pattern
# change the track being edited will also change
# which would be a terrible user experiance.
for k in range(10):
    # make a 4-on-the-floor to test with.
    for i in range(16):
        J1.flipmicrostep(i,0)

# S1.showpatternseq()
# S1.showpatterngrid()

#------------------------------------------------------------------------------------------------------------------------------------------------------
# Getting keyboard events. This is why this script needs to be ran as root
#------------------------------------------------------------------------------------------------------------------------------------------------------

### Workaround for down key events retriggering adapted from https://github.com/boppreh/keyboard/issues/158

keystate = defaultdict(lambda: 'up')
currentdisplaymode = 0

def pressed(name, event):
    return keystate[name] == 'up' and name == event.name and event.event_type == 'down'
def released(name, event):
    return keystate[name] == 'down' and name == event.name and event.event_type == 'up'
def held(name):
    return keystate[name] == 'held'

def handlemicrostep(name):  #this is super ugly, but I can't think of a better way to do it.

    if(name == "f9"):
        microsteppos = 0
    elif(name == "f10"):
        microsteppos = 1
    elif(name == "f11"):
        microsteppos = 2
    elif(name == "f12"):
        microsteppos = 3
    else:
        return

    mapping = {
        "1":0,"2":1,"3":2,"4":3,"5":4,"6":5,"7":6,"8":7,"f1":8,"f2":9,"f3":10,"f4":11,"f5":12,"f6":13,"f7":14,"f8":15
    }

    for key in mapping:
        if(keystate[key] == 'held'):
            J1.flipmicrostep(mapping[key],microsteppos)
            print("flipped step {}:{}::{}:{} ".format(J1.getactivepattern,J1.getactivetrack(),mapping[key],microsteppos))

def changetrack(name):
    if(name == "q"):
        J1.setactivetrack(0)
    elif(name == "w"):
        J1.setactivetrack(1)
    elif(name == "e"):
        J1.setactivetrack(2)
    elif(name == "r"):
        J1.setactivetrack(3)
    elif(name == "t"):
        J1.setactivetrack(4)
    elif(name == "y"):
        J1.setactivetrack(5)
    elif(name == "u"):
        J1.setactivetrack(6)
    elif(name == "i"):
        J1.setactivetrack(7)
    elif(name == "o"):
        J1.setactivetrack(8)
    elif(name == "p"):
        J1.setactivetrack(9)
    else:
        return

def changebpm(name):
    global bpm
    if(name == "h"): #LEFT, this is currently backwards, as the QMK config is backwards
        bpm /= 1.1
        if bpm <= 0:
            bpm = 0
        else:
            print("BPM decremented")
    elif(name == "g"): #RIGHT
        bpm *= 1.1
        print("BPM incremented")

def changedisplaymode(name):
    if(name == "d"):
        global currentdisplaymode
        currentdisplaymode = (currentdisplaymode + 1)%2
        J1.changedisplaymode(currentdisplaymode)
        print("Display Mode Changed")


def handler(event: keyboard.KeyboardEvent):
    if (keystate[event.name] == 'down' and event.event_type == 'down'):
        keystate[event.name] = 'held'
        return

    if (keystate[event.name] == 'held' and event.event_type == 'up'):
        keystate[event.name] = event.event_type
        return

    if pressed(event.name, event):
        print('pressed', event.name)
        if(event.name == "l"):
            J1.fliplock()
        handlemicrostep(event.name)
        changetrack(event.name)
        changedisplaymode(event.name)
        changebpm(event.name)


    if released(event.name, event):
        #This means released without being held, a quick 'tap'
        print('released', event.name)

    if held(event.name):
        #print('held', event.name)
        return

    keystate[event.name] = event.event_type

hook = keyboard.hook(handler)
J1.updatedisplay()

PDrunning = False

while PDrunning == False:
    #`purr-data -nogui -open X.pd`
    # purr-data -nogui -open dsponfix.pd
    for proc in psutil.process_iter(['name']):
        if proc.info["name"] == "purr-data":
            PDrunning = True
            break
    if PDrunning:
        break
    time.sleep(.5)
    print("PD not yet running")

if PDrunning:
    print("PD is running, initalizing MIDI")
    time.sleep(.25)
    port = mido.open_output("Pure Data Midi-In 1")

starttime = time.time()
correction = 0
firstrun = True

while True:
    currenttime = time.time()
    elapsed = currenttime - starttime
    print("Last loop took {} seconds".format(elapsed))
    actualbpm = (1/(elapsed/16))*60
    if(firstrun): # We need to ignore the first garbage run
        actualbpm = bpm
        firstrun = False
    print("That is {} BPM".format(actualbpm))
    starttime = time.time()
    if(actualbpm < bpm): #if to slow, we need to speed up
        print("bpm to slow, correcting by {}".format(correction))
        correction += .0001 * abs(bpm-actualbpm)
    else:
        print("bpm to fast, correcting by {}".format(correction))
        correction -= .0001 * abs(bpm-actualbpm)

    for i in range(64):
        sleepytime = 60/(bpm*4) # This needs to be a responsive control, hence it being placed in here
        sleepytime -= (.01+correction) 
        #time.sleep is in SECONDS not milliseconds
        time.sleep(sleepytime) # roughly 120bpm

        J1.advancestep()
        J1.updatedisplay()
    if(J1.islocked()==False):
        print("Pattern Incremented")
        J1.incpattern()
    else:
        print("Pattern Held")
    #print("pattern at addr: {}".format(J1.getactivepattern()))


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

