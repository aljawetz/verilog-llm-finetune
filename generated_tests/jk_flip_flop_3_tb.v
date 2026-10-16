`timescale 1ns/1ps

module tb_jk_flip_flop;

    reg clk;
    reg j;
    reg k;
    wire q;

    // Instantiate the jk_flip_flop module
    jk_flip_flop uut (
        .clk(clk),
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
        j = 0;
        k = 0;
        #10;

        // Test case 1: No change (j=0, k=0)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: Reset (j=0, k=1)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: Set (j=1, k=0)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: Toggle (j=1, k=1)
        j = 1; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10; // Wait for next clock edge
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 5: Toggle again (j=1, k=1)
        #10; // Wait for next clock edge
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10; // Wait for next clock edge
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule