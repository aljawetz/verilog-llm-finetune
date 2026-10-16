`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
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
        rst = 1; t = 0;
        #10; // Wait for a clock edge

        // Release reset
        rst = 0;
        #10; // Wait for a clock edge

        // Test case 1: T = 0, should not toggle
        t = 0;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 2: T = 1, should toggle
        t = 1;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 3: T = 0, should not toggle
        t = 0;
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed, expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 4: T = 1, should toggle
        t = 1;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test case 5: Asynchronous reset
        rst = 1;
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 5 failed after reset, expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule