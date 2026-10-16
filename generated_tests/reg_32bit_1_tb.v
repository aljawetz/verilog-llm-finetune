`timescale 1ns/1ps

module tb_reg_32bit;

    reg clk;
    reg rst;
    reg [31:0] in0;
    wire [31:0] out0;

    // Instantiate the module under test (uut)
    reg_32bit uut (
        .clk(clk),
        .rst(rst),
        .in0(in0),
        .out0(out0)
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
        in0 = 32'h0000_0000;

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;

        // Test 1: Load value into register
        in0 = 32'hA5A5_A5A5; // Load a test value
        #10; // Wait for a clock edge
        if (out0 !== 32'hA5A5_A5A5) begin
            $display("FAIL: Test 1 - Expected out0 = 0xA5A5_A5A5, got out0 = 0x%h", out0);
            $finish;
        end

        // Test 2: Reset the register
        rst = 1;
        #10; // Wait for a clock edge
        if (out0 !== 32'h0000_0000) begin
            $display("FAIL: Test 2 - Expected out0 = 0x0000_0000, got out0 = 0x%h", out0);
            $finish;
        end

        // Test 3: Load another value after reset
        rst = 0;
        in0 = 32'hDEAD_BEEF; // Load another test value
        #10; // Wait for a clock edge
        if (out0 !== 32'hDEAD_BEEF) begin
            $display("FAIL: Test 3 - Expected out0 = 0xDEAD_BEEF, got out0 = 0x%h", out0);
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1;
        #10; // Wait for a clock edge
        if (out0 !== 32'h0000_0000) begin
            $display("FAIL: Test 4 - Expected out0 = 0x0000_0000, got out0 = 0x%h", out0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule