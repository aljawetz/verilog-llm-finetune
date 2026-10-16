`timescale 1ns/1ps

module tb_t_flipflop;

    reg t;
    reg clk;
    wire q;
    wire q_bar;

    // Instantiate the module under test (uut)
    t_flipflop uut (
        .t(t),
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
        // Initialize
        t = 0;

        // Test case 1: t = 0, expect q = 1, q_bar = 0
        #10;
        if (q !== 1'b1 || q_bar !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: t = 1, expect q = 0, q_bar = 1
        t = 1;
        #10;
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: t = 0, expect q = 1, q_bar = 0
        t = 0;
        #10;
        if (q !== 1'b1 || q_bar !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: t = 1, expect q = 0, q_bar = 1
        t = 1;
        #10;
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule