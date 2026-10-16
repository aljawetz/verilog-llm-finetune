`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j, k, clk, reset;
    wire q;

    // Instantiate the jk_flipflop module
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
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
        j = 0; k = 0; reset = 1; // Start with reset active
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: j=0, k=0 (no change)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: j=0, k=1 (reset to 0)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: j=1, k=0 (set to 1)
        j = 1; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: j=0, k=0 (no change)
        j = 0; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 5: j=1, k=1 (toggle)
        j = 1; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        
        // Test case 6: j=1, k=1 (toggle again)
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 7: Asynchronous reset
        reset = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule