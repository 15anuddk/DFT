`timescale 1ns/1ns
`include "invertertransistor.v"

module faultybuffer(
    input a,
    output w
);

wire wire1;

invertertransistor b1( .w(wire1), .a(a));
invertertransistor b2( .w(w), .a(wire1));

endmodule