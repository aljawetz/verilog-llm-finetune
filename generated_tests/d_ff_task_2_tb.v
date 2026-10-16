`timescale 1ns/1ps

module tb_d_ff_task;

    reg d;
    reg clk;
    wire q;

    // Instantiate the module under test (uut)
    d_ff_task uut (
        .q(q),
        .d(d),
        .clk(clk)
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

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1, got %b", q);
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0, got %b", q);
            $finish;
        end

        // Test case 3: Toggle d to 1 again
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1, got %b", q);
            $finish;
        end

        // Test case 4: Toggle d to 0 again
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0, got %b", q);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule