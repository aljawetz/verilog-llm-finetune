`timescale 1ns/1ps

module tb_FSM_Moore_detector;

    // Inputs
    reg clk;
    reg rst;
    reg in_bit;

    // Outputs
    wire detected;

    // Instantiate the Unit Under Test (UUT)
    FSM_Moore_detector uut (
        .clk(clk), 
        .rst(rst), 
        .in_bit(in_bit), 
        .detected(detected)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        in_bit = 0;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        rst = 0;
        #10;

        // Test sequence: 1101
        // Expected output: detected should go high after this sequence
        in_bit = 1; #10; // State S1
        in_bit = 1; #10; // State S11
        in_bit = 0; #10; // State S110
        in_bit = 1; #10; // State DETECTED
        if (detected !== 1'b1) begin
            $display("FAIL: Sequence 1101 not detected");
            $finish;
        end

        // Test sequence: 1101 again
        in_bit = 1; #10; // State S1
        in_bit = 1; #10; // State S11
        in_bit = 0; #10; // State S110
        in_bit = 1; #10; // State DETECTED
        if (detected !== 1'b1) begin
            $display("FAIL: Sequence 1101 not detected");
            $finish;
        end

        // Test sequence: 1100 (should not detect)
        in_bit = 1; #10; // State S1
        in_bit = 1; #10; // State S11
        in_bit = 0; #10; // State S110
        in_bit = 0; #10; // Should return to IDLE
        if (detected !== 1'b0) begin
            $display("FAIL: Detected should be low for sequence 1100");
            $finish;
        end

        // Test sequence: 1011 (should not detect)
        in_bit = 1; #10; // State S1
        in_bit = 0; #10; // Should return to IDLE
        in_bit = 1; #10; // State S1 again
        in_bit = 1; #10; // State S11
        if (detected !== 1'b0) begin
            $display("FAIL: Detected should be low for sequence 1011");
            $finish;
        end

        // Test sequence: 11101 (should detect)
        in_bit = 1; #10; // State S1
        in_bit = 1; #10; // State S11
        in_bit = 0; #10; // State S110
        in_bit = 1; #10; // State DETECTED
        if (detected !== 1'b1) begin
            $display("FAIL: Sequence 1101 not detected in 11101");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule