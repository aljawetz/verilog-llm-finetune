`timescale 1ns/1ps

module tb_sync_rst;

    reg in;
    reg clk;
    reg rst;
    wire out;

    // Instantiate the module under test (uut)
    sync_rst uut (
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
        in = 0;
        rst = 0;

        // Wait for a few clock cycles
        #10;

        // Assert reset
        rst = 0; // Active low reset
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 during reset");
            $finish;
        end

        // Release reset
        rst = 1;
        #10;

        // Test with input 1
        in = 1;
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Output should be 1 when input is 1");
            $finish;
        end

        // Test with input 0
        in = 0;
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 when input is 0");
            $finish;
        end

        // Test reset again
        rst = 0; // Assert reset
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 during reset");
            $finish;
        end

        // Release reset and test again
        rst = 1;
        #10;

        // Test with input 1 again
        in = 1;
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Output should be 1 when input is 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule