`timescale 1ns/1ps

module tb_rightshiftreg;

    reg clk;
    reg rst;
    reg a;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    rightshiftreg uut (
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
        // Initialize signals
        rst = 1;
        a = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Shift with a = 1
        a = 1; // Insert 1 at MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b1000) $display("FAIL: Expected out = 1000, got %b", out);

        // Test case 2: Shift with a = 0
        a = 0; // Insert 0 at MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b0100) $display("FAIL: Expected out = 0100, got %b", out);

        // Test case 3: Shift with a = 1
        a = 1; // Insert 1 at MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b1010) $display("FAIL: Expected out = 1010, got %b", out);

        // Test case 4: Shift with a = 0
        a = 0; // Insert 0 at MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got %b", out);

        // Test case 5: Reset the register
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        rst = 0; // Deassert reset
        if (out !== 4'b0000) $display("FAIL: Expected out = 0000 after reset, got %b", out);

        // Test case 6: Shift with a = 1 after reset
        a = 1; // Insert 1 at MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b1000) $display("FAIL: Expected out = 1000 after reset, got %b", out);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule