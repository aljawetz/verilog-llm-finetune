`timescale 1ns/1ps

module tb_jkff;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the jkff module
    jkff uut (
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
        // Initialize
        rst = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Hold state (j=0, k=0)
        #10;
        if (q !== 0) $display("FAIL: Expected q=0 after reset, got q=%b", q);

        // Test case 2: Set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Expected q=1 after set, got q=%b", q);

        // Test case 3: Clear state (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0 after clear, got q=%b", q);

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (q !== 1) $display("FAIL: Expected q=1 after first toggle, got q=%b", q);
        
        #10; // Wait for next clock edge
        if (q !== 0) $display("FAIL: Expected q=0 after second toggle, got q=%b", q);

        // Test case 5: Hold state again (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Expected q=0 after hold, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule