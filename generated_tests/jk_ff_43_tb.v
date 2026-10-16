`timescale 1ns/1ps

module tb_jk_ff;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the jk_ff module
    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
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
        j = 0; k = 0; rst = 1;
        
        // Apply reset
        rst = 0; #10; // Assert reset for 10ns
        rst = 1; #10; // Release reset

        // Test case 1: J=0, K=0 (no change)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: J=0, K=1 (reset)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: J=1, K=0 (set)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: J=1, K=1 (toggle)
        j = 1; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q); // toggled from 1 to 0

        // Test case 5: J=0, K=0 (no change)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 6: J=1, K=0 (set)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 7: J=0, K=1 (reset)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 8: Asynchronous reset
        rst = 0; #10; // Assert reset
        if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);
        rst = 1; #10; // Release reset

        // Final check
        j = 1; k = 1; #10; // Toggle
        if (q !== 0) $display("FAIL: Expected q=0 after toggle, got q=%b", q);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule