`timescale 1ns/10ps
`define CYCLE 4
`define PAT "./SRRC_result_bin.txt"

module MIXER_tb;

reg clk = 0;
reg reset = 0;
reg en = 0;
reg [17:0] modin;
reg signed [17:0] mem [0:2047];
wire [1:0] Iout;
wire [1:0] Qout;
wire [17:0] Mout;


integer i, j, fid;

MIXER u_MIXER(.clk(clk), .reset(reset), .en(en), .modin(modin), .din(Qout), .Mout(Mout) );
DDFS u_DDFS(.clk(clk), .reset(reset), .en(en), .Iout(Iout), .Qout(Qout));

always begin #(`CYCLE/2) clk = ~clk; end

initial $readmemb(`PAT, mem);

initial begin
	fid = $fopen("./Mixer_result.txt", "w");
end

initial begin
	modin = 0;
	@(posedge clk) reset = 1;
	#(`CYCLE);
	@(negedge clk) reset = 0;
	en = 1;
	for(i = 0; i < 2048; i = i+1) begin
		modin = mem[i];
		#(`CYCLE);
	end
	
end

initial begin
	#(`CYCLE*2);
	for(j = 0; j < 2048; j = j+1) begin
		#(`CYCLE);
		$display("%d Mout = %d", j, Mout);
		$fwrite(fid, "%d\n", Mout);
	end
	$fclose(fid);
	$finish;
end

endmodule