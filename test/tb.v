`default_nettype none
`timescale 1ns / 1ps
module tb;
reg clk=0,rst_n=0,ena=1; reg [7:0] ui_in=0; wire [7:0] uo_out,uio_out,uio_oe; tri [7:0] uio_in;
assign uio_in[5:0]=uio_oe[5:0]?uio_out[5:0]:6'bz;
assign uio_in[7:6]=8'bz;
tt_um_jmarin_3lfcc dut(.ui_in(ui_in),.uo_out(uo_out),.uio_in(uio_in),.uio_out(uio_out),.uio_oe(uio_oe),.ena(ena),.clk(clk),.rst_n(rst_n));
always #18.5185 clk=~clk; initial begin $dumpfile("tb.fst");$dumpvars(0,tb);#100 rst_n=1;#100000 $finish;end
endmodule
