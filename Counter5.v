`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 02:48:57 PM
// Design Name: 
// Module Name: Counter5
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


module Counter5(
    input CLK,
    input reset,
    input switch,
    output [2:0] QBit
);
wire [2:0] d;
wire [2:0] QBitNot;


or enable1(enable0, CLK, reset);
and enable(en, enable0, switch);

not notReset(off, reset);
not not0(QBitNot[0], QBit[0]);
not not1(QBitNot[1], QBit[1]);
not not2(QBitNot[2], QBit[2]);

// For d[2]
// y = A'B + A'CD
and andD20(D20, off, QBit[2]);
and andD21(D21, off, QBit[1], QBit[0]);
or orD2(d[2], D20, D21);

// For d[1]
// y = A'CD' + A'B'C'D
and andD10(D10, off, QBit[1], QBitNot[0]);
and andD11(D11, off, QBitNot[2], QBitNot[1], QBit[0]);
or orD1(d[1], D10, D11);

// For d[0]
// y = A'D' + A'B
and andD00(D00, off, QBitNot[0]);
and andD01(D01, off, QBit[2]);
or orD0(d[0], D00, D01);

// Flip Flops to make register  
//and andD2(d2, d[2], off);
dff_en dff2 (
	.data_out(QBit[2]),
	.in_D( d[2] ),
	.in_CLK( en ),
	.in_EN( en )
);
//and andD1(d1, d[1], off);
dff_en dff1 (
	.data_out(QBit[1]),
	.in_D( d[1] ),
	.in_CLK( en ),
	.in_EN( en )
);
//and andD0(d0, d[0], off);
dff_en dff0 (
	.data_out(QBit[0]),
	.in_D( d[0] ),
	.in_CLK( en ),
	.in_EN( en )
);

endmodule