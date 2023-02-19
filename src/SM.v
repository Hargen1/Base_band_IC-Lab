module SM(din, I_out, Q_out);

input [1:0] din;

output reg [1:0] I_out;
output reg [1:0] Q_out;

always @(*) begin
	if (din == 2'b00) begin
		I_out = 2'b01;
		Q_out = 2'b01;
	end
	else if (din == 2'b01) begin
		I_out = 2'b01;
		Q_out = 2'b11;
	end
	else if (din == 2'b10) begin
		I_out = 2'b11;
		Q_out = 2'b01;
	end
	else begin
		I_out = 2'b11;
		Q_out = 2'b11;
	end
end

endmodule