# Effect Selection

## DSP?

Pretty much any effect is possible if we accept the latency, phasing, and cost implications of DSP. That said, some are still more practical than others. Reverb, for example, is a bit of a nightmare to implement with [the blog for Valhalla DSP](https://valhalladsp.com/category/tech-talk/), one of the biggest names in reverb programming right now, makes it pretty clear that good reverb algorithms are essentially trade secrets and stumbling into them is largely a matter of luck. There's also a pretty good chance the latency/phasing problems that come from ADC->Buffer->Effect->DAC will be bad enough to make for a considerable off-time feeling compared to the non affected signals.

## On Drums

Not all effects work well on drums. Vibrato and Tremolo, for example, wouldn't really make much sense to use.

## Trivial Effects

Some effects, like panning from Left to Right automatically in a loop with an LFO may be interesting, but I think dedicating an effects module to this would be rather wasteful. It may be that we'd like to use this, automatic sweeping filters, etc. as a stage before another effect to make it more interesting though. For example, if we implement a delay that delays both the left and right channel equally, it may be interesting to do that automatic panning (fading out each channel inversely with an LFO).

---

## Non-Module Effects

### Volume

Calling this an effect may be a stretch, but we will need a master volume control. We may want to implement at least hard-clipping on this output - inherently giving it a distortion - so that high volumes don't damage whatever this would connect to next. This is especially relevant if we use a filter with resonance, speaking of:

### Filter

Drum machines are inherently a musical performance tool, and one thing that's almost always used in performance of electronic music is drum filtering- using a low or high pass going from letting everything though to nothing, as a pseudo-volume control. Often, it's desirable for this filter to have a resonant peak at the cut off, which means we need more than a simple RL filter. Probably the most well documented filters, that have the extra "character" sought after in filters for music, that would be easy to implement would be the Diode Ladder Filter (popularized by Moog) or the Polivoks (from a famous Russian synth of that name). The Diode Ladder tends to cut low frequencies as resonance is increased, so it may not be the best choice though.

Generally, a LPF is used. HPF with resonance are neat as they can be used to put a resonant peak right on the bass drum, but are less usefull over all.

Keeping the filter design otherwise small is probably ideal as it will need to be duplicated across both the left and right channels, as these non-module effects will be post the effect modules. We'll need to use stereo potentiometers on both the cutoff and resonance controls, which may make the design a bit complicated.

### Compression?

Compression is almost always used on drums in music, as it typically helps from having the transients peak and clip on the master output, as well as letting the more quiet parts of the drums cut though the mix. Implemented as a module, what we'd be doing would have to be *parallel compression* as all the drums would be sharing a single compressor, coming in parallel (so getting mixed together). This can be a tad awkward as the signal that controllers the compressor is usually this same mix, and with all the drums together, this signal probably won't have much range, compared to the peaks followed by often even silence of one of the drum tracks alone. It would be nice to be able to select a track to be the input signal the compressor follows, but as an effect module this may be difficult. Similarly to how in the [Drum Selection](DrumSelection.md) document a 'Fake Sidechained' signal was considered, the compressor could have a switch to follow the sum signal as would be normal, or follow not the *audio out* but the trigger sequence of whatever module is in the 1st slot. This would make it so we don't need to route an extra audio in across the board to both effect inputs (as the compressor could be put in either slot) and would still provide nearly the same effect, while allowing the user to duck whatever is being sent to the bus with compression, but not the signal controlling the compressor. Basically, the signal in the Drum1 slot could tell all the others to duck when it plays, but not get ducked itself. This is a bit hacky, but I think the alternative of only having basic parallel compression or a drum machine with no compression option is worse.

We could also go all out, put the compressor as a permanent non-removable module by the volume and filter knobs hard-wire the first drum module's audio output to be the compressor control's signal (the signal being watched to see if it crosses the threshold) and have all the others be sent to the compressor's audio input. This isn't super flexible, as it 's a bit of all-or-nothing scenario, but because compression is the odd one out in needing this extra control signal and it's kind of unavoidable, this might be the best option but does eat into our fixed design space, especially as the compressor will probably need multiple control knobs (threshold, makeup gain, and release)

## Module Effects

### Delay

Delay should be easily doable with PT2399 IC. These are used in countless audio devices because they're incredibly cheap. They are driven with a reasonably high frequency clock that always makes its way onto the delayed signal though, so the output will need filtering. We'd need two to make a stereo delay, but they're usually sold in packs of 10-or-so anyway.

### Comb Filter

> In [signal processing](https://en.wikipedia.org/wiki/Signal_processing), a **comb filter** is a [filter](https://en.wikipedia.org/wiki/Filter_(signal_processing)) implemented by adding a delayed version of a [signal](https://en.wikipedia.org/wiki/Signal_processing) to itself, causing constructive and destructive [interference](https://en.wikipedia.org/wiki/Interference_(wave_propagation)). The [frequency response](https://en.wikipedia.org/wiki/Frequency_response) of a comb filter consists of a series of regularly spaced notches, giving the appearance of a [comb](https://en.wikipedia.org/wiki/Comb).
>
> \- [Wikipedia](https://en.wikipedia.org/wiki/Comb_filter)

These make the drums sound almost metallic, and at really extreme settings can get to almost reverb sounds. Implementation varies, but I think should be able to be done reasonably easily with the MN3003 64 stage BBD ICs we have. There's also the choice of a feed-**forward** or feed-**back** comb. Quick test and I think feed-back sounds a bitter better on drums. Another option would be to do both, forward on the left, back on the the right. If we're going to have to duplicate the circuit for stereo operation anyway, this seems like an interesting way to make it different in each ear. Again, quick test, and it does sound reasonably good.

With feedback/resonance, combs tend to get a bit peaky in the high end, so we may want at least a 1st order, simple Low pass on this module.

### Sample rate & Bit Reduction

Literally just an ADC wired directly into a DAC, with variable sample rate and varible gating of the less significant bits. We'd also need a dry/wet control to let some of the original signal though

### Distortion

This is probably the most obvious one, but there's a lot of ways to do this. Hard clipping is more or less covered anyway, as it's likely the bass drum will have it built in, and the master output will be able to do it too, so that leaves more tasteful distortion on a module up to use. We could go the easy route and clone a guitar pedal. I have enough germanium transistors to do a real clone of the [Fuzz Face](https://www.electrosmash.com/germanium-fuzz), if we want that noisy, clippy, dirty sound. If we want to go for tubes, we could do a 12ax7 circuit like the [Safety Valve](https://www.lookmumnocomputer.com/the-safety-valve) which doesn't even require high voltage, and still gets adequately filthy.

Given enough time it may make sense to do multiple- the Saftey Valve, Fuzz Face, and maybe a [VFD](https://hackaday.com/2013/11/09/vfd-display-becomes-an-amplifier/) amplifier distortion, as I have tubes laying around for it.

We do need to keep in mind that we'd either need to duplicate the distortion circuit or duplicate the output. Duplicating the output makes the stereo field more boring, but is an option if we are limited by money (tubes, germanium transistors aren't cheap) or size (they're also not small).

If we do a tube distortion - normal vacuum tube or VFD - we'll probably need to do some complicated PCB and panel designs to have the tubes stick out the front.

---

This would give us 4 effect modules to put in the 2 effect slots (or more, if we decide to do multiple distortions) + the 'Master' effects of volume, filter, and compression.



