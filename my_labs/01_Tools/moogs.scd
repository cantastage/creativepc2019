(
// Define a simple moog
SynthDef.new("moog", {
	arg freq = 440, amp = 0;
	var osc1; osc1=Saw.ar(freq);
	Out.ar([0,1], amp*osc1);}).add;
)

// Instantiates moog
(
var instr = Synth(\moog);
instr.set(\amp, 1);
)

