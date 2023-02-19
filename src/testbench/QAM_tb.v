`timescale 1ns/10ps
`define CYCLE 20
`define PAT "./bitstream.txt"

module QAM_tb;

reg clk;
reg clk_o = 0;
reg reset;
reg Bin;
reg en;
reg mem [0:1023];

wire [17:0] IFout;

integer i, fid;

QAM u_QAM(	.clk(clk),
			.clk_o(clk_o),
			.reset(reset),
			.en(en),
			.Bin(Bin),
			.IFout(IFout) );

always begin #(`CYCLE/2) clk = ~clk; end
always begin #(`CYCLE/4) clk_o = ~clk_o; end

initial $readmemb(`PAT, mem);

initial begin
	fid = $fopen("./QAM_result.txt", "w");
end

initial begin
	clk = 0;
	reset = 0;
	Bin = 0;
	en = 0;
	@(posedge clk) reset = 1;
	#(`CYCLE);
	@(negedge clk) reset = 0;
	en = 1;

	for (i = 0; i < 1024; i = i+1) begin
		Bin = mem[i];
		#(`CYCLE);
	end
	#(`CYCLE*512);
	$fclose(fid);
	$finish;
end

always @(negedge clk_o) begin
	$display(IFout);
	$fwrite(fid, "%d\n" , IFout);
end

endmodule