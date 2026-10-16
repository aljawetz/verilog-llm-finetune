`timescale 1ns/1ps

module tb_leftshiftreg;

    reg clk;
    reg rst;
    reg a;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    leftshiftreg uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        a = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Shift in 1s
        a = 1; #10; // Shift in 1
        if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

        a = 1; #10; // Shift in 1
        if (out !== 4'b0011) $display("FAIL: Expected out = 0011, got out = %b", out);

        a = 0; #10; // Shift in 0
        if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);

        a = 1; #10; // Shift in 1
        if (out !== 4'b1101) $display("FAIL: Expected out = 1101, got out = %b", out);

        // Test case 2: Reset functionality
        rst = 1; #10; // Assert reset
        if (out !== 4'b0000) $display("FAIL: Expected out = 0000 after reset, got out = %b", out);

        rst = 0; // Release reset
        a = 0; #10; // Shift in 0
        if (out !== 4'b0000) $display("FAIL: Expected out = 0000, got out = %b", out);

        // Test case 3: Shift in alternating bits
        a = 1; #10; // Shift in 1
        a = 0; #10; // Shift in 0
        a = 1; #10; // Shift in 1
        if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule