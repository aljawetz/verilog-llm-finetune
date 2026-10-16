`timescale 1ns/1ps

module tb_jkff;

    reg clk;
    reg rst_n;
    reg j;
    reg k;
    wire q;

    // Instantiate the module under test (uut)
    jkff uut (
        .clk(clk),
        .rst_n(rst_n),
        .j(j),
        .k(k),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0; // Active low reset
        j = 0;
        k = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset
        #10;

        // Test case 1: J=0, K=0 (hold state)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: J=0, K=1 (reset state)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: J=1, K=0 (set state)
        j = 1; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: J=1, K=1 (toggle state)
        j = 1; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 5: J=0, K=0 (hold state again)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule