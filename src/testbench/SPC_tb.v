`timescale 1ns/10ps
`define CYCLE 20
`define DATA "./bitstream.txt"
`define GOLDEN "./sp_convert_golden.txt"

module SPC_tb;


reg clk = 0;
reg reset = 0;
reg en = 0;
reg data [0:1023];
reg [1:0] golden [0:511];
reg din = 0;
wire [1:0] dout;
reg flag;

reg cnt;

integer i, j;

SPC u_SPC(.clk(clk), .reset(reset), .en(en), .dout(dout), .din(din) );

always begin #(`CYCLE/2) clk = ~clk; end

initial $readmemb(`DATA, data);
initial $readmemb(`GOLDEN, golden);

initial begin

	@(posedge clk) reset = 1;
	en = 1;
	#(`CYCLE*3/2) reset = 0;
	for(j = 0; j < 1024; j = j+1) begin
		din = data[j];
		#(`CYCLE);
	end
	$display("pass");
	$finish;

end

initial begin
	@(negedge reset) cnt = 0;
	for(i = 0; i < 1024; i = i + 1) begin
		#(`CYCLE);
		if(cnt == 0) begin
			if(dout != golden[i/2]) begin
				$display("fail");
				$display("%d", i/2);
				$display("output = %d", dout);
				$display("golden = %d", golden[i/2]);
				$finish;
			end 
		end

	end
	$display("pass");
	$finish;
end

always @(posedge clk) begin
	if (reset) begin
		cnt <= 0;
	end
	else begin
		cnt <= cnt + 1;
	end
end


endmodule