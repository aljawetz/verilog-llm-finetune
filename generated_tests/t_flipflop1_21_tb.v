`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop module
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        t = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test case 1: T = 0, expect q to remain 0
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 2: T = 1, expect q to toggle
        t = 1;
        #10; // Falling edge of clk
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 3: T = 1, expect q to toggle again
        #10; // Falling edge of clk
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 4: Assert reset
        rst = 1;
        #10; // Wait for reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed, expected q=0, qbar=1 after reset, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 5: T = 1 after reset, expect q to toggle
        rst = 0;
        t = 1;
        #10; // Falling edge of clk
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 5 failed, expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 6: T = 0, expect q to remain the same
        t = 0;
        #10; // Falling edge of clk
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 6 failed, expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 7: T = 1, expect q to toggle
        t = 1;
        #10; // Falling edge of clk
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 7 failed, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule