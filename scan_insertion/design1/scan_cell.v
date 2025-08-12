module scan_cell(
    input clk,
    input TM,
    input DI,
    input SI,
    output DO,
    output SO
);

reg Q; 
wire D;

assign D = (TM == 1) ? SI : DI;

always @(posedge clk) begin
  Q <= D;
end

assign SO = Q;
assign DO = Q;

endmodule