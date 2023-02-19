`timescale 1ns/10ps
`define CYCLE 4
`define PAT_I "./up_sampling_I_golden.txt"
`define PAT_Q "./up_sampling_Q_golden.txt"

module SRRC_tb;

reg clk = 0;
reg reset = 0;
reg [1:0] din;
reg [1:0] I_mem [0:2047];
reg [1:0] Q_mem [0:2047];

wire [17:0] dout;

integer i, j, fid;



always begin #(`CYCLE/2) clk = ~clk; end

initial $readmemb(`PAT_I, I_mem);
initial $readmemb(`PAT_Q, Q_mem);

initial begin
	fid = $fopen("./SRRC_result.txt", "w");
end

SRRC u_SRRC(.clk(clk), .reset(reset), .Din(din), .Dout(dout) );

initial begin
	din = 0;
	@(posedge clk) reset = 1;
	#(`CYCLE);
	@(negedge clk) reset = 0;

	for(i = 0; i < 2048; i = i+1) begin
		din = I_mem[i];
		#(`CYCLE);	
	end
	
end

initial begin
	#(`CYCLE*2);
	for(j = 0; j < 2048; j = j+1) begin
		#(`CYCLE);
		$display("%d dout = %d", j, dout);
		$fwrite(fid, "%b\n", dout);
	end
	$fclose(fid);
	$finish;
end

endmodule