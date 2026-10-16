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
        rst_n = 0; // Assert reset
        j = 0;
        k = 0;
        #10; // Wait for 10ns

        // Release reset
        rst_n = 1;
        #10;

        // Test case 1: Hold state (J=0, K=0)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: Reset state (J=0, K=1)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

        // Test case 3: Set state (J=1, K=0)
        j = 1; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

        // Test case 4: Toggle state (J=1, K=1)
        j = 1; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
        #10;
        if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

        // Test case 5: Reset state again (J=0, K=1)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0, got q=%b", q);

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule