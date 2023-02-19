`timescale 1ns/10ps
`define CYCLE 4

module DDFS_tb;

reg clk = 0;
reg reset = 0;
reg en = 0;
wire [1:0] Iout;
wire [1:0] Qout;

DDFS u_DDFS(.clk(clk), .reset(reset), .en(en), .Iout(Iout), .Qout(Qout) );

always begin #(`CYCLE/2) clk = ~clk; end

initial begin
	@(posedge clk) reset = 1;
	#(`CYCLE);
	@(negedge clk) reset = 0;
	en = 1;
	#(`CYCLE*3000);
	$finish;
end

endmodule