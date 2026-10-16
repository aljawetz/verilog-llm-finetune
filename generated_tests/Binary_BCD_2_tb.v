`timescale 1ns/1ps

module tb_Binary_BCD;
    reg clk;
    reg [8:0] bin;
    wire [15:0] bcd;
    wire [3:0] ones, tens, hundreds;

    // Instantiate the module under test (uut)
    Binary_BCD uut (
        .clk(clk),
        .bin(bin),
        .bcd(bcd),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Test case 1: Convert binary 0 (000000000)
        bin = 9'b000000000; 
        #10;
        if (bcd !== 16'b0000000000000000 || ones !== 4'b0000 || tens !== 4'b0000 || hundreds !== 4'b0000) 
            $display("FAIL: Test case 1 failed for input 0");
        
        // Test case 2: Convert binary 5 (000000101)
        bin = 9'b000000101; 
        #10;
        if (bcd !== 16'b0000000000000101 || ones !== 4'b0101 || tens !== 4'b0000 || hundreds !== 4'b0000) 
            $display("FAIL: Test case 2 failed for input 5");
        
        // Test case 3: Convert binary 10 (000001010)
        bin = 9'b000001010; 
        #10;
        if (bcd !== 16'b0000000000001010 || ones !== 4'b1010 || tens !== 4'b0000 || hundreds !== 4'b0000) 
            $display("FAIL: Test case 3 failed for input 10");
        
        // Test case 4: Convert binary 99 (000110001)
        bin = 9'b000110001; 
        #10;
        if (bcd !== 16'b0000000001100001 || ones !== 4'b0001 || tens !== 4'b1000 || hundreds !== 4'b0000) 
            $display("FAIL: Test case 4 failed for input 99");
        
        // Test case 5: Convert binary 255 (111111111)
        bin = 9'b111111111; 
        #10;
        if (bcd !== 16'b0000000011111111 || ones !== 4'b1111 || tens !== 4'b1111 || hundreds !== 4'b0001) 
            $display("FAIL: Test case 5 failed for input 255");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule