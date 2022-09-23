## Chapter 18  Inner Hair Cells
### CONTENTS

		18 The Inner Hair Cell . . . 305
		
		18.1 Rectification with a Sigmoid . . . 305
		
		18.2 Adaptive Hair-Cell Models . . . 309 
		
		18.3 A Digital IHC Model . . . 312
	

### SUMMARY

IHCs act as detectors or rectifiers and convert zero-mean bandpass signals (basilar membrane displacements) into firing rates and neural fine time structure.

IHC's basic function is rectification and compression. Its other signal-processing functions includes emphasizing onsets, responding to temporal structure over a range of time scales, and realizing further dynamic-range compression via adaptive nonlinear mechanisms. 

The most important part of the chapter is Figure 18.7 "The Digital IHC block diagram". It describes the four parts in the digital IHC model:

* High-pass filter (helicotrema)
* Transduction nonlinerity (rectification and compression)
* Automatic gain control
* Smoothing

Note that the IIR filter is used four times here. For a detailed discussion of IIR and the meaning of the time constant in it, see the tutorial of [First-Order IIR Filter](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiJlo31_Z76AhWxLEQIHVXZDnoQFnoECAkQAQ&url=http%3A%2F%2Fwww.eecs.umich.edu%2Fcourses%2Feecs206%2Farchive%2Fspring02%2Fnotes.dir%2Fiir4.pdf&usg=AOvVaw0eSe16N6RHEmdiQ5d51DIb). 

### CONCEPTS
- IHC
- Rectification 
- Transduction nonlinearity (Fig. 18.3)
- Conductance (Fig. 18.2)
- Mean-response threshold (P. 307)

### QUESTIONS
- What is the physiological basis for rectification of IHC?
- What are the four stages in the IHC model? 
- Which of the stages could (should) be used in machine hearing models?

### THOUGHTS
- The role of onset
	+ Why is onset so important? Here is an explanation: the perception process of an audio event is first to figure out "something just happened" and then "what is happening". The onset of audio signals associated with an event carries the time stamp of the event, whereas the amplitude of the signals that follows the onset is less important, given that the event is already detected. The onset relates to the "something just happened" and the rest of the signal relates to the nature of the event ("what is happening").
	+ At the onset, to detect soft signals associated with an event, such as an approaching predator, the last few digit of the signals matters more than the first few digits, so the gain is hence very high. Once the event is detected, given that the dynamic range is finite, the first few digits matters more than the last few digits, so the gain is lowered to make the best use of the available dynamic range.


### REFERENCE
- [McDonnell, M. D., & Abbott, D. (2009). What is stochastic resonance? Definitions, misconceptions, debates, and its relevance to biology. PLoS computational biology, 5(5), e1000348.](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000348)