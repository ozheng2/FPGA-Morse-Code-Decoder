`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 06:31:29 PM
// Design Name: 
// Module Name: Counter25
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


module Counter25(
    input CLK,
    output [4:0] QBit
    );
wire [4:0] d;
wire [4:0] QBitNot;

// Logic for [4:0] d
// Not variables for each bit
not not0(QBitNot[0], QBit[0]);
not not1(QBitNot[1], QBit[1]);
not not2(QBitNot[2], QBit[2]);
not not3(QBitNot[3], QBit[3]);
not not4(QBitNot[4], QBit[4]);

// For d[4]
// y = ABC' + ACDEF
and andD40(D40, QBit[4], QBitNot[3]);
and andD41(D41, QBit[3], QBit[2], QBit[1], QBit[0]);
or orD4(d[4], D40, D41);

// For d[3]
// y = AB'CD' + AB'CE' + AB'CF' + AC'DEF
and andD30(D30, QBitNot[4], QBit[3], QBitNot[2]);
and andD31(D31, QBitNot[4], QBit[3], QBitNot[1]);
and andD32(D32, QBitNot[4], QBit[3], QBitNot[0]);
and andD33(D33, QBitNot[3], QBit[2], QBit[1], QBit[0]);
or orD3(d[3], D30, D31, D32, D33);

// For d[2]
// y = ADE' + ADF' + AD'EF
and andD20(D20, QBit[2], QBitNot[1]);
and andD21(D21, QBit[2], QBitNot[0]);
and andD22(D22, QBitNot[2], QBit[1], QBit[0]);
or orD2(d[2], D20, D21, D22);

// For d[1]
// y = AE'F + AEF'
and andD10(D10, QBitNot[1], QBit[0]);
and andD11(D11, QBit[1], QBitNot[0]);
or orD1(d[1], D10, D11);

// For d[0]
// y = AB'F' + AC'F'
and andD00(D00, QBitNot[4], QBitNot[0]);
and andD01(D01, QBitNot[3], QBitNot[0]);
or orD0(d[0], D00, D01);

// Flip Flops to make register  
dff dff4 (
	.data_out(QBit[4]),
	.in_D( d[4] ),
	.in_CLK( CLK )
);    
dff dff3 (
	.data_out(QBit[3]),
	.in_D( d[3] ),
	.in_CLK( CLK )
);
dff dff2 (
	.data_out(QBit[2]),
	.in_D( d[2] ),
	.in_CLK( CLK )
);
dff dff1 (
	.data_out(QBit[1]),
	.in_D( d[1] ),
	.in_CLK( CLK )
);
dff dff0 (
	.data_out(QBit[0]),
	.in_D( d[0] ),
	.in_CLK( CLK )
);

endmodule