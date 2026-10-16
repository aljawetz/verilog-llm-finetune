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
        // Initialize inputs
        rst = 0;
        in = 0;

        // Test 1: Check asynchronous reset
        rst = 1; #10; // Assert reset
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end

        // Test 2: Check outputs after reset is deasserted
        rst = 0; in = 1; #10; // Deassert reset and set input
        if (out_async !== 1'b1 || out_sync !== 1'b1) begin
            $display("FAIL: Outputs did not reflect input after reset");
            $finish;
        end

        // Test 3: Check synchronous reset
        rst = 1; #10; // Assert reset
        if (out_sync !== 1'b0) begin
            $display("FAIL: Synchronous reset did not clear out_sync");
            $finish;
        end

        // Test 4: Check outputs after synchronous reset is deasserted
        rst = 0; in = 0; #10; // Deassert reset and set input to 0
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs did not reflect input after synchronous reset");
            $finish;
        end

        // Test 5: Check with different input values
        in = 1; #10; // Set input to 1
        if (out_async !== 1'b1 || out_sync !== 1'b1) begin
            $display("FAIL: Outputs did not reflect input when set to 1");
            $finish;
        end

        // Test 6: Check reset while clocking
        in = 0; #10; // Set input to 0
        rst = 1; #10; // Assert reset
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Reset during clocking did not clear outputs");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule