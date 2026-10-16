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
        // Initialize signals
        reset = 1;
        in_data = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test sequence: Input 10110
        // Expected output: sq_detected should be high after the sequence
        in_data = 0; #10; // State: GOTNOTHING
        in_data = 1; #10; // State: G1
        in_data = 0; #10; // State: G10
        in_data = 1; #10; // State: G101
        in_data = 1; #10; // State: G1011
        in_data = 0; #10; // State: GOTNOTHING, sq_detected should be 1

        if (sq_detected !== 1) begin
            $display("FAIL: sq_detected should be 1 after input 10110");
            $finish;
        end

        // Reset the module
        reset = 1; #10;
        reset = 0;

        // Test sequence: Input 10110 with noise
        in_data = 0; #10; // State: GOTNOTHING
        in_data = 1; #10; // State: G1
        in_data = 0; #10; // State: G10
        in_data = 1; #10; // State: G101
        in_data = 0; #10; // State: G10 (reset, should not detect)
        in_data = 1; #10; // State: G101
        in_data = 1; #10; // State: G1011
        in_data = 0; #10; // State: GOTNOTHING, sq_detected should be 1

        if (sq_detected !== 1) begin
            $display("FAIL: sq_detected should be 1 after input 10110 with noise");
            $finish;
        end

        // Test sequence: Input 11100 (should not detect)
        reset = 1; #10;
        reset = 0;
        in_data = 1; #10; // State: G1
        in_data = 1; #10; // State: G1
        in_data = 1; #10; // State: G1
        in_data = 0; #10; // State: G10
        in_data = 0; #10; // State: GOTNOTHING, sq_detected should be 0

        if (sq_detected !== 0) begin
            $display("FAIL: sq_detected should be 0 after input 11100");
            $finish;
        end

        // Final reset and check
        reset = 1; #10;
        reset = 0;

        // Check for no detection after reset
        if (sq_detected !== 0) begin
            $display("FAIL: sq_detected should be 0 after reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule