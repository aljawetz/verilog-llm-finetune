`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j;
    reg k;
    reg clk;
    wire q;
    wire qn_bar;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qn_bar(qn_bar)
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
        j = 0; k = 0;
        #10; // Wait for 1 clock cycle
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 2: Reset (j=0, k=1)
        j = 0; k = 1;
        #10; // Wait for 1 clock cycle
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);

        // Test case 3: Set (j=1, k=0)
        j = 1; k = 0;
        #10; // Wait for 1 clock cycle
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 4: Toggle (j=1, k=1)
        j = 1; k = 1;
        #10; // Wait for 1 clock cycle
        if (q !== 0) $display("FAIL: Expected q=0, got q=%b", q);
        #10; // Wait for 1 clock cycle
        if (q !== 1) $display("FAIL: Expected q=1, got q=%b", q);

        // Test case 5: Check complementary output
        if (qn_bar !== ~q) $display("FAIL: Expected qn_bar=%b, got qn_bar=%b", ~q, qn_bar);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule