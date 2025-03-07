`timescale 1ns/1ns

module MUX_tb;
reg A,B,S;
wire W;
MUX cut(
    .A(A),
    .B(B),
    .S(S),
    .W(W)
);

initial begin
    $monitor("at time: %t -> A= %b B=%b S=%b & w= %b, Sbar=%b", $time, A, B, S,W,cut.Sbar);

    #2 A=0; B=1; S=0;
    #2 A=1; B=0; S=0;
    #2 A=1; B=1; S=0;
    #2 A=0; B=1; S=1;
    #2 A=1; B=0; S=1;
    #2 A=1; B=1; S=1;
    #2
    $finish;
end
endmodule
