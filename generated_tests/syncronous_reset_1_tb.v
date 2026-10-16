`timescale 1ns/1ps

module tb_syncronous_reset;

    reg clk;
    reg reset;
    reg in;
    wire out_sync;

    // Instantiate the module under test
    syncronous_reset uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out_sync(out_sync)
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
        in = 0;

        // Wait for a clock edge
        #10;
        if (out_sync !== 1'b0) begin
            $display("FAIL: Output should be 0 during reset");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test with input signal
        in = 1;
        #10;
        if (out_sync !== 1'b1) begin
            $display("FAIL: Output should be 1 when input is 1");
            $finish;
        end

        // Change input signal
        in = 0;
        #10;
        if (out_sync !== 1'b0) begin
            $display("FAIL: Output should be 0 when input is 0");
            $finish;
        end

        // Assert reset again
        reset = 1;
        #10;
        if (out_sync !== 1'b0) begin
            $display("FAIL: Output should be 0 during reset");
            $finish;
        end

        // Release reset and test again
        reset = 0;
        #10;
        in = 1;
        #10;
        if (out_sync !== 1'b1) begin
            $display("FAIL: Output should be 1 when input is 1");
            $finish;
        end

        // Finalize the test
        $display("PASS");
        $finish;
    end

endmodule