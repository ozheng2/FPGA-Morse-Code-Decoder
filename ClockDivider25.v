`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 12:39:22 AM
// Design Name: 
// Module Name: ClockDivider25
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


module ClockDivider25(
    output [13:0] led,
    output clk_div,
    input CLK
    );
wire [5:0] QBit;
wire clk_div;

assign led[13] = clk_div;
assign led[4] = QBit[4];
assign led[3] = QBit[3];
assign led[2] = QBit[2];
assign led[1] = QBit[1];
assign led[0] = QBit[0];

// Counts to 50
Counter25 counter(
    .CLK(CLK),
    .QBit( {QBit[4], QBit[3], QBit[2], QBit[1], QBit[0]} )
);

// Checks to see if 25 is reached and sends out clk_div output based on the current count
Comparator25 comparator(
    .Q( {QBit[4], QBit[3], QBit[2], QBit[1], QBit[0]} ),
    .CLK(CLK),
    .clk_div (clk_div)
);

endmodule