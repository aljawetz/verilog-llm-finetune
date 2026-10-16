`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .d(d),
        .clk(clk),
        .reset(reset),
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
        reset = 1;
        d = 0;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: q did not follow d when d is 1");
            $finish;
        end

        // Test case 3: Check D input propagation with reset
        d = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: q did not follow d when d is 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Check D input propagation after reset
        reset = 0;
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: q did not follow d after reset when d is 1");
            $finish;
        end

        // Test case 6: Final check with d = 0
        d = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: q did not follow d after reset when d is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule