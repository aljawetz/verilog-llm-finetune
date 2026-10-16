`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        d = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        // Test case 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst_n = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Test case 5: Final check with D = 1
        rst_n = 1; // Release reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule