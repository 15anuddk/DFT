module WiSH_Lab3_Q2( W, W_f1, W_f2, W_f3, W_f4, a,b,c,d,e,f);


output W, W_f1, W_f2, W_f3, W_f4;
input a,b,c,d,e,f;

wire g, h,h1,h2, j, k, m, l;

not u1(g,a);
or  u2(h,d,e);
assign h1=h;
assign h2=h;
and u3(j,g,b);
and u4(k,c,h1);
or  u5(l,f,h2);
or  u6(m,j,k);
and u7(W,m,l);

//concurrent hardware for f1: g stuck at 1

wire j_f1, m_f1;

and f1_1(j_f1, b, 1); // g stuck @1
or  f1_2(m_f1, j_f1, k);
and f1_3(W_f1, m_f1, l);

//concurrent hardware for f2: c stuck at 1

wire k_f2, m_f2;

and f2_1(k_f2, h1, 1); //c stuck @1;
or  f2_2(m_f2, j, k_f2);
and f2_3(W_f2, m_f2, k_f2);


//concurrent hardware for f3: j stuck at 0

wire m_f3;

or  f3_1(m_f3, k, 0); // j:stuck at '0'
and f3_2(W_f3, m_f3, l);


//concurrent hardware for f4: h2 stuck at 0

wire l_f4;

or  f4_1(l_f4, f, 0); // h2:stuck at '0'
and f4_2(W_f4, l_f4, m);



endmodule