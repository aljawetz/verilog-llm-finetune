`timescale 1ns/1ps

module tb_threebit_shiftreg;
    reg clk;
    reg reset_n;
    reg d_in;
    wire q_out;

    // Instantiate the module under test (uut)
    threebit_shiftreg uut (
        .clk(clk),
        .reset_n(reset_n),
        .d_in(d_in),
        .q_out(q_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset_n = 0;
        d_in = 0;

        // Apply reset
        #10;
        reset_n = 1; // Release reset
        #10;

        // Test shifting in 1
        d_in = 1; 
        #10; // Wait for one clock cycle
        if (q_out !== 0) $display("FAIL: q_out should be 0 after first clock cycle with d_in = 1");

        // Test shifting in 1 again
        #10; // Wait for another clock cycle
        if (q_out !== 1) $display("FAIL: q_out should be 1 after second clock cycle with d_in = 1");

        // Test shifting in 0
        d_in = 0; 
        #10; // Wait for one clock cycle
        if (q_out !== 1) $display("FAIL: q_out should be 1 after third clock cycle with d_in = 0");

        // Test shifting in 0 again
        #10; // Wait for another clock cycle
        if (q_out !== 0) $display("FAIL: q_out should be 0 after fourth clock cycle with d_in = 0");

        // Test reset functionality
        reset_n = 0; 
        #10; // Wait for reset to take effect
        if (q_out !== 0) $display("FAIL: q_out should be 0 after reset");

        // Release reset and test shifting in 1
        reset_n = 1; 
        #10;
        d_in = 1; 
        #10; // Wait for one clock cycle
        if (q_out !== 0) $display("FAIL: q_out should be 0 after first clock cycle with d_in = 1 post-reset");

        // Test shifting in 1 again
        #10; // Wait for another clock cycle
        if (q_out !== 1) $display("FAIL: q_out should be 1 after second clock cycle with d_in = 1 post-reset");

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule