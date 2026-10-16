`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    wire q;
    wire q_bar;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
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
        d = 0;
        #10; // Wait for 10ns

        // Test case 1: Check initial state
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end

        // Test case 2: Set d = 1, expect q = 1, q_bar = 0 on next clock edge
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Set d = 0, expect q = 0, q_bar = 1 on next clock edge
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Set d = 1 again, expect q = 1, q_bar = 0 on next clock edge
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Set d = 0 again, expect q = 0, q_bar = 1 on next clock edge
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule