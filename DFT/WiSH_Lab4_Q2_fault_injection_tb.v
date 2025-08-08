`timescale 1ns/1ns

module WiSH_Lab4_Q2_fault_injection_tb();

reg A,B,C,  A0,L1,J0;
wire K;

WiSH_Lab4_Q2_fault_injection dut(.K(K), .A(A), .B(B), .C(C),  .A0(A0),.L1(L1),.J0(J0) );

reg K_faultfree, K_A, K_L, K_J;

initial begin


A=1; B=1; C=1; //test pattern '111'

//faultfree
A0=1; L1=0; J0=1; //no fault injection
#1;
K_faultfree = K;

//fault -> A stuck@0
A0=0; L1=1; J0=1; //fault injection @nodeA
#1; //gives some time for ckt to generate output :) 
K_A = K;
if(K_A!=K_faultfree)
$display("test pattern '111' detects 'A' stuck at '0' ");

//fault -> L stuck@1
A0=1; L1=1; J0=1; //fault injection @nodeL
#1;
K_L = K;
if(K_L!=K_faultfree)
$display("test pattern '111' detects 'L' stuck at '1' ");

//fault -> L stuck@1
A0=1; L1=0; J0=0; //fault injection @nodeJ
#1;
K_J = K;
if(K_J!=K_faultfree)
$display("test pattern '111' detects 'J' stuck at '0' ");


$display("kA=%b | kL=%b | kJ=%b", K_A, K_L, K_J);
$finish;
end

endmodule //try other test patterns as well.oO