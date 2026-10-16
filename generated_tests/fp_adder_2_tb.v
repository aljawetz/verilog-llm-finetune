`timescale 1ns/1ps

module tb_fp_adder;

    reg clk;
    reg reset;
    reg signed [15:0] a;
    reg signed [15:0] b;
    wire signed [15:0] sum;
    wire overflow;
    wire underflow;

    // Instantiate the Unit Under Test (UUT)
    fp_adder uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .sum(sum),
        .overflow(overflow),
        .underflow(underflow)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        a = 0;
        b = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Normal addition
        a = 16'h0001; // 1
        b = 16'h0002; // 2
        #10;
        if (sum !== 16'h0003 || overflow !== 0 || underflow !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: Overflow
        a = 16'h7FFF; // Max positive value
        b = 16'h0001; // 1
        #10;
        if (sum !== 16'h8000 || overflow !== 1 || underflow !== 0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Underflow
        a = 16'h8000; // Min negative value
        b = 16'hFFFF; // -1
        #10;
        if (sum !== 16'h7FFF || overflow !== 0 || underflow !== 1) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: No overflow or underflow
        a = 16'h0004; // 4
        b = 16'h0003; // 3
        #10;
        if (sum !== 16'h0007 || overflow !== 0 || underflow !== 0) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Reset functionality
        a = 16'h0005; // 5
        b = 16'h0006; // 6
        #10;
        reset = 1; // Assert reset
        #10;
        reset = 0; // Release reset
        #10;
        if (sum !== 0 || overflow !== 0 || underflow !== 0) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule