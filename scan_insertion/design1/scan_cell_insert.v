// Code your design here
module insertion(
    input A,
    input clk,
    input reset,
    input SI,
    input TM,
    output SO,
    output K
);

wire D,G,J,I,S,H,C,B;
reg qB,qC;

or g1(D,qB,qC);

assign G = D;
assign I = D;

and g2(H,A,G);
not g3(J,I);

assign S = J;
assign C = J;
assign B = H;
  
nor g4(K,H,S);


wire w;
scan_cell sc1(.clk(clk),
              .TM(TM),
              .DI(B),
              .SI(SI),
              .DO(qB),
              .SO(w));

scan_cell sc2(.clk(clk),
              .TM(TM),
              .DI(C),
              .SI(w),
              .DO(qC),
              .SO(SO));

endmodule