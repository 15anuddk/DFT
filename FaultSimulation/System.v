`timescale 1ns/1ns
`include "MUX.v"

module System(
    input [3:0] Abus,
    input SelB, LoadAc, AddAlu, clk,
    output [3:0] outbus
);

wire [3:0] Bbus;

wire [3:0] AC_out;
reg [3:0] AC, Add;

MUX m0(
    .A(Abus[0]),
    .B(Bbus[0]),
    .S(SelB),
    .W(AC_out[0])
);

MUX m1(
    .A(Abus[1]),
    .B(Bbus[1]),
    .S(SelB),
    .W(AC_out[1])
);

MUX m2(
    .A(Abus[2]),
    .B(Bbus[2]),
    .S(SelB),
    .W(AC_out[2])
);

MUX m3(
    .A(Abus[3]),
    .B(Bbus[3]),
    .S(SelB),
    .W(AC_out[3])
);

always @(posedge clk) begin
    if(LoadAc)
        AC <= AC_out;
end

assign outbus = AC;
assign Bbus = Abus + AC;

endmodule

