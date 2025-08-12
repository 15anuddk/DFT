module des_tb();

reg A, clk, reset;
wire K;


first uut(.clk(clk),
        .reset(reset),
        .A(A),
        .K(K));

always #5 clk = ~clk;

initial begin
  $dumpfile("des_tb.vcd");
  $dumpvars(0, des_tb);
end

initial begin
  clk = 0;
  reset =1;
  A = 0;

  #10 reset = 0;

#200 reset = 1;
A = 1;
#10 reset = 0;

#200 $finish;
end

endmodule