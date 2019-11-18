declare name "bm-kick";
declare version "0.1";
declare author "Bjornmossa";
declare license "GPL v3";

import("stdfaust.lib");

body(tr, tone) = os.osci(60 * (en.ar(0.001, 0.05, tr) + tone) * en.ar(0.01, 1.0, tr));
click(tr) = (os.sawtooth(55) * en.ar(0.001, 0.009, tr)) : fi.resonlp(120, 1, 0.5);
noise(tr, tail) = (no.noise * en.ar(0.001, tail, tr)) :  fi.resonlp(120, 1, 0.5);

_kick = body(tr, tone), click(tr), noise(tr, tail) :> _
with {
  tr = button("trig");
  tail = vslider("noise tail[style:knob]", 0.1, 0.02, 0.5, 0.01);
  tone = vslider("tone[style:knob]", 1.0, 0.01, 1.2, 0.01);
};

process = hgroup("bm-kick", _kick);