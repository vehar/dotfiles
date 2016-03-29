(* These are some standard Mathematica definitions I use.
   Be warned: here be dragons of a noob's design! Anything that works is probably
   someone else's, and anything that is broken is probably mine. *)

(* Just so I know it's not totally stock. *)
Print["Convenience definitions loaded."]

(* PlusMinus does not have an intrinsic definition and must be bound.  Similiar
   rules are recommended by the Wolfram manual, but I grabbed these in particular
   from `https://github.com/Tyilo/Mathematica-init.m`. *)
PlusMinus[{a1_, a2_}] := Module[{r},
	r = {a1, -a2};
	If[r[[1]] == r[[2]], r[[1]], r, r]
];
PlusMinus[a_] := PlusMinus[{a, a}];
PlusMinus[{a1_, a2_}, {b1_, b2_}] := Module[{r},
	r = {a1 + b1, a2 - b2};
	If[r[[1]] == r[[2]], r[[1]], r, r]
];
PlusMinus[{a1_, a2_}, b_] := PlusMinus[{a1, a2}, {b, b}];
PlusMinus[a_, {b1_, b2_}] := PlusMinus[{a, a}, {b1, b2}];
PlusMinus[a_, b_] := PlusMinus[{a, a}, {b, b}];

MinusPlus[{a1_, a2_}] := Module[{r},
	r = {-a1, a2};
	If[r[[1]] == r[[2]], r[[1]], r, r]
];
MinusPlus[a_] := MinusPlus[{a, a}];
MinusPlus[{a1_, a2_}, {b1_, b2_}] := Module[{r},
	r = {a1 - b1, a2 + b2};
	If[r[[1]] == r[[2]], r[[1]], r, r]
];
MinusPlus[{a1_, a2_}, b_] := MinusPlus[{a1, a2}, {b, b}];
MinusPlus[a_, {b1_, b2_}] := MinusPlus[{a, a}, {b1, b2}];
MinusPlus[a_, b_] := MinusPlus[{a, a}, {b, b}];

AverageValue[f_, {x_, a_, b_}] := 1/(b - a) * Integrate[f, {x, a, b}];
AverageValue::usage = "AverageValue[f[x], {x, a, b}] computes the average value of f[x] with respect to x over the interval {a, b}.";
SyntaxInformation[AverageValue] = {"ArgumentsPattern" -> {_, {_, _, _}}, "LocalVariables" -> {"Plot", {2, 2}}};
