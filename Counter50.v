`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 02:30:29 PM
// Design Name: 
// Module Name: Counter500
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Counts to 50
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter50(
    input CLK,
    output [5:0] QBit
    );
wire [5:0] d;
wire [5:0] QBitNot;

// Logic for [5:0] d
// Not variables for each bit
not not0(QBitNot[0], QBit[0]);
not not1(QBitNot[1], QBit[1]);
not not2(QBitNot[2], QBit[2]);
not not3(QBitNot[3], QBit[3]);
not not4(QBitNot[4], QBit[4]);
not not5(QBitNot[5], QBit[5]);

// For d[5]
and andD50(D50, QBit[5], QBitNot[4]);
and andD51(D51, QBit[5], QBitNot[1]);
and andD52(D52, QBit[4], QBit[3], QBit[2], QBit[1], QBit[0]);
or orD5(d[5], D50, D51, D52);

// For d[4]
and andD40(D40, QBit[4], QBitNot[1]);
and andD41(D41, QBitNot[5], QBit[4], QBitNot[3]);
and andD42(D42, QBitNot[5], QBit[4], QBitNot[2]);
and andD43(D43, QBitNot[5], QBit[4], QBitNot[0]);
and andD44(D44, QBitNot[4], QBit[3], QBit[2], QBit[1], QBit[0]);
or orD4(d[4], D40, D41, D42, D43, D44);

// For d[3]
and andD30(D30, QBit[3], QBitNot[2]);
and andD31(D31, QBit[3], QBitNot[1]);
and andD32(D32, QBit[3], QBitNot[0]);
and andD33(D33, QBitNot[3], QBit[2], QBit[1], QBit[0]);
or orD3(d[3], D30, D31, D32, D33);

// For d[2]
and andD20(D20, QBit[2], QBitNot[1]);
and andD21(D21, QBit[2], QBitNot[0]);
and andD22(D22, QBitNot[2], QBit[1], QBit[0]);
or orD2(d[2], D20, D21, D22);

// For d[1]
and andD10(D10, QBitNot[1], QBit[0]);
and andD11(D11, QBitNot[5], QBit[1], QBitNot[0]);
and andD12(D12, QBitNot[4], QBit[1], QBitNot[0]);
or orD1(d[1], D10, D11, D12);

// For d[0]
and andD00(D00, QBitNot[5], QBitNot[0]);
and andD01(D01, QBitNot[4], QBitNot[0]);
and andD02(D02, QBitNot[1], QBitNot[0]);
or orD0(d[0], D00, D01, D02);

// Flip Flops to make register
dff dff5 (
	.data_out(QBit[5]),
	.in_D( d[5] ),
	.in_CLK( CLK )
);    
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