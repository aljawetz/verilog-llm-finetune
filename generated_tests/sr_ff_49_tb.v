`timescale 1ns/1ps

module tb_sr_ff;

    reg s;
    reg r;
    reg clk;
    wire q;
    wire q_bar;

    // Instantiate the SR flip-flop
    sr_ff uut (
        .s(s),
        .r(r),
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
        s = 0; r = 0;
        #10; // Wait for clock to stabilize

        // Test case 1: Maintain state (s=0, r=0)
        s = 0; r = 0; #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: Set (s=1, r=0)
        s = 1; r = 0; #10;
        if (q !== 1) $display("FAIL: Test case 2 failed, expected q=1, got q=%b", q);

        // Test case 3: Reset (s=0, r=1)
        s = 0; r = 1; #10;
        if (q !== 0) $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);

        // Test case 4: Invalid state (s=1, r=1)
        s = 1; r = 1; #10;
        if (q !== 2'bx) $display("FAIL: Test case 4 failed, expected q=2'bXX, got q=%b", q);

        // Test case 5: Maintain state (s=0, r=0)
        s = 0; r = 0; #10;
        if (q !== 2'bx) $display("FAIL: Test case 5 failed, expected q=2'bXX, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule