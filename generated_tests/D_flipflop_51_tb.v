`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg rst;
    reg D;
    wire q;
    wire q_bar;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .rst(rst),
        .D(D),
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
        // Initialize signals
        rst = 1;
        D = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test case 1: Check initial state after reset
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test case 2: Set D to 1 and check output
        D = 1;
        #10; // Wait for one clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Output after setting D to 1 is incorrect");
            $finish;
        end

        // Test case 3: Set D to 0 and check output
        D = 0;
        #10; // Wait for one clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Output after setting D to 0 is incorrect");
            $finish;
        end

        // Test case 4: Assert reset and check output
        rst = 1;
        #10; // Wait for one clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Output after asserting reset is incorrect");
            $finish;
        end

        // Test case 5: Release reset and set D to 1
        rst = 0;
        D = 1;
        #10; // Wait for one clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Output after setting D to 1 post-reset is incorrect");
            $finish;
        end

        // Test case 6: Release reset and set D to 0
        D = 0;
        #10; // Wait for one clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Output after setting D to 0 post-reset is incorrect");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule