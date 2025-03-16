`timescale 1ns/1ns

module WiSH_Lab3_Q2_tb();

reg a,b,c,d,e,f;
wire W, W_f1, W_f2, W_f3, W_f4;
//design under test
WiSH_Lab3_Q2 dut(.W, .W_f1, .W_f2, .W_f3, .W_f4,  .a,.b,.c,.d,.e,.f);

initial begin
$dumpfile("WiSH_Lab3_Q2_tb.vcd");
$dumpvars;
// test pattern 3 | t3: 110101
a=1;b=1;c=0;d=1;e=0;f=1;
#1;

if(W!=W_f1) //(0!=1)
$display("test pattern t3: 110101 detects 'g' stuck at '1' ");
if(W!=W_f2) //(0!=1)
$display("test pattern t3: 110101 detects 'c' stuck at '1' ");
if(W!=W_f3) //(0!=0)
$display("test pattern t3: 110101 detects 'j' stuck at '0' ");
if(W!=W_f4) //(0!=0)
$display("test pattern t3: 110101 detects 'h2' stuck at '0' ");
#1;


// test pattern 4 | t4: 010010
a=0;b=1;c=0;d=0;e=1;f=0;
#1;

if(W!=W_f1) //(1!=1)
$display("test pattern t4: 010010 detects 'g' stuck at '1' ");
if(W!=W_f2) //(1!=1)
$display("test pattern t4: 010010 detects 'c' stuck at '1' ");
if(W!=W_f3) //(1!=0)
$display("test pattern t4: 010010 detects 'j' stuck at '0' ");
if(W!=W_f4) //(1!=0)
$display("test pattern t4: 010010 detects 'h2' stuck at '0' ");

$finish;
end

endmodule