`timescale 1ns/1ns
`include "invertertransistor.v"

module MUX(
    input A,B,S,
    output W
);

wire Sbar, AandSbar, BandS;
invertertransistor b1(
    .a(S),
    .w(Sbar)
);

and a1(AandSbar, Sbar, A);
and a2(BandS, S, B);

or o1(W, AandSbar, BandS);

endmodule