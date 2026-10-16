`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
        .clk(clk),
        .q(q)
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
        #10; // Wait for a clock edge

        // Test case 1: Check initial state
        if (q !== 0) begin
            $display("FAIL: Initial state is incorrect");
            $finish;
        end

        // Test case 2: Set d to 1
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is 1");
            $finish;
        end

        // Test case 3: Set d to 0
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is 0");
            $finish;
        end

        // Test case 4: Toggle d to 1 again
        d = 1;
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is 1");
            $finish;
        end

        // Test case 5: Toggle d to 0 again
        d = 0;
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule