`timescale 1ns/1ps

module tb_async_rst;

    reg in;
    reg clk;
    reg rst;
    wire out;

    // Instantiate the module under test (uut)
    async_rst uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in = 1'b0;
        rst = 1'b1;

        // Test 1: Check reset functionality
        #10; // Wait for some time
        rst = 1'b0; // Assert reset
        #10; // Wait for reset to take effect
        if (out !== 1'b0) begin
            $display("FAIL: Reset did not set output to 0");
            $finish;
        end

        // Test 2: Check normal operation after reset
        rst = 1'b1; // Deassert reset
        #10; // Wait for some time
        in = 1'b1; // Set input
        #10; // Wait for clock edge
        if (out !== 1'b1) begin
            $display("FAIL: Output did not match input after reset");
            $finish;
        end

        // Test 3: Check input change on clock edge
        in = 1'b0; // Change input
        #10; // Wait for clock edge
        if (out !== 1'b0) begin
            $display("FAIL: Output did not match input after clock edge");
            $finish;
        end

        // Test 4: Check reset functionality again
        rst = 1'b0; // Assert reset
        #10; // Wait for reset to take effect
        if (out !== 1'b0) begin
            $display("FAIL: Reset did not set output to 0 again");
            $finish;
        end

        // Test 5: Check behavior with multiple clock cycles
        rst = 1'b1; // Deassert reset
        #10; // Wait for some time
        in = 1'b1; // Set input
        #10; // Wait for clock edge
        if (out !== 1'b1) begin
            $display("FAIL: Output did not match input after multiple clock cycles");
            $finish;
        end

        // Final check
        in = 1'b0; // Change input
        #10; // Wait for clock edge
        if (out !== 1'b0) begin
            $display("FAIL: Output did not match input after final clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule