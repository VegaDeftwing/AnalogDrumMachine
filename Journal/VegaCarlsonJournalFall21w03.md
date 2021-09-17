# Vega Carlson - Group 165 - Fall '21, Week 3

## Saturday, Sep 4th -- W:0.00 T:17.50

**0.00 hr** -- Sick, no progress today

## Sunday, Sep 5th -- W:0.00 T:17.50

**0.00hr** -- Sick, no progress today

## Monday, Sep 6th -- W:1.50 T:19.00

**1.50hr** -- Sick. Counting some of my work reseaching the MIDI protocol to write up [this page](https://opguides.info/music/midi/) on my website. This actually took **hugely more than 1.5 hours**, but was for a personal project outside of any class; however, it has serious ovelap with this project, so I thought should count for something. It's also about the only thing I could do while feeling this bad, as staring at circuits was physically painful.

## Tuesday, Sep 7th -- W:1.50 T:19.00

**0.00hr** -- Sick, no progress today

## Wednesday, Sep 8th -- W:3.00 T:20.50

**0.5hr** -- Group meeting with Bauer, discussed state of the project, talked about the indistructable laptops

**0.5hr** -- Worked with LiveSpice to get circuit simulation with live audio output working

**0.5hr** -- Worked with Reid to compare time and frequency domain output of an 808 emulation to our simulation. We figured out the simulator doesn't like the way we're making white noise.

## Thursday, Sep 9th -- W:4.00 T:21.00

**1.0hr** -- Researched potential of using a pi as "The Brain" of the system instead of using strictly μC's. Assuming using higher level languages on the pi is allowed it seems like a good trade off as it should make responding to user input events (via an internally connected μC acting as a MIDI controller) and midi clock input significantly easier. Trying to do trigger output, low latency input, handle a display, and handle a clock input all on a micro controller is definitely possible, though it's likely the scheduling would be quite difficult. Furthermore, in `DrumSelection.md` we had planned to make a sample playback module and in `SequencerAndBusSelection.md` - while not finalized - the inclusion of i2c communication to the micro controller seemed more-or-less stetted. Well, if we use a pi, the sample play back module could really just be a dummy i2c controller that talks to the pi (or bus controller, if necessary) directly over i2c and then the pi could do its own sample playback. This may be difficult for routing the effects output, but that may be able to be justified by simply documenting that if the sample drum module is used, it can not be routed to an effect path and will instead use DSP effects internal to the pi. This may be awkward, but overall it seems to make sense from a cost and complexity perspective. It really turns the project from being an analog drum machine into a hybrid drum machine, but that's not necessarily a bad thing.

## Friday, Sep 10th -- W:6.00 T:23.00

**.75hr** Meeting with group

**1.25hr** Micro controller selection see updates to `SequencerAndBusSelection.md` in the [project's GitHub repository](https://github.com/VegaDeftwing/AnalogDrumMachine).

---

**Week ending 8/27 total = 6.0hrs**

