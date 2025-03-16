`timescale 1ns/1ns
module testbench();
reg a,b,c, a1, b0, c1, e1, f0;
wire f;

reg [7:0] faultfree;

//faulty "a" resultant vector
reg [7:0] f_a1;
//faulty "b" resultant vector
reg [7:0] f_b0;
//faulty "c" resultant vector
reg [7:0] f_c1;
//faulty "e" resultant vector
reg [7:0] f_e1;
//faulty "f" resultant vector
reg [7:0] f_f0;

reg a1_fault = 1, b0_fault = 0, c1_fault = 1, e1_fault = 1, f0_fault = 0;
reg a1_ff = 0, b0_ff = 1, c1_ff = 0, e1_ff = 0, f0_ff = 1;

reg [2:0] tests = 0;

faultfree ff (.f(f), .a(a),.b(b),.c(c), .a1(a1),.b0(b0),.c1(c1),.e1(e1),.f0(f0));

initial begin
  //fault free simulation ----------------
//No fault injection (fault-free)
a1 = a1_ff; b0 = b0_ff; c1 = c1_ff; e1 = e1_ff; f0 = f0_ff;
//test patterns
for (integer i=0; i<8; i=i+1)begin
{a,b,c} = tests;
#1;
tests = tests + 1;
faultfree[i] = f;
#2;
end

$display("******************************** a stuck at 1 ***************************");
//"a" stuck at "1" fault Parallel Fault Simulation
tests = 3'b0;
a1 = a1_fault; b0 = b0_ff; c1 = c1_ff; e1 = e1_ff; f0 = f0_ff;
//test patterns
for (integer i=0; i<8; i=i+1)begin
{a,b,c} = tests;
#1;
tests = tests + 1;
f_a1[i] = f;
#2;
if(faultfree[i] != f_a1[i])
$display("time =%t test pattern { a = %b | b = %b | c= %b } detects -a- stuck at -1- fault ",$time, a, b, c );
else
$display("time =%t test pattern { a = %b | b = %b | c= %b } CANNOT detect -a- stuck at -1- fault",$time, a,b,c);
end
#2

$display("******************************** b stuck at 0 ***************************");
// "b" stuck at "0" fault Parallel Fault Simulation
tests = 3'b0;
a1 = a1_ff; b0 = b0_fault; c1 = c1_ff; e1 = e1_ff; f0 = f0_ff;
for (integer i=0; i<8; i=i+1)begin
{a,b,c} = tests;
#1;
tests = tests + 1;
f_b0[i] = f;
#2;
if(faultfree[i] != f_b0[i])
$display("time =%t test pattern { a = %b | b = %b | c= %b } detects -a- stuck at -1- fault ",$time, a, b, c );
else
$display("time =%t test pattern { a = %b | b = %b | c= %b } CANNOT detect -a- stuck at -1- fault",$time, a,b,c);
end
#2 $finish;
end

endmodule