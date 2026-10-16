`timescale 1ns/1ps

module tb_bad_shift_reg2;
    reg clk;
    reg reset;
    reg d;
    wire dout;

    // Instantiate the module under test (uut)
    bad_shift_reg2 uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .dout(dout)
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
        d = 0;
        #10; // Wait for 10ns
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: Shift in a value
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset and first clock cycle");
            $finish;
        end

        // Test case 2: Shift in another value
        #10; // Wait for another clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after shifting in 1");
            $finish;
        end

        // Test case 3: Shift in 0
        d = 0; // Set d to 0
        #10; // Wait for one clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should still be 1 after shifting in 0");
            $finish;
        end

        // Test case 4: Shift in another 0
        #10; // Wait for another clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after shifting in 0 again");
            $finish;
        end

        // Test case 5: Reset the shift register
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        reset = 0; // Release reset
        #10; // Wait for another clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end
endmodule