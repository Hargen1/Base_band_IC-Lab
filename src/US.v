`include "./SYN.v"

module US (clk, reset, en, din, dout);

input clk;
input reset;
input en;
input [1:0] din;

output reg [1:0] dout;

reg [1:0] cnt;
wire Q_out;

SYN SYN(.clk(clk), .reset(reset), .D(din[1]), .Q(Q_out) );

always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt <= 0;
	end
	else if (en) begin
		cnt <= cnt + 1;
	end
	else begin
		cnt <= 0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		dout <= 0;
	end
	else if (en) begin
		dout <= (cnt == 3)? { Q_out, 1'b1 } : 0 ;
	end
	else begin
		dout <= dout;
	end
end

endmodule