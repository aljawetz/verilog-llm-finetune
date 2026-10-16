`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    top_module uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0;

        // Wait for the first clock edge
        #10;
        if (q !== 0) begin
            $display("FAIL: Initial output q should be 0");
            $finish;
        end

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is 1");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is 0");
            $finish;
        end

        // Test case 3: Toggle d
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is toggled to 1");
            $finish;
        end

        // Test case 4: Toggle d again
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is toggled to 0");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule