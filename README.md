# VerilogBasys3Basics
 
 Top level file accessing I/O Ports
```
module top(
    input clk,
    input [13:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
    SegmentDisplay (.clk(clk), .num(sw), .seg(seg), .an(an));
    
    
endmodule
```

SegmentDisplay

```
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


```

```
```

```
```

```
```

```
```



