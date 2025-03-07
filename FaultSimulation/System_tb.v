`timescale 1ns/1ns

module System_tb();
//Inputs
reg [3:0] Abus;
reg SelB, LoadAc, clk, AddAlu;
wire [3:0] outbus;

System cut(
    .Abus(Abus),
    .SelB(SelB),
    .LoadAc(LoadAc),
    .clk(clk),
    .AddAlu(AddAlu),
    .outbus(outbus)
);

always #5 clk = ~clk;
initial begin
  clk = 0;
  $monitor("at time:%t-> ABus = %b, SelB = %b AC_out = %b | AC = %b & OutBus = %b | BBus = %b", $time , Abus, SelB, cut.AC_out,cut.AC, outbus, cut.Bbus);
  LoadAc = 1;
  AddAlu = 1;

  Abus =4'hf;
  SelB = 0;

  #5
  SelB= 1;
  Abus= 4'h6;
  #8
  $finish;
end
endmodule
