`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 12:25:04 PM
// Design Name: 
// Module Name: ShiftRegister
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module ShiftRegister(
    input [1:0]D,
    input reset,
    input clk,
    input en,
    output [9:0]Q
    );
wire d1;
wire [8:0]QBit;
xor OnOrOff(enable, en, D[0], D[1], reset);

not notReset(off, reset);

and andD1(d1, D[1], off);
dff_en first(
	.data_out(Q[0]),
	.in_D( d1 ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ0(QBit[0], Q[0], off);
dff_en second(
	.data_out(Q[1]),
	.in_D( QBit[0] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ1(QBit[1], Q[1], off);
dff_en third(
	.data_out(Q[2]),
	.in_D( QBit[1] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ2(QBit[2], Q[2], off);
dff_en fourth(
	.data_out(Q[3]),
	.in_D( QBit[2] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ3(QBit[3], Q[3], off);
dff_en fifth(
	.data_out(Q[4]),
	.in_D( QBit[3] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ4(QBit[4], Q[4], off);
dff_en sixth(
	.data_out(Q[5]),
	.in_D( QBit[4] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ5(QBit[5], Q[5], off);
dff_en seventh(
	.data_out(Q[6]),
	.in_D( QBit[5] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ6(QBit[6], Q[6], off);
dff_en eigth(
	.data_out(Q[7]),
	.in_D( QBit[6] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ7(QBit[7], Q[7], off);
dff_en ninth(
	.data_out(Q[8]),
	.in_D( QBit[7] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
and andQ8(QBit[8], Q[8], off);
dff_en tenth(
	.data_out(Q[9]),
	.in_D( QBit[8] ),
	.in_CLK( clk ),
	.in_EN( enable )
);
endmodule