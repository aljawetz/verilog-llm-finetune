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

        // Wait for a clock edge
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Set d to 1 again
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Set d to 0 again
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule