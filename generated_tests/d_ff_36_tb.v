`timescale 1ns/1ps

module tb_d_ff;

    reg clk;
    reg reset_n;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .clk(clk),
        .reset_n(reset_n),
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
        reset_n = 0;
        d = 0;

        // Apply reset
        #10;
        reset_n = 1; // Release reset
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check D flip-flop functionality
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 on clock edge");
            $finish;
        end

        // Test case 3: Change D to 0
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 on clock edge");
            $finish;
        end

        // Test case 4: Test reset functionality again
        reset_n = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Release reset and check D input
        reset_n = 1; // Release reset
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 after reset release");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule