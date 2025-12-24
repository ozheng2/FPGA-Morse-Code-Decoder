`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 04:03:21 PM
// Design Name: 
// Module Name: FinalProj
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

module Top(
    input clk,
	input btnU,
	input btnD,
	input [15:0] sw,
    output [15:0] led,
    output [6:0] seg
    );
    
wire [3:0] clkDivWire;
wire [1:0] Q;
wire dot;
wire dash;
wire inactivity;
wire [9:0]Reg;
wire [2:0]count;
//wire [4:0]code;
wire [5:0]code;

ClockDivider50 div0(
    .CLK(clk),
    .clk_div(clkDivWire[0])
);
ClockDivider50 div1(
    .CLK(clkDivWire[0]),
    .clk_div(clkDivWire[1])
);  
ClockDivider50 div2(
    .CLK(clkDivWire[1]),
    .clk_div(clkDivWire[2])
);
ClockDivider25 div3(
    .clk_div(clkDivWire[3]),
    .CLK(clkDivWire[2])
);

Counter4 dotOrDashCode(
    .CLK(clkDivWire[3]),
    .enable(btnU),
    .Q( {Q[1], Q[0]} )
);
assign led[3] = Q[0];
assign led[4] = Q[1];

DotOrDashDecoder dotOrDashReal(
    .en(sw[0]),
    .code( {Q[1], Q[0]} ),
    .dot(dot),
    .dash(dash),
    .inactivity(inactivity)
);

ShiftRegister memory(
    .D( {dash, dot} ),
    .reset(btnD),
    .clk(clkDivWire[3]),
    .en(btnU),
    .Q( {Reg[9], Reg[8], Reg[7], Reg[6], Reg[5], Reg[4], Reg[3], Reg[2], Reg[1], Reg[0]} )
);
assign led[15] = Reg[9];
assign led[14] = Reg[8];
assign led[13] = Reg[7];
assign led[12] = Reg[6];
assign led[11] = Reg[5];
assign led[10] = Reg[4];
assign led[9] = Reg[3];
assign led[8] = Reg[2];
assign led[7] = Reg[1];
assign led[6] = Reg[0];

Counter5 countTo5(
    .CLK(btnU),
    .reset(btnD),
    .switch(sw[0]),
    .QBit( {count[2], count[1], count[0]} )
);
assign led[2] = count[2];
assign led[1] = count[1];
assign led[0] = count[0];

//Translate translate(
//    .num( {count[2], count[1], count[0]} ),
//    .Reg( {Reg[6], Reg[4], Reg[2], Reg[0]} ),
//    .code( {code[4], code[3], code[2], code[1], code[0]} )
//);

Translate3 translate(
    .count( {count[2], count[1], count[0]} ),
    .Reg( {Reg[8], Reg[6], Reg[4], Reg[2], Reg[0]} ), 
    .code( {code[5], code[4], code[3], code[2], code[1], code[0]} ) 
);

SevenSeg display(
    //.Q( {sw[6:0]} ),
    //.Q( {code[4], code[3], code[2], code[1], code[0]} ),
    .Q( {code[5], code[4], code[3], code[2], code[1], code[0]} ),
    .seg( {seg[6], seg[5], seg[4], seg[3], seg[2], seg[1], seg[0]} )
);


endmodule
