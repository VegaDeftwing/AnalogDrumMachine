# Drum Selection

**Definitely need**

- [ ] Bass/Kick drum

  TR-808 Bass is simple, could easily add hard clipping, and might be able to put wide controls on it to make it cover more range. There's also the [Kraft Drum](https://syntherjack.net/kraft-drum/).

  Regradless of what we do, I think adding hard clipping by letting the volume be turned up and using a diodle clamping circuit would be a good idea

- [ ] Snare drum

  The 808's appears to be the most redily available circuit online. Some online sources refrence pinging a filter with a burst of white noise, or just white noise, an envelope, and a bandpass filter. There's also [this reddit post](https://www.reddit.com/r/synthdiy/comments/ee4jbt/a_fairly_convincing_synth_snaredrum_i_am_working/) which has particularly good sounding snare, but only part of the circuit is available

- [ ] Closed Hi-Hat

  [This post](https://www.reddit.com/r/synthdiy/comments/g04j7z/modular_in_a_week_hihat_and_snare/) links to something that is billed as either a hat or snare, and uses a vactrol so it's definitely different from the traditional 808. There's also [This project on github, which has kicad files](https://github.com/benjiao/MetallicHats), and uses 6 square wave oscilattors. 
  
  see [DIY Vactrol](https://sound-au.com/project200.htm)

**More complex voices**

- [ ] FM-Percussion

  The Elektron Model Cycles and Akaime's Taiko both do percussion sounds based on very simple FM synthesis, though I think both use variable wave shapes as well, which is hard to do in analog. A quick test in VCV, and it seems doing two square wave VCOs, setup with a short decay envelop doing fm on one oscilator tuned low while the second oscilator, tuned higher, gets the output of OSC1 as it's pitch input works well enough. If we can make pulse width variable as well, this actually gets to a lot of interesting sounds. If we use a LPG on the output, it'll kill off the harmonics more naturally as well.

  We'd probably need 1, if not 2, VCO ICs for this. The most common IC I've seen is the CEM3340. Electrosmith has a nice breakout for that at $25. The AS3340, a pin compatible part, is actually still manufactured and seems to go for ~\$6. We also might be able to do it with 555's, maybe something like the common "[Atari Punk Console](https://sdiy.info/wiki/Atari_Punk_Console)" circuit. We might even duplicate it and feed one APC into a second for FM. It's gross, but it's a simple circuit and all 555's. Testing in VCV, it sounds pretty cool too, can get quite noisy, and again, with a LPG on the output it decays nicely. Finally, we also might be able to use filters in self oscilation as VCO's. We're not trying to get a stable, percise pitch, so pretty much anything that oscilates and can do FM goes. Steiner-Parker and Diode-Ladder filters seem to work well from testing in VCV, but both are rather large circuit wise.

  I think the best bet is two APC's chained together. It's cheap, sounds good, and the circuit is simple- ~~espically since the 558 is 4 555's in one package.~~ The 558 won't work as it has a common control voltage pin. The 556 which is a dual 555 should though, so only 2 ICs. The biggest problem will be keeping the 555's from adding noise to our power, as this is well know critisism of using 555's in the audio world. We'll just have to do a lot of power filtering.

- [ ] Karplus Strong Synthesis

  We have some MN3003 BBD IC's courtsouy of Hoffman, ~~these are 64 stage and should be about perfect for Karplus strong,~~ A bit less sure now. Refrecnce implimentions seem to be using 256, 1024, or 2048 stage. This might still be okay, but it might mean our oscilations are high pitch. There's also [this op-amp karplus strong circuit](https://electro-music.com/forum/topic-55225.html) which is just an all-pass (phaser) acting as the delay and self oscilating. I'm not sure this really counts as karplus strong though, still, sounds good anyway. If we do want to do BBD based, the MN3007's seem to still be affordable, though shipping time may be an issue. 

- [ ] Sample based

  Alight, breaking the analog drum trend a bit, I think having a sample source is reasonable. Load an SD Card, select a sample on the module, and done. This is cheating a bit, but oh well. 

- [ ] Toms
  
  Most drum machines have a 3-tom section with Low-Tom (LT), Mid-Tom (MT) and High-Tom (HT). Doing this with three modules in our 6-module machine would be a bit on the waseful side, so this might be the module that forces us to really use that bus system and have the modules/cards identify themselves to the micro controller. If we do that we could make the sequencer recognize what slot has the Tom module and varry the pitch per step. Of course, this does limit it to one tom sound at a time, but it condoneses things down dramatically. We'd also have to figure out how to enter which step gets what pitch into the sequencer and how to send 3 triggers (maybe an I2c bus that every module connects to, and then this module would have something that breaks out 3 triggers?) I think this might mean we'd want to add a few extra buttons to the main interface maybe "ALT 1" and "ALT 2" which would *normally* be for accents, but would be tom sound in this case?
  
- [ ] Fake Sidechaine'd Drone/Bass
  
  A lot of music will use a *Compressor* with it's *Sidechain* input. Compressors listen to the incoming signal and reduce the volume if the incoming signal is above a threshold, this reduction is on an evelope, so it has it's own attack and release time. Usually compressors listen to the same signal they're affecting, but this isn't required, when the signal being reduced isn't the same as the signal being monitored for peaks, this is called sidechaining. Often, this is done with a kick drum and the bass sound, so that whenever the kick plays the bass will get quiter, making the kick sound more clear as they would likely otherwise take up the same frequencies. This can be faked rather easily though, as we could simply make a module which instead of being triggered to play a sound, is triggered to have the volume duck for a moment, but otherwise droning endlessly. Combined with the above idea of having two accent buttons to change the toms, this might be capable of full bass lines, that is, if a bass line with only 3 pitches is okay. 
  
  