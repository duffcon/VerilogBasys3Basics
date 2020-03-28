`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 05:11:37 AM
// Design Name: 
// Module Name: BlinkLed
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


module BlinkLed(
    input clk,
    input [3:0] sw,
    input btnC,
    output [0:0] led
    );
    
    reg [31:0] count = 3*(10**8);
    reg [31:0] counter;
    reg led_reg;
    
    always @(posedge clk, posedge btnC)
    begin
        counter = counter + 1;
        if (btnC) begin
            led_reg = 0;
            counter = 0;
        end
        else if (counter >= (count>>sw)) begin
            counter = 0;
            led_reg = ~led_reg;           
        end
    end
    
    assign led[0] = led_reg;

    
endmodule
