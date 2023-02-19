module SPC (clk, reset, en, din, dout);

input clk;
input reset;
input din;
input en;

output [1:0] dout;

reg temp;
reg temp2;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		temp <= 0;
	end
	else if (en) begin
		temp <= din;
	end
	else begin
		temp <= temp;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		temp2 <= 0;
	end
	else if (en) begin
		temp2 <= temp;
	end
	else begin
		temp2 <= temp2;
	end
end

assign dout[1] = temp2;
assign dout[0] = din;

endmodule