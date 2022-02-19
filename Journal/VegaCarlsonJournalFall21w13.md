# Vega Carlson - Group 165 - Fall '21, Week 13

## Saturday, Nov 13th -- W:0.00 T:96.1

**0.0 hr** -- No Progress today

## Sunday, Nov 14th -- W:0.50 T:96.6

**0.5hrs** -- High level research into effect options and parts needed moving forward. Ordered PT2399's

## Monday, Nov 15th -- W:1.00 T:97.1

**0.5hrs** -- Looked into LMNC's Saftey Valve 12AX7 based tube distortion a bit, trying to find out if we need a high voltage source. Still not sure, but learning a bit.

## Tuesday, Nov 16th -- W:0.00 T:97.1

**0.0hrs** -- No Progress today

## Wednesday, Nov 17th -- W:1.7 T:97.8

**0.7hr** -- Meeting with Bauer + some work in lab

## Thursday, Nov 18th -- W:7.4 T:103.5

**5.7hr** -- While I still need to get input from the sequencer working and I have parts to handwire the keyboard, I decided I need to work with some organization of the code and get midi out and sample playback working first, just so I have something to test with. This means I need to get ~~pure data~~ went with Purr-Data, a [fork of PD,](https://agraef.github.io/purr-data/) running on the pi. I'm sincerely hoping this doesn't require starting an X session. If it does, I might be able to get away with X without a DE or WM, but that's still annoying. On the bright side, I might be able to set up easy X11 SSH window forwarding, which could give a neat feature for customization? - yep, X11 forwarding "works" though it's CPU rendering on the PI and being sent over wifi, so it's pretty slow.. That will never not seem like magic to me. I still don't have audio out though,~~I think I need to get Jack2 setup, which is easier said than done-~~ used a mix of https://madskjeldgaard.dk/posts/raspi4-notes/#important-packages-and-dependencies and https://wiki.linuxaudio.org/wiki/raspberrypi, though I'm going to avoid complinig the RT kernel if I can, espcially since afaix Linux 5.10 - what the pi is running now - has most of the RT kernel patches merged in anayway.

I tried to get Jack2 setup, and it really didn't want to work; however, I think the latency may be acceptable with ALSA, espically since we only need output, not mic input.

And things are getting weirder- I'm getting audio errors if I try to open pure-data in headless, but it correctly plays though the pi's audio interface when I'm using X11 forwarding...

... and almost an hour later it's fixed. Known bug: https://forum.pdpatchrepo.info/topic/8033/pd-with-no-gui

Got the first sucessful bit of communication between PD and python, albeit just over MIDI for now using https://mido.readthedocs.io/en/latest/ and some poking around with midi devices. I'll probably need to use https://github.com/giampaolo/psutil#further-process-apis in the python code too, so that I can check if Purr-Data is running before trying to connect to the midiport - it's gotta exist to be able to connect to it!

For now, I'm going to get the sample drum Purr Data 'Code' done, as I may as well have the file ready to go to send midi data to instead of just sending mock midi data. Patching it together is going to take some time though.

![image-20211118193938605](../Images/image-20211118193938605.png)

And I think that's a good stopping point. It's not done, but it's getting there. The reverb dry/wet mix needs touching up, and I need a better clipping distortion than an `atan` folowed by a `clamp` as it sounds alias-y, but so far so good.

Next problem is getting sample switching working within pure-data, then connecting all of this with the code, which will require a rewrite of some of how I've done the OOP in the python, as of right now drums are associated with patterns, which is super awkward. A much better fit would be associating the drums to Songs and making a system for displaying a warning when a song is loaded that was made with different analog modules / in a different order.

## Friday, Nov 19th -- W:8.2 T:104.3

**0.5hr** + **.3hr** -- Meeting + contintued discssion about filters with Kaleb

---

**Week ending 11/12 total = **8.2

