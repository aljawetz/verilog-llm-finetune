`timescale 1ns/1ps

module tb_Melay_machine_sequence_detector;

    reg data;
    reg clk;
    reg rst;
    wire op;

    // Instantiate the unit under test (UUT)
    Melay_machine_sequence_detector uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 0;
        data = 0;

        // Apply reset
        #10;
        rst = 1; // Release reset
        #10;

        // Test sequence: 1-0-0-1
        // Expected output: op should be high after the sequence is detected

        // Step 1: Input 1
        data = 1; #10; // Move to state s1
        if (op !== 1'b0) $display("FAIL: op should be 0 in state s1");

        // Step 2: Input 0
        data = 0; #10; // Move to state s2
        if (op !== 1'b0) $display("FAIL: op should be 0 in state s2");

        // Step 3: Input 0
        data = 0; #10; // Move to state s3
        if (op !== 1'b0) $display("FAIL: op should be 0 in state s3");

        // Step 4: Input 1
        data = 1; #10; // Move to state s1 and set op high
        if (op !== 1'b1) $display("FAIL: op should be 1 after detecting sequence 1-0-0-1");

        // Reset and check
        rst = 0; #10; // Assert reset
        rst = 1; #10; // Release reset

        // Check initial state after reset
        if (op !== 1'b0) $display("FAIL: op should be 0 after reset");

        // Test another sequence: 1-0-0-1
        data = 1; #10; // Move to state s1
        data = 0; #10; // Move to state s2
        data = 0; #10; // Move to state s3
        data = 1; #10; // Move to state s1 and set op high
        if (op !== 1'b1) $display("FAIL: op should be 1 after detecting sequence 1-0-0-1 again");

        // Final check
        $display("PASS");
        $finish;
    end

endmodule