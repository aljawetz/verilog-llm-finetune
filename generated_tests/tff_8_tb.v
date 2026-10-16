`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the toggle flip-flop (uut)
    tff uut (
        .t(t),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        t = 0;
        #10; // Wait for some time
        reset = 0;

        // Test case 1: Reset functionality
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: Toggle when t is high
        t = 1;
        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling");
            $finish;
        end

        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test case 3: Hold value when t is low
        t = 0;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when t is low");
            $finish;
        end

        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should still remain 0 when t is low");
            $finish;
        end

        // Test case 4: Toggle again with t high
        t = 1;
        #10; // Wait for clock
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling again");
            $finish;
        end

        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test case 5: Reset functionality again
        reset = 1;
        #10; // Wait for clock
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule