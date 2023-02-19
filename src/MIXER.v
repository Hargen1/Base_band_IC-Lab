module MIXER(clk, reset, en, modin, din, Mout);

input clk;
input reset;
input en;
input [17:0] modin;
input [1:0] din;

output reg [17:0] Mout;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		Mout <= 18'd0;
	end
	else if (en) begin
		case(din)
			2'b00: Mout <= 18'd0;
			2'b01: Mout <= modin;
			2'b11: Mout <= ~modin + 1;
			default: Mout <= Mout;
		endcase
	end
	else begin
		Mout <= Mout;
	end
end

endmodule