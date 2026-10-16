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
        #10; // Wait for a clock cycle
        rst = 0; // Release reset

        // Test sequence to detect 1101
        // Expected output: detected should be high after the sequence 1101 is processed

        // Input sequence: 1 (S1)
        in_bit = 1; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in IDLE state");

        // Input sequence: 1 (S11)
        in_bit = 1; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in S1 state");

        // Input sequence: 0 (S110)
        in_bit = 0; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in S11 state");

        // Input sequence: 1 (DETECTED)
        in_bit = 1; #10;
        if (detected !== 1'b1) $display("FAIL: Detected should be 1 in S110 state");

        // Input sequence: 0 (IDLE)
        in_bit = 0; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in DETECTED state");

        // Input sequence: 1 (S1)
        in_bit = 1; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in IDLE state");

        // Input sequence: 1 (S11)
        in_bit = 1; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in S1 state");

        // Input sequence: 0 (S110)
        in_bit = 0; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in S11 state");

        // Input sequence: 1 (DETECTED)
        in_bit = 1; #10;
        if (detected !== 1'b1) $display("FAIL: Detected should be 1 in S110 state");

        // Input sequence: 0 (IDLE)
        in_bit = 0; #10;
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 in DETECTED state");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule