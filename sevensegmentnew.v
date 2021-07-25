`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:20 10/24/2019 
// Design Name: 
// Module Name:    sevensegmentnew 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sevensegmentnew(output [6:0]f,output [3:0]sw, input sel0,sel1,WE,x0,x1,x2,x3);
	wire w0,w1,w2,w3;
	assign w0 = WE & ~sel0 & ~sel1;
	assign w1 = WE &  ~sel0 & sel1;
	assign w2 = WE &  sel0 & ~sel1;
	assign w3 = WE &   sel0 & sel1;
	
	wire [3:0]ss0,ss1,ss2,ss3;
	assign ss0[0] = w0 ? x0 : ss0[0];
	assign ss0[1] = w0 ? x1 : ss0[1];
	assign ss0[2] = w0 ? x2 : ss0[2];
	assign ss0[3] = w0 ? x3 : ss0[3];
	
	assign ss1[0] = w1 ? x0 : ss1[0];
	assign ss1[1] = w1 ? x1 : ss1[1];
	assign ss1[2] = w1 ? x2 : ss1[2];
	assign ss1[3] = w1 ? x3 : ss1[3];
	
	assign ss2[0] = w2 ? x0 : ss2[0];
	assign ss2[1] = w2 ? x1 : ss2[1];
	assign ss2[2] = w2 ? x2 : ss2[2];
	assign ss2[3] = w2 ? x3 : ss2[3];
	
	assign ss3[0] = w3 ? x0 : ss3[0];
	assign ss3[1] = w3 ? x1 : ss3[1];
	assign ss3[2] = w3 ? x2 : ss3[2];
	assign ss3[3] = w3 ? x3 : ss3[3];
	
	assign sw[0] = sel0 | sel1;
	assign sw[1] = sel0 | ~sel1;
	assign sw[2] = ~sel0 | sel1;
	assign sw[3] = ~sel0 | ~sel1;
	
	wire d0,d1,d2,d3;
	assign d0 = ss0[0] & ~sel0 & ~sel1 | ss1[0] & ~sel0 & sel1 | ss2[0] & sel0 & ~sel1 | ss3[0] & sel0 & sel1;
	assign d1 = ss0[1] & ~sel0 & ~sel1 | ss1[1] & ~sel0 & sel1 | ss2[1] & sel0 & ~sel1 | ss3[1] & sel0 & sel1;
	assign d2 = ss0[2] & ~sel0 & ~sel1 | ss1[2] & ~sel0 & sel1 | ss2[2] & sel0 & ~sel1 | ss3[2] & sel0 & sel1;
	assign d3 = ss0[3] & ~sel0 & ~sel1 | ss1[3] & ~sel0 & sel1 | ss2[3] & sel0 & ~sel1 | ss3[3] & sel0 & sel1;
	
	assign f[0] = ~d0&~d1&~d2&d3 | d1&~d2&~d3;
	assign f[1] = d1&~d2&d3 | d1&d2&~d3;
	assign f[2] = ~d0&~d1&d2&~d3;
	assign f[3] = d1&~d2&~d3 | d1&d2&d3 | ~d0&~d1&~d2&d3;
	assign f[4] = d3 | d1&~d2;
	assign f[5] = d2&d3 | ~d0&~d1&d3 | ~d0&~d1&d2;
	assign f[6] = ~d0&~d1&~d2 | d1&d2&d3;
endmodule
