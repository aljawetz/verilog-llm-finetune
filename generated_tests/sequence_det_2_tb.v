`timescale 1ns/1ps

module tb_sequence_det;

    reg inp;
    reg clk;
    reg reset;
    wire det;

    // Instantiate the module under test (uut)
    sequence_det uut (
        .det(det),
        .inp(inp),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        inp = 0;
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test sequence: 001
        // Expected det = 0
        #10 inp = 0; // State S0
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S0");

        // Transition to S1
        #10 inp = 0; // State S1
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S1");

        // Transition to S2
        #10 inp = 1; // State S2
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S2");

        // Complete the sequence 001
        #10 inp = 0; // State S2
        #10; 
        if (det !== 1) $display("FAIL: det should be 1 after detecting 001");

        // Reset the detector
        #10 reset = 1; // Assert reset
        #10 reset = 0; // Release reset

        // Test sequence: 000
        #10 inp = 0; // State S0
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S0");

        // Transition to S1
        #10 inp = 0; // State S1
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S1");

        // Transition to S2
        #10 inp = 0; // State S2
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 in state S2");

        // Complete the sequence 001
        #10 inp = 1; // State S2
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 after not detecting 001");

        // Final check
        #10 inp = 0; // State S2
        #10; 
        if (det !== 0) $display("FAIL: det should be 0 after not detecting 001");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule