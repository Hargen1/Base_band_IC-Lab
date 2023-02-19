`timescale 1ns/10ps
module DFF (clk, reset, D, Q);

input clk;
input reset;
input [17:0] D;

output reg [17:0] Q;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		Q <= 0;
	end
	else begin
		Q <= D;
	end
end

endmodule