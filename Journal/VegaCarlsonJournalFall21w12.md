# Vega Carlson - Group 165 - Fall '21, Week 12

## Saturday, Nov 6th -- W:0.00 T:86.8

**0.0 hr** -- No Progress today

## Sunday, Nov 7th -- W:0.00 T:86.8

**0.0hrs** -- No Progress today

## Monday, Nov 8th -- W:0.00 T:86.8

**0.0hrs** -- No Progress today

## Tuesday, Nov 9th -- W:0.00 T:86.8

**0.0hrs** -- No Progress today

## Wednesday, Nov 10th -- W:0.5 T:87.3

**0.5hr** -- Meeting with Bauer

## Thursday, Nov 11th -- W:7.6 T:93.9

**7.1hr** -- Ordered LEDs for the hand wired keyboard then continued work from last week Thursday to get control of the RGB leds on the macropad. Before I dive in to writing my own code I'm looking to see if the OpenRGB fork mentioned last week will work. Even should that work, I suspect I'll need to noodle around with things a bit to do what I want, but at least it's a better starting point. I also noticed the pi seemed to be particularly sluggish today and I'm not sure why- I installed `htop` and everything looks fine.

About an hour into the OpenRGB fiddling, I think it's a bust. I definitely could make it work given enough time, but at the moment I just don't think it's worth fiddling with. I was trying to get all the display stuff (leds, etc) handled at once, but I think I need to just move on. I'll just treat it as if it doesn't have RGB LEDs at all for now. Instead I'm going to move on to trying to get headless input from the keyboards from python.

I realized I need to actually set the keyboard to something for keys first, so made up this map

> This took multiple iterations, only the most recent is shown. The keys may seem weird, but they're chosen to work well with the code and library being used.

![image-20211112011226799](../../../../../../../home/vega/.config/Typora/typora-user-images/image-20211112011226799.png)

and I did define the RGB leds again, but this time I have it set to stuff that can all be done internally easily enough, instead of needing the python code to tell the keypad to change it's LEDs over raw HID, this will just happen based on state internal to the keypad, which is MUCH easier to do.

I got some python code going to detect key presses, unfortunately, in doing so I realized that I'll have to find a way to supress repeated key events- I want holding 'a' to give me 'a' not 'aaaaaaaaaaa', and while I think this should be done at the OS level, it's assumed to be configured via X, when I'm running the pi headless. ... and much effort later I have a fix- I have to use `on_release_key`, which isn't great, but it's better than having things be able to rapidly switch states.

Finally, I got at least one thing working for input to the screen- pattern locking. The pattern can now be held for editing.

---

Alright, the `on_release_key` thing was bothering me, and I realized wasn't a good fix given I needed to handle things in regards to held keys anyway, so I searched the github repo for the library, and someone else had complied about the same thing and provided a hacky workaround, which I have stolen and adapted. It's not great, but it's better than nothing.

---

I guess while I'm on a roll I got the microstep entry by holding steps mostly working.

---

... and then I realized that the way I'm reading in keycodes treats shift as it's own key, not actually doing the shift operation, so I had to go modify the keypad firmware to account for that and get the encoders to send a different value when held.

https://github.com/boppreh/keyboard/issues/158

> Noting for myself, to flash the BDN9 use:
>
> `qmk flash -kb keebio/bdn9/rev2 -km capstone`

## Friday, Nov 12th -- W:9.8 T:96.1

**0.5hr** -- Meeting

**1.7hr** -- continued work on code, got the active steps displaying with a sequence dot moving at 120 bpm across the LEDs. Nothing is being triggered yet, but the sequencer is taking shape

---

**Week ending 11/12 total = **9.8 hours

