module faultfree(
    input a,b,c, a1, b0, c1, e1, f0,
    output wire f 
);

// stuck at faults: a/1, , b/0, c/1, e/1, f/0
wire d,e, aa1, bb0, cc1, ee1, ff0;

assign aa1 = a | a1;
assign bb0 = b & b0;
assign cc1 = c | c1;
assign d = aa1 & bb0;
assign e = cc1 | bb0;
assign ee1 = e | e1;
assign ff0 = ~(d & ee1);
assign f = ff0 & f0;

endmodule