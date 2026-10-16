`timescale 1ns/1ps

module tb_pipo;
    reg clk;
    reg rst;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    pipo uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Assert reset
        d = 4'b0000;
        #10; // Wait for 10ns

        // Deassert reset
        rst = 0;
        #10;

        // Test loading data
        d = 4'b1010; // Load 10
        #10;
        if (q !== 4'b1010) $display("FAIL: Expected q = 4'b1010, got q = %b", q);

        d = 4'b1100; // Load 12
        #10;
        if (q !== 4'b1100) $display("FAIL: Expected q = 4'b1100, got q = %b", q);

        // Assert reset
        rst = 1;
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 4'b0000 after reset, got q = %b", q);

        // Deassert reset and load new data
        rst = 0;
        d = 4'b0011; // Load 3
        #10;
        if (q !== 4'b0011) $display("FAIL: Expected q = 4'b0011, got q = %b", q);

        // Final check
        rst = 1; // Assert reset again
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 4'b0000 after reset, got q = %b", q);

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule