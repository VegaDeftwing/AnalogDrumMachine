# What does the Code do?

The code running on the big pi (not the rp2040/pico):

* Receives key press & encoder events from the keyboards
* Receives module identification from the rp2040
* Updates the sequencer patterns with trigger events and per-step value locking
* Can mute (disable) tracks
* Drives the sequencer clocking
  * Sends trigger events & value locks to rp2040
  * Updates from external MIDI clock
  * BPM, Play/Pause
* Drives the user interface (Pimoroni micodot phat and unicorn phat)
* Loads the samples
* Plays the sample drums & applies effects
* Handles song save/load ([pickle](https://docs.python.org/3/library/pickle.html)?)
* Handles Cartesian pattern sequencing

---

Nice to haves:

Web UI for sample loading, PureData Drums w/ easy parameter linking → https://github.com/automata/topd

This might actually be easier than loading in samples directly?

# Parts + OS

* Pi3 B+
  * Unicorn Phat
  * MicoDot Phat
  * Audio DAC SHIM
  * Hat Hacker Hat
* [PyrooL/Alpha](https://github.com/PyrooL/Alpha) and [keeb.io BDN9](https://keeb.io/collections/bdn9-collection/products/bdn9-rev-2-3x3-9-key-macropad-rotary-encoder-and-rgb)
* Custom rp2040 board
  * Connect to analog drum modules, sends triggers and i2c commands to modules, sends module ID back to this code
* [Raspberry Pi OS](https://www.raspberrypi.com/software/), running headless except during development. SSH enabled.
* 3A+ 5.1V supply
  * Hats draw a fair amount of current on top of the 3B+'s requirements. The drum modules require ±12V, so the Meanwell RT65b can provide all three voltages with plenty of current for everything

# Libraries

[Pimoroni microdot-phat](https://github.com/pimoroni/microdot-phat) - MIT

> Needed to use micodot character hat

[Pimoroni unicorn-phat](https://github.com/pimoroni/unicornhatmini-python) - MIT

> Needed to use RGB Led matrix hat

[Rich](https://github.com/willmcgugan/rich) - MIT

>  Used for pretty formatting in terminal, makes development easier

[pyo](https://github.com/belangeo/pyo) (might provide midi too?)

> Python DSP module

[Pretty Errors](https://github.com/onelivesleft/PrettyErrors) - MIT

> Makes python exceptions easier to understand

[Python Midi](https://github.com/vishnubob/python-midi) - MIT (May be done by pyo?)

> High level MIDI manipulation
