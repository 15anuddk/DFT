module invertertransistor(
    input a,
    output w
);

nmos mn (w, 0, 0);
pmos mp (w, 1, 0);

endmodule