`timescale 1ns/10ps
`define CYCLE 16
`define CYCLE_4 4
`define PAT_I "./signal_mapping_I_golden.txt"
`define PAT_Q "./signal_mapping_Q_golden.txt"
`define EXP_I "./up_sampling_I_golden.txt"
`define EXP_Q "./up_sampling_Q_golden.txt"

module US_tb;

reg clk_4 = 0;
reg clk = 0;
reg reset = 0;
reg en = 0;
reg [1:0] din;
wire [1:0] dout;

reg [1:0] I_data [0:511];
reg [1:0] Q_data [0:511];

reg [1:0] I_golden [0:2047];
reg [1:0] Q_golden [0:2047];

integer i, j;

always begin #(`CYCLE_4/2) clk_4 = ~clk_4; end
always begin #(`CYCLE/2) clk = ~clk; end

US u_US(.clk(clk_4), .reset(reset), .en(en), .din(din), .dout(dout) );

initial $readmemb(`PAT_I, I_data);
initial $readmemb(`PAT_Q, Q_data);
initial $readmemb(`EXP_I, I_golden);
initial $readmemb(`EXP_Q, Q_golden);

// // DATA I
// initial begin
// 	din = 0;
// 	@(posedge clk_4) reset = 1;
// 	#(`CYCLE);
// 	@(negedge clk_4) reset = 0;
// 	en = 1;
// 	for(i = 0; i < 512; i = i+1) begin
// 		din = I_data[i];
// 		#(`CYCLE*4);
// 	end
// 	$display("ALL PASS");
// 	$finish;
// end

// initial begin
// 	#(`CYCLE*2);
// 	for(j = 0; j < 2048; j = j+1) begin
// 		#(`CYCLE);
// 		if (dout == I_golden[j]) begin
// 			$display("%d data pass", j+1);
// 		end
// 		else begin
// 			$display("%d data error", j+1);
// 			$display("golden = %d", I_golden[j]);
// 			$display("output = %d", dout);
// 			$finish;
// 		end
// 	end
// end

// DATA Q
initial begin
	din = 0;
	@(posedge clk_4) reset = 1;
	#(`CYCLE_4);
	@(negedge clk_4) reset = 0;
	en = 1;
	for(i = 0; i < 512; i = i+1) begin
		din = Q_data[i];
		#(`CYCLE);
	end
	#(`CYCLE);
	$display("ALL PASS");
	$finish;
end

initial begin
	#(`CYCLE_4*4);
	for(j = 0; j < 2048; j = j+1) begin
		#(`CYCLE_4);
		if (dout == Q_golden[j]) begin
			$display("%d data pass", j+1);
		end
		else begin
			$display("%d data error", j+1);
			$display("golden = %d", Q_golden[j]);
			$display("output = %d", dout);
			$finish;
		end
	end
end

endmodule