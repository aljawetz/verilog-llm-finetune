`timescale 1ns/1ps

module tb_jkff;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the JK Flip-Flop
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
        #10; // Wait for a clock edge
        rst = 0; // Release reset

        // Test case 1: Hold state (00)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: Clear state (01)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

        // Test case 3: Set state (10)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);

        // Test case 4: Toggle state (11)
        j = 1; k = 1; #10;
        if (q !== 0) $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
        #10;
        if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

        // Test case 5: Reset state
        rst = 1; #10;
        if (q !== 0) $display("FAIL: Test case 5 failed, expected q=0, got q=%b", q);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule