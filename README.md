# VerilogBasys3Basics
 
![](./Segments.png)


```verilog
module NumberToSegment(
    input [3:0] num,
    output [6:0] seg
    );

    assign seg = (num == 0) ? 7'b1000000 :
                 (num == 1) ? 7'b1111001 :
                 (num == 2) ? 7'b0100100 :
                 (num == 3) ? 7'b0110000 :
                 (num == 4) ? 7'b0011001 :
                 (num == 5) ? 7'b0010010 :
                 (num == 6) ? 7'b0000011 :
                 (num == 7) ? 7'b1111000 :
                 (num == 8) ? 7'b0000000 :
                 (num == 9) ? 7'b0010000 :
                 7'b1111111;

endmodule
```