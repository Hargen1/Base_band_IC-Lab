`include "./DFF.v"
`include "./ADDER_18.v"

module SRRC(clk, reset, Din, Dout);

input clk;
input reset;
input [1:0] Din;

output [17:0] Dout;

wire signed [15:0] h [0:32];
wire signed [15:0] din;
wire [17:0] Q_out[0:31];
wire [17:0] Adder_out [0:30];

ADDER_18 u_ADDER_14_0 (.a(h[0]), .b(Q_out[0]), .out(Dout) );
ADDER_18 u_ADDER_14_1 (.a(h[1]), .b(Q_out[1]), .out(Adder_out[0]) );
ADDER_18 u_ADDER_14_2 (.a(h[2]), .b(Q_out[2]), .out(Adder_out[1]) );
ADDER_18 u_ADDER_14_3 (.a(h[3]), .b(Q_out[3]), .out(Adder_out[2]) );
ADDER_18 u_ADDER_14_4 (.a(h[4]), .b(Q_out[4]), .out(Adder_out[3]) );
ADDER_18 u_ADDER_14_5 (.a(h[5]), .b(Q_out[5]), .out(Adder_out[4]) );
ADDER_18 u_ADDER_14_6 (.a(h[6]), .b(Q_out[6]), .out(Adder_out[5]) );
ADDER_18 u_ADDER_14_7 (.a(h[7]), .b(Q_out[7]), .out(Adder_out[6]) );
ADDER_18 u_ADDER_14_8 (.a(h[8]), .b(Q_out[8]), .out(Adder_out[7]) );
ADDER_18 u_ADDER_14_9 (.a(h[9]), .b(Q_out[9]), .out(Adder_out[8]) );
ADDER_18 u_ADDER_14_10 (.a(h[10]), .b(Q_out[10]), .out(Adder_out[9]) );
ADDER_18 u_ADDER_14_11 (.a(h[11]), .b(Q_out[11]), .out(Adder_out[10]) );
ADDER_18 u_ADDER_14_12 (.a(h[12]), .b(Q_out[12]), .out(Adder_out[11]) );
ADDER_18 u_ADDER_14_13 (.a(h[13]), .b(Q_out[13]), .out(Adder_out[12]) );
ADDER_18 u_ADDER_14_14 (.a(h[14]), .b(Q_out[14]), .out(Adder_out[13]) );
ADDER_18 u_ADDER_14_15 (.a(h[15]), .b(Q_out[15]), .out(Adder_out[14]) );
ADDER_18 u_ADDER_14_16 (.a(h[16]), .b(Q_out[16]), .out(Adder_out[15]) );
ADDER_18 u_ADDER_14_17 (.a(h[17]), .b(Q_out[17]), .out(Adder_out[16]) );
ADDER_18 u_ADDER_14_18 (.a(h[18]), .b(Q_out[18]), .out(Adder_out[17]) );
ADDER_18 u_ADDER_14_19 (.a(h[19]), .b(Q_out[19]), .out(Adder_out[18]) );
ADDER_18 u_ADDER_14_20 (.a(h[20]), .b(Q_out[20]), .out(Adder_out[19]) );
ADDER_18 u_ADDER_14_21 (.a(h[21]), .b(Q_out[21]), .out(Adder_out[20]) );
ADDER_18 u_ADDER_14_22 (.a(h[22]), .b(Q_out[22]), .out(Adder_out[21]) );
ADDER_18 u_ADDER_14_23 (.a(h[23]), .b(Q_out[23]), .out(Adder_out[22]) );
ADDER_18 u_ADDER_14_24 (.a(h[24]), .b(Q_out[24]), .out(Adder_out[23]) );
ADDER_18 u_ADDER_14_25 (.a(h[25]), .b(Q_out[25]), .out(Adder_out[24]) );
ADDER_18 u_ADDER_14_26 (.a(h[26]), .b(Q_out[26]), .out(Adder_out[25]) );
ADDER_18 u_ADDER_14_27 (.a(h[27]), .b(Q_out[27]), .out(Adder_out[26]) );
ADDER_18 u_ADDER_14_28 (.a(h[28]), .b(Q_out[28]), .out(Adder_out[27]) );
ADDER_18 u_ADDER_14_29 (.a(h[29]), .b(Q_out[29]), .out(Adder_out[28]) );
ADDER_18 u_ADDER_14_30 (.a(h[30]), .b(Q_out[30]), .out(Adder_out[29]) );
ADDER_18 u_ADDER_14_31 (.a(h[31]), .b(Q_out[31]), .out(Adder_out[30]) );

