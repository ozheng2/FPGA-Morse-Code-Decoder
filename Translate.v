`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 08:37:00 AM
// Design Name: 
// Module Name: Translate
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


module Translate(
    input [2:0] count,
    input [4:0] Reg,
    output [5:0] code
    );
    
wire [5:0] len1_out, len2_out, len3_out, len4_out, len5_out;

// LENGTH 1: E(4), T(19)
mux #(2,1) L1_B5 ( .data_out(len1_out[5]), .select_in(Reg[0]), .data_in( {1'b0, 1'b0} ));
mux #(2,1) L1_B4 ( .data_out(len1_out[4]), .select_in(Reg[0]), .data_in( {1'b1, 1'b0} ));
mux #(2,1) L1_B3 ( .data_out(len1_out[3]), .select_in(Reg[0]), .data_in( {1'b0, 1'b0} ));
mux #(2,1) L1_B2 ( .data_out(len1_out[2]), .select_in(Reg[0]), .data_in( {1'b0, 1'b1} ));
mux #(2,1) L1_B1 ( .data_out(len1_out[1]), .select_in(Reg[0]), .data_in( {1'b1, 1'b0} ));
mux #(2,1) L1_B0 ( .data_out(len1_out[0]), .select_in(Reg[0]), .data_in( {1'b1, 1'b0} ));


// LENGTH 2: I(8), A(0), N(13), M(12)
mux #(4,1) L2_B5 ( .data_out(len2_out[5]), .select_in(Reg[1:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(4,1) L2_B4 ( .data_out(len2_out[4]), .select_in(Reg[1:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(4,1) L2_B3 ( .data_out(len2_out[3]), .select_in(Reg[1:0]), .data_in( {
    1'b1, 1'b1, 1'b0, 1'b1} ));

mux #(4,1) L2_B2 ( .data_out(len2_out[2]), .select_in(Reg[1:0]), .data_in( {
    1'b1, 1'b1, 1'b0, 1'b0} ));

mux #(4,1) L2_B1 ( .data_out(len2_out[1]), .select_in(Reg[1:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(4,1) L2_B0 ( .data_out(len2_out[0]), .select_in(Reg[1:0]), .data_in( {
    1'b0, 1'b1, 1'b0, 1'b0} ));


// LENGTH 3: S(18), U(20), R(17), W(22), D(3), K(10), G(6), O(14)
mux #(8,1) L3_B5 ( .data_out(len3_out[5]), .select_in(Reg[2:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(8,1) L3_B4 ( .data_out(len3_out[4]), .select_in(Reg[2:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1} ));

mux #(8,1) L3_B3 ( .data_out(len3_out[3]), .select_in(Reg[2:0]), .data_in( {
    1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(8,1) L3_B2 ( .data_out(len3_out[2]), .select_in(Reg[2:0]), .data_in( {
    1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0} ));

mux #(8,1) L3_B1 ( .data_out(len3_out[1]), .select_in(Reg[2:0]), .data_in( {
    1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1} ));

mux #(8,1) L3_B0 ( .data_out(len3_out[0]), .select_in(Reg[2:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0} ));


// LENGTH 4: H(7), V(21), F(5), L(11), P(15), J(9), B(1), X(23), C(2), Y(24), Z(25), Q(16)
mux #(16,1) L4_B5 ( .data_out(len4_out[5]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(16,1) L4_B4 ( .data_out(len4_out[4]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0} ));

mux #(16,1) L4_B3 ( .data_out(len4_out[3]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 
    1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(16,1) L4_B2 ( .data_out(len4_out[2]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 
    1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1} ));

mux #(16,1) L4_B1 ( .data_out(len4_out[1]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 
    1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1} ));

mux #(16,1) L4_B0 ( .data_out(len4_out[0]), .select_in(Reg[3:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 
    1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1} ));


// LENGTH 5: 0(26), 9(35), 8(34), 7(33), 6(32), 1(27), 2(28), 3(29), 4(30), 5(31)
mux #(32,1) L5_B5 ( .data_out(len5_out[5]), .select_in(Reg[4:0]), .data_in( {
    1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0} ));

mux #(32,1) L5_B4 ( .data_out(len5_out[4]), .select_in(Reg[4:0]), .data_in( {
    1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1} ));

mux #(32,1) L5_B3 ( .data_out(len5_out[3]), .select_in(Reg[4:0]), .data_in( {
    1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1} ));

mux #(32,1) L5_B2 ( .data_out(len5_out[2]), .select_in(Reg[4:0]), .data_in( {
    1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1} ));

mux #(32,1) L5_B1 ( .data_out(len5_out[1]), .select_in(Reg[4:0]), .data_in( {
    1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1} ));

mux #(32,1) L5_B0 ( .data_out(len5_out[0]), .select_in(Reg[4:0]), .data_in( {
    1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
    1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1} ));
    

// Select based on length
mux #(8,1) Fin_B5 ( .data_out(code[5]), .select_in(count), .data_in( {
    2'b0, len5_out[5], len4_out[5], len3_out[5], 
    len2_out[5], len1_out[5], 1'b0} ));

mux #(8,1) Fin_B4 ( .data_out(code[4]), .select_in(count), .data_in( {
    2'b0, len5_out[4], len4_out[4], len3_out[4], 
    len2_out[4], len1_out[4], 1'b0} ));

mux #(8,1) Fin_B3 ( .data_out(code[3]), .select_in(count), .data_in( {
    2'b0, len5_out[3], len4_out[3], len3_out[3], 
    len2_out[3], len1_out[3], 1'b0} ));

mux #(8,1) Fin_B2 ( .data_out(code[2]), .select_in(count), .data_in( {
    2'b0, len5_out[2], len4_out[2], len3_out[2], 
    len2_out[2], len1_out[2], 1'b0} ));

mux #(8,1) Fin_B1 ( .data_out(code[1]), .select_in(count), .data_in( {
    2'b0, len5_out[1], len4_out[1], len3_out[1], 
    len2_out[1], len1_out[1], 1'b0} ));

mux #(8,1) Fin_B0 ( .data_out(code[0]), .select_in(count), .data_in( {
    2'b0, len5_out[0], len4_out[0], len3_out[0], 
    len2_out[0], len1_out[0], 1'b0} ));

endmodule