module WiSH_Lab4_Q2;

input A, B, C;
output K;

wire E, L, F, H, J;

or  u1(E, B, C);
and u2(H, A, L);
not u3(J, F);
nor u4(K, H, J);

endmodule