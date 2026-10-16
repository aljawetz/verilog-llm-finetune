`timescale 1ns/1ps

module tb_moore_1011_fsmd;

    reg d_in;
    reg clk;
    reg rst;
    reg [15:0] bit_in;
    wire y_out;
    wire [15:0] bit_out;

    // Instantiate the module under test (uut)
    moore_1011_fsmd uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .y_out(y_out),
        .bit_in(bit_in),
        .bit_out(bit_out)
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
        d_in = 0;
        bit_in = 16'hABCD; // Example input

        // Apply reset
        #10;
        rst = 0; // Assert reset
        #10;
        rst = 1; // Deassert reset

        // Test sequence for 1011 detection
        // Input: 0
        d_in = 0; #10;
        if (y_out !== 0) $display("FAIL: y_out should be 0 after input 0");

        // Input: 1
        d_in = 1; #10;
        if (y_out !== 0) $display("FAIL: y_out should be 0 after input 1");

        // Input: 0
        d_in = 0; #10;
        if (y_out !== 0) $display("FAIL: y_out should be 0 after input 0");

        // Input: 1
        d_in = 1; #10;
        if (y_out !== 0) $display("FAIL: y_out should be 0 after input 1");

        // Input: 1
        d_in = 1; #10;
        if (y_out !== 0) $display("FAIL: y_out should be 0 after input 1");

        // Input: 0
        d_in = 0; #10;
        if (y_out !== 1) $display("FAIL: y_out should be 1 after input 0 (1011 detected)");

        // Check bit_out
        if (bit_out !== bit_in) $display("FAIL: bit_out should match bit_in after detection");

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule