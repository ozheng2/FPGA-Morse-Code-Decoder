`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 01:28:00 PM
// Design Name: 
// Module Name: SevenSeg
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


module SevenSeg(
    input [5:0] Q,
    output [6:0] seg
    );
wire ca[3:0];
wire cb[3:0];
wire cc[3:0];
wire cd[3:0];
wire ce[3:0];
wire cf[3:0];
wire cg[3:0];

// CA Segment
mux #(16,1) CA1 (
	.data_out(ca1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'b1,1'b1,1'bx,1'b1,1'b1,1'b1,1'bx,1'bx,1'bx,1'b1} )
);
mux #(16,1) CA2 (
	.data_out(ca2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'b1,1'bx,1'b1} )
);
mux #(4,1) CA3 (
	.data_out(ca3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1} )
);
mux #(4,1) CA (
	.data_out(ca0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,ca3,ca2,ca1} )
);
not notCA(seg[0], ca0);

// CB Segment
mux #(16,1) CB1 (
	.data_out(cb1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'b1,1'bx,1'bx,1'b1} )
);

mux #(16,1) CB2 (
	.data_out(cb2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'bx,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'bx,1'bx,1'bx,1'b1} )
);

mux #(4,1) CB3 (
	.data_out(cb3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'bx} )
);

mux #(4,1) CB (
	.data_out(cb0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,cb3,cb2,cb1} )
);
not notCB(seg[1], cb0);

//CC Segment    
mux #(16,1) CC1 (
	.data_out(cc1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'bx,1'b1,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'bx,1'b1,1'b0,1'b1,1'b1} )
);

mux #(16,1) CC2 (
	.data_out(cc2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'bx,1'b1} )
);

mux #(4,1) CC3 (
	.data_out(cc3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1} )
);

mux #(4,1) CC (
	.data_out(cc0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,cc3,cc2,cc1} )
);
not notCC(seg[2], cc0);

// CD Segment
mux #(16,1) CD1 (
	.data_out(cd1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'bx,1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'b1,1'b1,1'b1,1'b1} )
);

mux #(16,1) CD2 (
	.data_out(cd2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'b1,1'b1,1'bx,1'b1,1'b1,1'b1,1'b1,1'b1,1'bx,1'bx} )
);

mux #(4,1) CD3 (
	.data_out(cd3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'bx,1'b1} )
);

mux #(4,1) CD (
	.data_out(cd0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,cd3,cd2,cd1} )
);
not notCD(seg[3], cd0);

// CE Segment
mux #(16,1) CE1 (
	.data_out(ce1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1} )
);

mux #(16,1) CE2 (
	.data_out(ce2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'bx,1'bx,1'bx,1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'bx,1'bx,1'b1,1'b1,1'bx,1'b1,1'bx} )
);

mux #(4,1) CE3 (
	.data_out(ce3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'bx,1'b1,1'bx,1'b1} )
);

mux #(4,1) CE (
	.data_out(ce0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,ce3,ce2,ce1} )
);
not notCE(seg[4], ce0);

// CF Segment
mux #(16,1) CF1 (
	.data_out(cf1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'bx,1'bx,1'bx,1'b1,1'b1,1'bx,1'bx,1'b1,1'b1,1'b1,1'b1,1'bx,1'bx,1'b1,1'bx} )
);

mux #(16,1) CF2 (
	.data_out(cf2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'bx,1'bx,1'bx,1'b1,1'bx,1'b1,1'bx,1'b1,1'b1,1'bx,1'b1,1'b1,1'bx,1'b1} )
);

mux #(4,1) CF3 (
	.data_out(cf3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'bx,1'b1} )
);

mux #(4,1) CF (
	.data_out(cf0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,cf3,cf2,cf1} )
);
not notCF(seg[5], cf0);

// CG Segment
mux #(16,1) CG1 (
	.data_out(cg1),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'bx,1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1} )
);

mux #(16,1) CG2 (
	.data_out(cg2),
	.select_in( {Q[3],Q[2],Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'bx,1'bx,1'bx,1'b1,1'bx,1'b1,1'bx,1'bx,1'b1,1'bx,1'b1,1'b1} )
);

mux #(4,1) CG3 (
	.data_out(cg3),
	.select_in( {Q[1],Q[0]} ),
	.data_in( {1'b1,1'b1,1'bx,1'b1} )
);

mux #(4,1) CG (
	.data_out(cg0),
	.select_in( {Q[5],Q[4]} ),
	.data_in( {1'bx,cg3,cg2,cg1} )
);
not notCG(seg[6], cg0);

endmodule