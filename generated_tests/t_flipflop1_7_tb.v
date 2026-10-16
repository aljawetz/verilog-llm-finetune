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
        rst = 1;
        t = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: T = 0, expect Q to remain 0
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed (T=0, Q=%b, Qbar=%b)", q, qbar);
            $finish;
        end

        // Test case 2: T = 1, expect Q to toggle
        t = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed (T=1, Q=%b, Qbar=%b)", q, qbar);
            $finish;
        end

        // Test case 3: T = 0, expect Q to remain 1
        t = 0;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed (T=0, Q=%b, Qbar=%b)", q, qbar);
            $finish;
        end

        // Test case 4: T = 1, expect Q to toggle
        t = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed (T=1, Q=%b, Qbar=%b)", q, qbar);
            $finish;
        end

        // Test case 5: Reset the flip-flop
        rst = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 5 failed after reset (Q=%b, Qbar=%b)", q, qbar);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule