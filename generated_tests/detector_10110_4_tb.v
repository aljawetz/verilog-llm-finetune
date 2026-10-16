`timescale 1ns/1ps

module tb_detector_10110;

    reg clk;
    reg reset;
    reg in_data;
    wire sq_detected;
    
    // Instantiate the module under test (uut)
    detector_10110 uut (
        .clk(clk),
        .reset(reset),
        .in_data(in_data),
        .sq_detected(sq_detected)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in_data = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test case 1: Sequence 10110
        in_data = 1; #10; // G1
        in_data = 0; #10; // G10
        in_data = 1; #10; // G101
        in_data = 1; #10; // G1011
        in_data = 0; #10; // sq_detected should be 1
        if (uut.sq_detected !== 1) begin
            $display("FAIL: Expected sq_detected to be 1 after sequence 10110");
            $finish;
        end

        // Test case 2: Sequence 10110 followed by noise
        in_data = 1; #10; // G1
        in_data = 0; #10; // G10
        in_data = 1; #10; // G101
        in_data = 1; #10; // G1011
        in_data = 0; #10; // sq_detected should be 1
        if (uut.sq_detected !== 1) begin
            $display("FAIL: Expected sq_detected to be 1 after sequence 10110");
            $finish;
        end
        in_data = 1; #10; // G1
        in_data = 0; #10; // G10
        in_data = 1; #10; // G101
        in_data = 0; #10; // G10
        if (uut.sq_detected !== 0) begin
            $display("FAIL: Expected sq_detected to be 0 after noise");
            $finish;
        end

        // Test case 3: Reset functionality
        reset = 1; #10; // Assert reset
        reset = 0; #10; // Release reset
        if (uut.sq_detected !== 0) begin
            $display("FAIL: Expected sq_detected to be 0 after reset");
            $finish;
        end

        // Test case 4: No sequence
        in_data = 0; #10; // Stay in GOTNOTHING
        if (uut.sq_detected !== 0) begin
            $display("FAIL: Expected sq_detected to be 0 with no input");
            $finish;
        end

        // Test case 5: Another sequence 10110
        in_data = 1; #10; // G1
        in_data = 0; #10; // G10
        in_data = 1; #10; // G101
        in_data = 1; #10; // G1011
        in_data = 0; #10; // sq_detected should be 1
        if (uut.sq_detected !== 1) begin
            $display("FAIL: Expected sq_detected to be 1 after sequence 10110");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule