`timescale 1ns/1ps

module tb_good_shift_reg;

    reg clk;
    reg reset;
    reg d;
    wire dout;

    // Instantiate the module under test (uut)
    good_shift_reg uut (
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

        // Test case 1: Shift in a '1'
        d = 1;
        #10; // Wait for one clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Test case 2: Shift in a '1' and check dout
        #10; // Wait for one clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after shifting in 1");
            $finish;
        end

        // Test case 3: Shift in a '0'
        d = 0;
        #10; // Wait for one clock cycle
        if (dout !== 1) begin
            $display("FAIL: dout should still be 1 after shifting in 0");
            $finish;
        end

        // Test case 4: Shift in another '1'
        d = 1;
        #10; // Wait for one clock cycle
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after shifting in 1");
            $finish;
        end

        // Test case 5: Reset the shift register
        reset = 1;
        #10; // Wait for reset to take effect
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule