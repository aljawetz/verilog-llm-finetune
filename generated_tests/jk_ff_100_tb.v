`timescale 1ns/1ps

module tb_jk_ff;

    reg j;
    reg k;
    reg clk;
    wire q;
    wire q_bar;

    // Instantiate the JK flip-flop
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
        #10; // Wait for one clock cycle

        // Test hold state (j=0, k=0)
        j = 0; k = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test reset state (j=0, k=1)
        j = 0; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test set state (j=1, k=0)
        j = 1; k = 0; #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test toggle state (j=1, k=1)
        j = 1; k = 1; #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test toggle again
        #10;
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10;
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Final check for q_bar
        if (q_bar !== ~q) $display("FAIL: Expected q_bar=%b, got q_bar=%b", ~q, q_bar);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule