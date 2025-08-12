// Code your design here
module first(
    input A,
    input clk,
    input reset,
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

always @(posedge clk) begin
  if(reset) begin
    qB <= 0;
    qC <= 0;
  end
  else begin
    qB <= B;
    qC <= C;
  end
end

endmodule