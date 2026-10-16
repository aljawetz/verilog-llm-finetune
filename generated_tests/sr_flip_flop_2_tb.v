`timescale 1ns/1ps

module tb_sr_flip_flop;

    reg s;
    reg r;
    reg clk;
    wire q;
    wire qn;

    // Instantiate the SR flip-flop
    sr_flip_flop uut (
        .s(s),
        .r(r),
        .clk(clk),
        .q(q),
        .qn(qn)
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
        #10; // Wait for a clock edge

        // Test case 1: s=0, r=0 (q should retain its value)
        s = 0; r = 0;
        #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);

        // Test case 2: s=1, r=0 (q should set to 1)
        s = 1; r = 0;
        #10;
        if (q !== 1) $display("FAIL: Test case 2 failed, expected q=1, got q=%b", q);

        // Test case 3: s=0, r=1 (q should set to 0)
        s = 0; r = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);

        // Test case 4: s=1, r=1 (q should be undefined)
        s = 1; r = 1;
        #10;
        if (q !== 1'bx) $display("FAIL: Test case 4 failed, expected q=x, got q=%b", q);

        // Test case 5: s=0, r=0 (q should retain its value, which is undefined)
        s = 0; r = 0;
        #10;
        if (q !== 1'bx) $display("FAIL: Test case 5 failed, expected q=x, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule