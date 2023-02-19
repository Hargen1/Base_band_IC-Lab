module ADDER_18 (a, b, out);

input signed [15:0] a;
input signed [17:0] b;

output signed [17:0] out;

assign out = a + b;

endmodule