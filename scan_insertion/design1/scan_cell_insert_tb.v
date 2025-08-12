module insertion_tb();

reg A,clk,reset,SI,TM;
wire SO, K;

insertion uut(.clk(clk),
              .A(A),
              .reset(reset),
              .SI(SI),
              .TM(TM),
              .SO(SO),
              .K(K));

  initial clk = 0;

  always #2 clk = ~clk;
  
  initial begin
    A = 1;  //test pattern : {A, qB, qC} = {1 0 1}
	
	//cycle-1
	SI = 1; //qC=1
	TM = 1;
	#3;
	
	//cycle-2
	SI = 0; //qB=0
	TM = 1;
	#5;
	
	
	SI = 1; TM = 1;
	#3;
	
  end


endmodule