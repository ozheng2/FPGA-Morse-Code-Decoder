`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 05:52:47 PM
// Design Name: 
// Module Name: Counter4
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

module Counter4(
    input CLK,
    input enable,
    output [1:0] Q
    );
wire [1:0] d;

not notQC(notQ0, Q[0]);

// For d{1]
// y = AC + AB
and andD10(d10, enable, Q[0]);
and andD11(d11, enable, Q[1]);
or orD1(d[1], d10, d11);

// For d[0]
// y = AC' + AB
and andD00(d00, enable, notQ0);
and andD01(d01, enable, Q[1]);
or orD0(d[0], d00, d01);

dff_en dff1 (
	.data_out(Q[1]),
	.in_D( d[1] ),
	.in_CLK( CLK ),
	.in_EN( 1'b1 )
);
dff_en dff0 (
	.data_out(Q[0]),
	.in_D( d[0] ),
	.in_CLK( CLK ),
	.in_EN( 1'b1 )
);
    
endmodule