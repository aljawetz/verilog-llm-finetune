`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk;
    wire q, qb;

    // Instantiate the jkff module
    jkff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        j = 0; k = 0;
        #10; // Wait for a clock edge

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
        
        // Toggle again
        #10;
        if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

        // Final check for toggle
        j = 1; k = 1;
        #10;
        if (q !== 0) $display("FAIL: Final toggle failed, expected q=0, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule