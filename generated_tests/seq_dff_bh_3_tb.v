`timescale 1ns/1ps

module tb_seq_dff_bh;

    reg d;
    reg clk;
    wire q;

    // Instantiate the module under test
    seq_dff_bh uut (
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

        // Test case 1: Check initial state
        if (q !== 0) begin
            $display("FAIL: Initial state is incorrect");
            $finish;
        end

        // Test case 2: Set d to 1 and check q
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        // Test case 3: Set d to 0 and check q
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is 0");
            $finish;
        end

        // Test case 4: Toggle d and check q
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is toggled to 1");
            $finish;
        end

        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is toggled to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule