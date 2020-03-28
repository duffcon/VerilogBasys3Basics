`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 06:11:27 AM
// Design Name: 
// Module Name: SegmentDisplay
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


module SegmentDisplay(
    input clk,
    input [14:0] num,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire clock_div;
    
    reg [3:0] an_reg;
    reg [3:0] digit;
    reg [1:0] count;
    
    NumberToSegment(.num(digit), .seg(seg));
    CycleCounter #(.N(10**5)) counter_anode (.clk(clk), .q(clock_div));
    
    always @(posedge clock_div) begin
        count = count + 1;
        an_reg = (count == 0) ? 4'b1110 :
                 (count == 1) ? 4'b1101 :
                 (count == 2) ? 4'b1011 :
                                4'b0111;
                                
        digit =  (count == 0) ? num % 10 :
                 (count == 1) ? (num/(10)) % 10 :
                 (count == 2) ? (num/(100)) % 10 :
                                (num/(1000)) % 10;
    end
    
    assign an = an_reg;


endmodule
