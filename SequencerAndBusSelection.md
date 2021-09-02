# Sequencer and Bus Selection

[WORK IN PROGRESS]

## Sequencer

The sequencer is really the 'brain' of the project, and as such will need a micro controller which handles the logic and user interface. The 'core' of the sequencer is the 16 step buttons, but there will still need to be a variety of things acomplished by the sequencer that necessitate extra inputs and outputs:

- Step Entry

  - Each step has it's obvious binary state

    - We'd also like to do 'micro steps' where holding a step lets the user enter in sub-divided steps

      <img src="Images/microsteps.svg" alt="microsteps" style="zoom:33%;" />

      This could be done in a variety of ways, currently the thinking is to use the arrow-keys that are normally used for menu navigation as the micro-step inputs when a step is held down

- Sound selection

  - Each module will have *Module Select* button- see the "Select & Mute" button in the main mockup design in `AnalongDrumMachineIdea.md`

  - Modules *may* be able to provide more than one sound, see the description of the Tom Drum module in `DrumSelection.md`, this also necessitates a way to change the selected sound. This gets complicated if we want to be able to change the sound on each micro-step as well. One option may be to make quick taps of the buttons cycle though the available triggers, shown via an RGB LED. This requires detecting double press events, which can be complicated with debouncing and may add to input latency (we need to wait on single press to ensure it's not a double press) but should be reasonable anyway.

    <img src="Images/SoundSelection.svg" alt="SoundSelection" style="zoom: 33%;" />

    Keep in mind, each module has it's own dedicated select button. This double-tap action has the advantage of  making entry on the micro-steps work too. It could also be done such that a single-tap access sound 1, a double sound 2, and a tripple sound 3. This may incur even more latency though, as detecting a tripple-press would require a larger window to see if any given input is a tripple press.

- Pattern Selection 

  - If the drum machine can only loop the same 16-steps over and over it may get a bit bland, so a user will probably want to program in multiple patterns and be able to switch between them.

  - There may be a desire to have in currently *playing* pattern be seperate from the pattern being currently *edited*

  - It would be ideal if patterns could be chained (play pattern 1 twice, then play pattern 2 once, repeat)

  - Pattern/Sequnece storage may be a bit complicated by the fact that the modules may be changed around, should the pattern be 'blind' to this and just output trigger and let the user mix and match? This might be cool if the user makes a nice pattern and decides "I'd like to try swapping the snare and hat sequnces", for example

  - It would be good if patterns were persistant. We might want to write them out to an SD card. If the format is kept simple enough we may be able to make patterns computer editable, which would be nice, maybe the file  format could look something like this

    ```
    P1:
    1:1___|____|____|____|1___|____|____|1___|____|____|____|1___|____|____|____|____|(x1)
    2:1___|2___|3___|1111|____|____|____|____|____|____|____|____|____|____|____|____|
    (x2)
    3:____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|
    (/4)
    4:____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|
    (/2)
    5:____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|
    (x1)
    6:____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|____|
    (x1)
    P2:
    1: ...
    ```
    where each `____|` is a step and it's micro-steps, a `_` is no trigger, and a 1, 2, or 3 is what trigger to send on that channel on that step? The `(xn)` / `(/n)` would be for per-module tempo divison, see the next section.
    
    Writing a parser for this should be pretty easy, so that things could be loaded up on boot

- Tempo Entry & Division/Multiplication

  The encoder should probably default to changing the tempo, unless some other input where encoder input is a good choice is selected on the OLED.

  Each channel should also be able to be given a tempo, this way some tracks may be set to go by at 1/4, 1/2, normal, 2x, or 4x speed. At 2x for exmalple, the entire 16 step sequnece would play in the same time as 8-steps of 'normal timed' sequnce. Division is actually more complicated, as it may require transitioning to the next pattern when the divided sequnce hasn't finished playing yet, if there's a pattern chain setup.

---

## Bus

There are actually *two* busses, one for sound sources and one for effects

### Sound Sources

Sound source modules need a variety of I/O

- Trigger input(s)

  - These will be very sensative to latency and timing. If two drums are to be triggered at the same time, more than a milli-second or two may alter the phasing relationship between the sounds. This may be fine so long as the latency is consistant, but it's best to keep it low
  - Different module refrence designs may want different trigger voltages and lengths. Because of this, levels may need shifted. It is probably easier to lengthn a pulse than shorten it, so the trigger coming from the sequncer will be kept as impulse-like as possible

- Sound output

  - Each module will only have a single mono output. If the module can make multiple sounds, they'll need to be mixed (even if only one can ever be played at once) into this single output

- Power

  - Modules will likely need opamps that, ideally, would be given a clean +12V and -12V rail
    - This may need filtered per-module, espically if that module produces a weird load that may interfere with other modules- this is a known issue with many designs using the 555
  - Either 5V or 3.3V would also be nice, as it would be ideal to have something that matches our trigger source and which can be used to power micro controllers easily without needing a seperate 5V regulator on every module
  - Ground, obviously, is required. We may want to have seperate analog and and digital grounds, but more research into this is needed

- Identifyier

  This could be done in two ways: The cheap & easy way, or the complicated and expandable way

  Cheap & Easy is to reserve some of the pins to be bits that indicate a module ID, if those pins are tied high, that's a 1, low, 0. This is sub optimal as it uses a lot of pins, limits future expandability, and prevents the modules from holding more data that could be communicated to the main controller such as a version number. The other way to do it would be to add an i2c bus or similar. A simple i2c eeprom would do this quite well and doesn't drastically add to the BOM.
