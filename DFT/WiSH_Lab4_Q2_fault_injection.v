module WiSH_Lab4_Q2_fault_injection(K, A, B, C,  A0,L1,J0);

input A, B, C,  A0,L1,J0;
output K;

wire E, L, F, H, J,  AA0, LL1, JJ0;

//FAULT INJECTION 
and f1(AA0, A, A0);
and u2(H, AA0, LL1);

or  u1(E, B, C);
assign L = E;
assign F = E;
or  f2(LL1, L, L1);


not u3(J, F);
and f3(JJ0, J, J0);

nor u4(K, H, JJ0);

endmodule