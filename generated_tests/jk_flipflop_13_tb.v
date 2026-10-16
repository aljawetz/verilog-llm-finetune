`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the jk_flipflop module
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
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
        #10; // Wait for 10ns

        // Release reset
        rst = 0; 
        #10;

        // Test case 1: J=0, K=0 (No change)
        j = 0; k = 0; 
        #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: J=0, K=1 (Reset)
        j = 0; k = 1; 
        #10;
        if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

        // Test case 3: J=1, K=0 (Set)
        j = 1; k = 0; 
        #10;
        if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

        // Test case 4: J=1, K=1 (Toggle)
        j = 1; k = 1; 
        #10;
        if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
        
        #10; // Wait for the next clock edge
        if (q !== 1) $display("FAIL: Test case 4 failed on toggle, expected q=1, got q=%b", q);

        // Test case 5: J=0, K=0 (No change)
        j = 0; k = 0; 
        #10;
        if (q !== 1) $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);

        // Test case 6: J=0, K=1 (Reset)
        j = 0; k = 1; 
        #10;
        if (q !== 0) $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);

        // Test case 7: J=1, K=0 (Set)
        j = 1; k = 0; 
        #10;
        if (q !== 1) $display("FAIL: Test case 7 failed, expected q=1, got q=%b", q);

        // Test case 8: J=1, K=1 (Toggle)
        j = 1; k = 1; 
        #10;
        if (q !== 0) $display("FAIL: Test case 8 failed, expected q=0, got q=%b", q);
        
        #10; // Wait for the next clock edge
        if (q !== 1) $display("FAIL: Test case 8 failed on toggle, expected q=1, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule