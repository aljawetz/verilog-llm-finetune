`timescale 1ns/1ps

module tb_siso;

    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    siso uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; in = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test shifting in bits
        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got out = %b", out);

        in = 0; #10; // Shift in 0
        if (out !== 1) $display("FAIL: Expected out = 1, got out = %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got out = %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 1) $display("FAIL: Expected out = 1, got out = %b", out);

        in = 0; #10; // Shift in 0
        if (out !== 1) $display("FAIL: Expected out = 1, got out = %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got out = %b", out);

        // Reset the module
        rst = 1; #10;
        rst = 0; #10;

        // Check after reset
        if (out !== 0) $display("FAIL: Expected out = 0 after reset, got out = %b", out);

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule