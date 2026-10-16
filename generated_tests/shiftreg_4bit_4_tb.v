`timescale 1ns/1ps

module tb_shiftreg_4bit;

    reg a;
    reg clk;
    reg clr;
    wire e;

    // Instantiate the module under test (uut)
    shiftreg_4bit uut (
        .a(a),
        .e(e),
        .clk(clk),
        .clr(clr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        a = 0;
        clr = 1;

        // Test 1: Clear the shift register
        clr = 0; // Active-low clear
        #10;
        if (e !== 0) $display("FAIL: Clear did not reset output to 0");
        
        clr = 1; // Deactivate clear
        #10;

        // Test 2: Shift in a single bit
        a = 1; // Input 1
        #10;
        if (e !== 0) $display("FAIL: Output should still be 0 after first shift");

        // Shift in another bit
        a = 0; // Input 0
        #10;
        if (e !== 1) $display("FAIL: Output should be 1 after second shift");

        // Shift in another bit
        a = 1; // Input 1
        #10;
        if (e !== 0) $display("FAIL: Output should be 0 after third shift");

        // Shift in another bit
        a = 0; // Input 0
        #10;
        if (e !== 1) $display("FAIL: Output should be 1 after fourth shift");

        // Test 3: Clear again
        clr = 0; // Active-low clear
        #10;
        if (e !== 0) $display("FAIL: Clear did not reset output to 0");

        // Test 4: Shift in multiple bits
        clr = 1; // Deactivate clear
        a = 1; #10; // Shift in 1
        a = 1; #10; // Shift in 1
        a = 0; #10; // Shift in 0
        a = 1; #10; // Shift in 1
        if (e !== 0) $display("FAIL: Output should be 1 after shifting in 1s and 0s");

        // Final check
        clr = 0; // Active-low clear
        #10;
        if (e !== 0) $display("FAIL: Clear did not reset output to 0");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule