`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 07:10:35 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input [13:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
    SegmentDisplay (.clk(clk), .num(sw), .seg(seg), .an(an));
    
    
endmodule
