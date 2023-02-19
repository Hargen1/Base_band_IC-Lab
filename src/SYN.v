`timescale 1ns/10ps
module SYN(clk, reset, D, Q);

input clk;
input reset;
input D;
output Q;

reg F1;
reg F2;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		F1 <= 0;
	end
	else begin
		F1 <= D;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		F2 <= 0;
	end
	else begin
		F2 <= F1;
	end
end

assign Q = F2;

endmodule