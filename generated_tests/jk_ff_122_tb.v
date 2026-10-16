`timescale 1ns/1ps

module tb_jk_ff;

    // Inputs
    reg j;
    reg k;
    reg clk;

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        j = 0; k = 0;
        #10; // Wait for 1 clock cycle

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        
        // Toggle again
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Final check for q_bar
        #10;
        if (q_bar !== ~q) $display("FAIL: Expected q_bar=%b, got q_bar=%b", ~q, q_bar);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule