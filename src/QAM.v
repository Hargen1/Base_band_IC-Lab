`timescale 1ns/10ps
`include "./FM.v"
`include "./SYN.v"
`include "./SPC.v"
`include "./SM.v"
`include "./US.v"
`include "./SRRC.v"
`include "./DDFS.v"
`include "./MIXER.v"
module QAM(clk, clk_o, reset, en, Bin, IFout);

input clk;
input reset;
input en;
input Bin;
input clk_o;

output [17:0] IFout;

wire en_o;
wire [1:0] SPC_out;
wire [1:0] SM_I_out;
wire [1:0] SM_Q_out;
wire [1:0] US_I_out;
wire [1:0] US_Q_out;
wire [17:0] SRRC_I_out;
wire [17:0] SRRC_Q_out;
wire [1:0] DDFS_I_out;
wire [1:0] DDFS_Q_out;
wire [17:0] MIXER_I_out;
wire [17:0] MIXER_Q_out;

// Synchronizer
SYN 	u_SYN	(	.clk(clk_o),
					.reset(reset),
					.D(en),
					.Q(en_o) );

// S/P converter
SPC 	u_SPC	(	.clk(clk),
					.reset(reset),
					.en(en),
					.din(Bin),
					.dout(SPC_out) );

// Signal Mapping
SM 		u_SM  	(	.din(SPC_out),
					.I_out(SM_I_out),
					.Q_out(SM_Q_out) );

// Up-Sampling Interpolator
US 		u_US_I	(	.clk(clk_o),
					.reset(reset),
					.en(en_o),
					.din(SM_I_out),
					.dout(US_I_out) );

US 		u_US_Q	(	.clk(clk_o),
					.reset(reset),
					.en(en_o),
					.din(SM_Q_out),
					.dout(US_Q_out) );

// Pulse Shaping Filter
SRRC 	u_SRRC_I(	.clk(clk_o),
					.reset(reset),
					.Din(US_I_out),
					.Dout(SRRC_I_out) );

SRRC 	u_SRRC_Q(	.clk(clk_o),
					.reset(reset),
					.Din(US_Q_out),
					.Dout(SRRC_Q_out) );

// DDFS
DDFS 	u_DDFS	(	.clk(clk_o),
					.reset(reset),
					.en(en_o),
					.Iout(DDFS_I_out),
					.Qout(DDFS_Q_out) );

// Mixer
MIXER 	u_MIXER_I(	.clk(clk_o),
					.reset(reset),
					.en(en_o),
					.modin(SRRC_I_out),
					.din(DDFS_I_out),
					.Mout(MIXER_I_out) );

MIXER 	u_MIXER_Q(	.clk(clk_o),
					.reset(reset),
					.en(en_o),
					.modin(SRRC_Q_out),
					.din(DDFS_Q_out),
					.Mout(MIXER_Q_out) );

assign IFout = MIXER_I_out + MIXER_Q_out;

endmodule