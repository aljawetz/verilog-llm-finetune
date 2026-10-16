`timescale 1ns/1ps

module tb_jjkflipflop;
    reg clk;
    reg rst;
    reg [1:0] jk;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    jjkflipflop uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .jk(jk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1; jk = 2'b00; #10; // Reset the flip-flop
        rst = 0; #10;

        // Test J=0, K=0 (no change)
        jk = 2'b00; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test J=0, K=1 (reset)
        jk = 2'b01; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test J=1, K=0 (set)
        jk = 2'b10; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test J=1, K=1 (toggle)
        jk = 2'b11; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        jk = 2'b11; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test reset
        rst = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);
        rst = 0; #10;

        // Final check
        jk = 2'b00; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule