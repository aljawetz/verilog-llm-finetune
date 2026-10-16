`timescale 1ns/1ps

module tb_synchronous_asynchronous_reset;

    reg clk;
    reg rst;
    reg in;
    wire out_async;
    wire out_sync;

    // Instantiate the module under test (uut)
    synchronous_asynchronous_reset uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out_async(out_async),
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
        rst = 1;
        in = 0;
        #10; // Wait for 10ns

        // Test asynchronous reset
        rst = 0; // Release reset
        in = 1;  // Set input to 1
        #10;     // Wait for 10ns
        if (out_async !== 1'b1 || out_sync !== 1'b1) begin
            $display("FAIL: Outputs should be 1 after releasing reset and setting input to 1");
            $finish;
        end

        // Test synchronous reset
        rst = 1; // Assert reset
        #10;     // Wait for 10ns
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after synchronous reset");
            $finish;
        end

        // Test with input 0
        rst = 0; // Release reset
        in = 0;  // Set input to 0
        #10;     // Wait for 10ns
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after setting input to 0");
            $finish;
        end

        // Test with input 1 again
        in = 1;  // Set input to 1
        #10;     // Wait for 10ns
        if (out_async !== 1'b1 || out_sync !== 1'b1) begin
            $display("FAIL: Outputs should be 1 after setting input to 1");
            $finish;
        end

        // Final reset test
        rst = 1; // Assert reset
        #10;     // Wait for 10ns
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after final synchronous reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule