`timescale 1ns/1ps

module tb_tff;

    // Inputs
    reg clk;
    reg reset;
    reg t;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    tff uut (
        .clk(clk),
        .reset(reset),
        .t(t),
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
        reset = 1;
        t = 0;

        // Wait for a clock edge
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Toggle q when t is high
        t = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not toggle to 1 when t is high");
            $finish;
        end

        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q did not toggle to 0 on next clock edge");
            $finish;
        end

        // Test case 3: Ensure q remains unchanged when t is low
        t = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q changed when t is low");
            $finish;
        end

        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q changed when t is low");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Toggle q again after reset
        reset = 0;
        t = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not toggle to 1 after reset");
            $finish;
        end

        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q did not toggle to 0 on next clock edge after reset");
            $finish;
        end

        // Final case: Check if q remains unchanged when t is low
        t = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q changed when t is low after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule