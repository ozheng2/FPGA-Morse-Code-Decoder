`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 06:18:41 PM
// Design Name: 
// Module Name: Comparator500
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


module Comparator50(
    input [5:0] Q,
    input CLK,
    output clk_div
    );
wire [3:0] muxWire;
wire Qnot, EQ;

// Checks up to 15    
mux #(16,1) mux0 (
	.data_out(muxWire[0]),
	.select_in( {Q[3], Q[2], Q[1], Q[0]} ),
	.data_in( {1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx} )
);
// Checks up to 31
mux #(16,1) mux1 (
	.data_out(muxWire[1]),
	.select_in( {Q[3], Q[2], Q[1], Q[0]} ),
	.data_in( {1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx} )
);
// Checks up to 47
mux #(16,1) mux2 (
	.data_out(muxWire[2]),
	.select_in( {Q[3], Q[2], Q[1], Q[0]} ),
	.data_in( {1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx} )
);
// Checks up to 63
mux #(16,1) mux3 (
	.data_out(muxWire[3]),
	.select_in( {Q[3], Q[2], Q[1], Q[0]} ),
	.data_in( {1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'b1,1'bx,1'bx} )
);
// Connects the muxes together
mux # (4,1) muxCombiner (
	.data_out(EQ),
	.select_in( {Q[5], Q[4]} ),
	.data_in( {muxWire[3], muxWire[2], muxWire[1], muxWire[0]} )
);

// Flip Flop which changes its output value when count has been reached
// This acts like a delayed clock
dff_en flipflop(
	.data_out(clk_div),
	.in_D( Qnot ),
	.in_CLK( CLK ),
	.in_EN( EQ )
);
not outputNot(Qnot, clk_div);

endmodule