DFF u_DFF_0 (.clk(clk), .reset(reset), .D(Adder_out[0]), .Q(Q_out[0]) );
DFF u_DFF_1 (.clk(clk), .reset(reset), .D(Adder_out[1]), .Q(Q_out[1]) );
DFF u_DFF_2 (.clk(clk), .reset(reset), .D(Adder_out[2]), .Q(Q_out[2]) );
DFF u_DFF_3 (.clk(clk), .reset(reset), .D(Adder_out[3]), .Q(Q_out[3]) );
DFF u_DFF_4 (.clk(clk), .reset(reset), .D(Adder_out[4]), .Q(Q_out[4]) );
DFF u_DFF_5 (.clk(clk), .reset(reset), .D(Adder_out[5]), .Q(Q_out[5]) );
DFF u_DFF_6 (.clk(clk), .reset(reset), .D(Adder_out[6]), .Q(Q_out[6]) );
DFF u_DFF_7 (.clk(clk), .reset(reset), .D(Adder_out[7]), .Q(Q_out[7]) );
DFF u_DFF_8 (.clk(clk), .reset(reset), .D(Adder_out[8]), .Q(Q_out[8]) );
DFF u_DFF_9 (.clk(clk), .reset(reset), .D(Adder_out[9]), .Q(Q_out[9]) );
DFF u_DFF_10 (.clk(clk), .reset(reset), .D(Adder_out[10]), .Q(Q_out[10]) );
DFF u_DFF_11 (.clk(clk), .reset(reset), .D(Adder_out[11]), .Q(Q_out[11]) );
DFF u_DFF_12 (.clk(clk), .reset(reset), .D(Adder_out[12]), .Q(Q_out[12]) );
DFF u_DFF_13 (.clk(clk), .reset(reset), .D(Adder_out[13]), .Q(Q_out[13]) );
DFF u_DFF_14 (.clk(clk), .reset(reset), .D(Adder_out[14]), .Q(Q_out[14]) );
DFF u_DFF_15 (.clk(clk), .reset(reset), .D(Adder_out[15]), .Q(Q_out[15]) );
DFF u_DFF_16 (.clk(clk), .reset(reset), .D(Adder_out[16]), .Q(Q_out[16]) );
DFF u_DFF_17 (.clk(clk), .reset(reset), .D(Adder_out[17]), .Q(Q_out[17]) );
DFF u_DFF_18 (.clk(clk), .reset(reset), .D(Adder_out[18]), .Q(Q_out[18]) );
DFF u_DFF_19 (.clk(clk), .reset(reset), .D(Adder_out[19]), .Q(Q_out[19]) );
DFF u_DFF_20 (.clk(clk), .reset(reset), .D(Adder_out[20]), .Q(Q_out[20]) );
DFF u_DFF_21 (.clk(clk), .reset(reset), .D(Adder_out[21]), .Q(Q_out[21]) );
DFF u_DFF_22 (.clk(clk), .reset(reset), .D(Adder_out[22]), .Q(Q_out[22]) );
DFF u_DFF_23 (.clk(clk), .reset(reset), .D(Adder_out[23]), .Q(Q_out[23]) );
DFF u_DFF_24 (.clk(clk), .reset(reset), .D(Adder_out[24]), .Q(Q_out[24]) );
DFF u_DFF_25 (.clk(clk), .reset(reset), .D(Adder_out[25]), .Q(Q_out[25]) );
DFF u_DFF_26 (.clk(clk), .reset(reset), .D(Adder_out[26]), .Q(Q_out[26]) );
DFF u_DFF_27 (.clk(clk), .reset(reset), .D(Adder_out[27]), .Q(Q_out[27]) );
DFF u_DFF_28 (.clk(clk), .reset(reset), .D(Adder_out[28]), .Q(Q_out[28]) );
DFF u_DFF_29 (.clk(clk), .reset(reset), .D(Adder_out[29]), .Q(Q_out[29]) );
DFF u_DFF_30 (.clk(clk), .reset(reset), .D(Adder_out[30]), .Q(Q_out[30]) );
DFF u_DFF_31 (.clk(clk), .reset(reset), .D({ h[32][15], h[32][15], h[32] }), .Q(Q_out[31]) );

