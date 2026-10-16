`timescale 1ns/1ps

module testbench;

    reg clk;
    reg reset;
    reg enable;
    wire signal_out;

    // Instantiate the module under test (uut)
    SynchronousSignal uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .signal_out(signal_out)
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
        enable = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test 1: Check output when enabled
        enable = 1;
        #10;
        if (signal_out !== 1) begin
            $display("FAIL: Expected signal_out to be 1 when enabled");
            $finish;
        end

        // Test 2: Check output when disabled
        enable = 0;
        #10;
        if (signal_out !== 0) begin
            $display("FAIL: Expected signal_out to be 0 when disabled");
            $finish;
        end

        // Test 3: Check output after reset
        reset = 1;
        #10;
        if (signal_out !== 0) begin
            $display("FAIL: Expected signal_out to be 0 after reset");
            $finish;
        end

        // Test 4: Check output when enabled again
        reset = 0;
        enable = 1;
        #10;
        if (signal_out !== 1) begin
            $display("FAIL: Expected signal_out to be 1 when enabled after reset");
            $finish;
        end

        // Test 5: Check output when reset while enabled
        enable = 1;
        reset = 1;
        #10;
        if (signal_out !== 0) begin
            $display("FAIL: Expected signal_out to be 0 after reset while enabled");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule