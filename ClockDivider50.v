`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 11:23:45 PM
// Design Name: 
// Module Name: ClockDivider50
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


module ClockDivider50(
    input CLK,
    output clk_div
    );
wire [5:0] QBit;

// Counts to 50
Counter50 counter(
    .CLK(CLK),
    .QBit( {QBit[5], QBit[4], QBit[3], QBit[2], QBit[1], QBit[0]} )
);

// Checks to see if 50 is reached and sends out clk_div output based on the current count
Comparator50 comparator(
    .Q( {QBit[5], QBit[4], QBit[3], QBit[2], QBit[1], QBit[0]} ),
    .CLK(CLK),
    .clk_div (clk_div)
);

endmodule