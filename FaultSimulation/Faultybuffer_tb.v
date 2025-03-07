`timescale 1ns /1ns

module faultybuffer_tb();

reg a_ip;
wire w_op;

faultybuffer cut(
    .a(a_ip),
    .w(w_op)
);

initial begin
  $dumpfile("trans.vcd");
  $dumpvars(0, faultybuffer_tb);

  $monitor("at time: %t -> a= %b & w= %b", $time, a_ip, w_op);

  a_ip =0;

  #3
  a_ip = 1;
  #1
  $finish;
end
endmodule