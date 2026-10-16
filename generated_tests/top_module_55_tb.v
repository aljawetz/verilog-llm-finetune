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

    // Clock generation
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
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is set to 1");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is set to 0");
            $finish;
        end

        // Test case 3: Set d to 1 again
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 when d is set to 1 again");
            $finish;
        end

        // Test case 4: Set d to 0 again
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 when d is set to 0 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule