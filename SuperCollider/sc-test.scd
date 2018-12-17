// Command-B to boot

// Most programming languages can pick values
// at 'random' - computers can't actually understand
// the concept of random, but that is a discussion
// for another day...


[200, 300, 400, 500].choose;

[2*100, 3*100, 4*100, 5*100].choose;

[60, 62, 64, 65].choose;




// Here is a physical model of a string
(
{
	var attack = 0;
	var decay = 0.01;
	var gate = Impulse.kr(1);
	var env = EnvGen.kr(Env.perc(attack, decay), gate);
	var sig = PinkNoise.ar(env);
	var maxdelay = 0.5;
	var feedback = 2;
	var delaytime = 69.midicps.reciprocal;

	CombL.ar(sig, maxdelay, delaytime, feedback) ! 2

}.play
)


// The same again, but this time the notes will be
// picked at random from a given list.
// Try changing the note numbers in the notechoice
// list, or changing the gate speed.
(
{
	var notechoice = [60, 62, 64, 65, 67].choose; // MIDI note numbers
	var attack = 0;
	var decay = 0.01;
	var gate = Impulse.kr(1/2);
	var env = EnvGen.kr(Env.perc(attack, decay), gate);
	var sig = PinkNoise.ar(env);
	var maxdelay = 0.5;
	var feedback = 2;
	var delaytime = notechoice.midicps.reciprocal;

	CombL.ar(sig, maxdelay, delaytime, feedback) ! 2

}.play
)