assign din = { Din , 14'd0};

// coefficient_0 : -0.010271 / 00.000000(-1)0(-1)0(-1)000
assign h[0] = ~( ( din >>> 7 ) + ( din >>> 9 ) + ( din >>> 11 ) ) + 1;

// coefficient_1 : -0.003301 / 00.0000000(-1)001010
assign h[1] = ~( din >>> 8 - ( din >>> 11 ) - ( din >>> 13 ) ) + 1;

// coefficient_2 : 0.011274  / 00.0000010(-1)00(-1)001
assign h[2] = ( din >>> 6 ) - ( din >>> 8 ) - ( din >>> 11 ) + ( din >>> 14 );

// coefficient_3 : 0.016275  / 00.00000100010(-1)0(-1)
assign h[3] = ( din >>> 6 ) + ( din >>> 10 ) - ( din >>> 12 ) - ( din >>> 14 );

// coefficient_4 : 0.002225  / 00.00000000100100
assign h[4] = ( din >>> 9 ) + ( din >>> 12 );

// coefficient_5 : -0.016874 / 00.00000(-1)000(-1)0(-1)00
assign h[5] = ~( ( din >>> 6 ) + ( din >>> 10 ) + ( din >>> 12 ) ) + 1;

// coefficient_6 : -0.014225 / 00.00000(-1)0010(-1)00(-1)
assign h[6] = ~( ( din >>> 6 ) - ( din >>> 9 ) + ( din >>> 11 )  + ( din >>> 14 ) ) + 1;

// coefficient_7 : 0.016997  / 00.0000010010(-1)0(-1)0
assign h[7] = ( din >>> 6 ) + ( din >>> 9 ) - ( din >>> 11 ) - ( din >>> 13 );

// coefficient_8 : 0.043247  / 00.00010(-1)0(-1)000101
assign h[8] = ( din >>> 4 ) - ( din >>> 6 ) - ( din >>> 8 ) + ( din >>> 11 ) + ( din >>> 14 );

// coefficient_9 : 0.014549  / 00.000001000(-1)00(-1)0
assign h[9] = ( din >>> 6 ) - ( din >>> 10 ) - ( din >>> 13 );

// coefficient_10 : -0.077038 / 00.000(-1)0(-1)00010010
assign h[10] = ~( ( din >>> 4 ) + ( din >>> 6 ) - ( din >>> 10 ) - ( din >>> 13 ) ) + 1;

// coefficient_11 : -0.158173 / 00.00(-1)0(-1)000(-1)00000
assign h[11] = ~( ( din >>> 3 ) + ( din >>> 5 ) + ( din >>> 9 ) ) + 1;

// coefficient_12 : -0.105592 / 00.00(-1)001010000(-1)0
assign h[12] = ~( ( din >>> 3 ) - ( din >>> 6 ) - ( din >>> 8 ) + ( din >>> 13 ) ) + 1;

// coefficient_13 : 0.158548  / 00.001010001010(-1)0
assign h[13] = ( din >>> 3 ) + ( din >>> 5 ) + ( din >>> 9 ) + ( din >>> 11 ) - ( din >>> 13 );

// coefficient_14 : 0.579753  / 00.10010100100(-1)0(-1)
assign h[14] = ( din >>> 1 ) + ( din >>> 4 ) + ( din >>> 6 ) + ( din >>> 9 ) - ( din >>> 12 ) - ( din >>> 14 );

// coefficient_15 : 0.973987  / 01.0000(-1)010(-1)0(-1)0(-1)0
assign h[15] = din - ( din >>> 5 ) + ( din >>> 7 ) - ( din >>> 9 ) - ( din >>> 11 ) - ( din >>> 13 );

// coefficient_16 : 1.135254  / 01.00100010101000
assign h[16] = din + ( din >>> 3 ) + ( din >>> 7 ) + ( din >>> 9 ) - ( din >>> 11 );

// coefficient_17 : 0.973987  / 01.0000(-1)010(-1)0(-1)0(-1)0
assign h[17] = din - ( din >>> 5 ) + ( din >>> 7 ) - ( din >>> 9 ) - ( din >>> 11 ) - ( din >>> 13 );

// coefficient_18 : 0.579753  / 00.10010100100(-1)0(-1)
assign h[18] = ( din >>> 1 ) + ( din >>> 4 ) + ( din >>> 6 ) + ( din >>> 9 ) - ( din >>> 12 ) - ( din >>> 14 );

// coefficient_19 : 0.158548  / 00.001010001010(-1)0
assign h[19] = ( din >>> 3 ) + ( din >>> 5 ) + ( din >>> 9 ) + ( din >>> 11 ) - ( din >>> 13 );

// coefficient_20 : -0.105592 / 00.00(-1)001010000(-1)0
assign h[20] = ~( ( din >>> 3 ) - ( din >>> 6 ) - ( din >>> 8 ) + ( din >>> 13 ) ) + 1;

// coefficient_21 : -0.158173 / 00.00(-1)0(-1)000(-1)00000
assign h[21] = ~( ( din >>> 3 ) + ( din >>> 5 ) + ( din >>> 9 ) ) + 1;

// coefficient_22 : -0.077038 / 00.000(-1)0(-1)00010010
assign h[22] = ~( ( din >>> 4 ) + ( din >>> 6 ) - ( din >>> 10 ) - ( din >>> 13 ) ) + 1;

// coefficient_23 : 0.014549  / 00.000001000(-1)00(-1)0
assign h[23] = ( din >>> 6 ) - ( din >>> 10 ) - ( din >>> 13 );

// coefficient_24 : 0.043247  / 00.00010(-1)0(-1)000101
assign h[24] = ( din >>> 4 ) - ( din >>> 6 ) - ( din >>> 8 ) + ( din >>> 11 ) + ( din >>> 14 );

// coefficient_25 : 0.016997  / 00.0000010010(-1)0(-1)0
assign h[25] = ( din >>> 6 ) + ( din >>> 9 ) - ( din >>> 11 ) - ( din >>> 13 );

// coefficient_26 : -0.014225 / 00.00000(-1)0010(-1)00(-1)
assign h[26] = ~( ( din >>> 6 ) - ( din >>> 9 ) + ( din >>> 11 )  + ( din >>> 14 ) ) + 1;

// coefficient_27 : -0.016874 / 00.00000(-1)000(-1)0(-1)00
assign h[27] = ~( ( din >>> 6 ) + ( din >>> 10 ) + ( din >>> 12 ) ) + 1;

// coefficient_28 : 0.002225  / 00.00000000100100
assign h[28] = ( din >>> 9 ) + ( din >>> 12 );

// coefficient_29 : 0.016275  / 00.00000100010(-1)0(-1)
assign h[29] = ( din >>> 6 ) + ( din >>> 10 ) - ( din >>> 12 ) - ( din >>> 14 );

// coefficient_30 : 0.011274  / 00.0000010(-1)00(-1)001
assign h[30] = ( din >>> 6 ) - ( din >>> 8 ) - ( din >>> 11 ) + ( din >>> 14 );

// coefficient_31 : -0.003301 / 00.0000000(-1)001010
assign h[31] = ~( din >>> 8 - ( din >>> 11 ) - ( din >>> 13 ) ) + 1;

// coefficient_32 : -0.010271 / 00.000000(-1)0(-1)0(-1)000
assign h[32] = ~( ( din >>> 7 ) + ( din >>> 9 ) + ( din >>> 11 ) ) + 1;

endmodule