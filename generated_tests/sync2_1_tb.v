`timescale 1ns/1ps

module tb_sync2;

    reg clk;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    sync2 uut (
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

        // Wait for a few clock cycles
        #10;

        // Test case 1: Check initial value
        if (q !== 0) begin
            $display("FAIL: Initial value of q is not 0");
            $finish;
        end

        // Test case 2: Drive d high
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 when d is 1");
            $finish;
        end

        // Test case 3: Drive d low
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 when d is 0");
            $finish;
        end

        // Test case 4: Toggle d
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 when d is toggled to 1");
            $finish;
        end

        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 when d is toggled to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule