# Blinking LED


Basys3 has 100MHz clock (10^8 cycles / sec)


Need to wait 10^8 cycles for one second

A register would need log2(10^8) = ~27 bits


```
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
```
 
