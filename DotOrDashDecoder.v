`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 11:18:37 AM
// Design Name: 
// Module Name: DotOrDashDecoder
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


module DotOrDashDecoder(
    input en,
    input [1:0] code,
    output dot,
    output dash,
    output inactivity
    );
wire [1:0]dashes;
or bothDash(dash, dashes[0], dashes[1]);

// Decides if the input was a dot or dash based on the 2bit code
decoder #(2,1) CodeDecoder (
	.data_out( {dashes[1],dashes[0],dot,inactivity} ),
	.address_in( {code[1],code[0]} ),
	.en_in( en )
);
    
endmodule