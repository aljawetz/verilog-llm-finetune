`timescale 1ns/1ps

module tb_shift_detector_1101;

    reg clk;
    reg rst;
    reg in_bit;
    wire detected;

    // Instantiate the module under test (uut)
    shift_detector_1101 uut (
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
        // Initialize signals
        rst = 1;
        in_bit = 0;
        #10; // Wait for reset to take effect
        rst = 0;

        // Test sequence to check detection of 1101
        // Shift in bits: 1, 1, 0, 1
        in_bit = 1; #10; // sequence = 1000
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 after first input");
        
        in_bit = 1; #10; // sequence = 1100
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 after second input");
        
        in_bit = 0; #10; // sequence = 0110
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 after third input");
        
        in_bit = 1; #10; // sequence = 1011
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 after fourth input");
        
        // Now input the sequence 1101
        in_bit = 1; #10; // sequence = 1101
        if (detected !== 1'b1) $display("FAIL: Detected should be 1 after inputting 1101");
        
        // Continue shifting to ensure it resets
        in_bit = 0; #10; // sequence = 0110
        if (detected !== 1'b0) $display("FAIL: Detected should be 0 after shifting out 1");
        
        in_bit = 1; #10; // sequence = 1101
        if (detected !== 1'b1) $display("FAIL: Detected should be 1 after inputting 1101 again");

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule