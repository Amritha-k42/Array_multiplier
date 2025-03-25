`timescale 1ns / 1ps

module array16_tb;
    
    // Inputs
    reg [15:0] a, b;
    
    // Outputs
    wire [31:0] c;
    
    // Instantiate the Unit Under Test (UUT)
    array16 uut (
        .a(a),
        .b(b),
        .c(c)
    );
    
    initial begin
        // Monitor values
        $monitor("Time=%0t | a=%h, b=%h, c=%h", $time, a, b, c);
        
        // Test Cases
        a = 16'h0000; b = 16'h0000; #10; // 0 * 0
        a = 16'h0001; b = 16'h0001; #10; // 1 * 1
        a = 16'h000F; b = 16'h000F; #10; // 15 * 15
        a = 16'h00FF; b = 16'h000F; #10; // 255 * 15
        a = 16'h0FFF; b = 16'h00FF; #10; // 4095 * 255
        a = 16'hFFFF; b = 16'hFFFF; #10; // Max value * Max value
        
        // End simulation
        $stop;
    end
    
endmodule