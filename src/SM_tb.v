`timescale 1ns/10ps
`define CYCLE 20
`define GOLEN_I "./signal_mapping_I_golden.txt"
`define GOLEN_Q "./signal_mapping_Q_golden.txt"
`define PAT     "./sp_convert_golden.txt"

module SM_tb;

reg clk = 0;
reg [1:0] data_mem [0:511];
reg [1:0] din = 0;
reg [1:0] I_mem [0:511];
reg [1:0] Q_mem [0:511];

wire [1:0] I_out;
wire [1:0] Q_out;

integer i;

initial $readmemb(`GOLEN_I, I_mem);
initial $readmemb(`GOLEN_Q, Q_mem);
initial $readmemb(`PAT, data_mem);

always begin #(`CYCLE/2) clk = ~clk; end

SM u_SM(.din(din), .I_out(I_out), .Q_out(Q_out) );

initial begin
	din = 0;
	#(`CYCLE);
	for (i = 0; i < 512; i = i+1) begin
		din = data_mem[i];
		#(`CYCLE/2);
		if (I_out == I_mem[i] && Q_out == Q_mem[i]) begin
			$display("%d PASS data", i);
		end
		else begin
			$display("%d ERROR", i);
			$display("GOLEN_I = %d, OUTPUT = %d", I_mem[i], I_out);
			$display("GOLEN_Q = %d, OUTPUT = %d", Q_mem[i], Q_out);
			$finish;
		end
		#(`CYCLE/2);
	end
	$display("ALL PASS");
	$finish;
end

endmodule