`timescale 1ns/1ps

module tb_D_flipflop;

    reg d;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .Q(Q)
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

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: Check D flip-flop functionality
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D value 1");
            $finish;
        end

        // Test case 3: Change D to 0
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D value 0");
            $finish;
        end

        // Test case 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // Test case 5: Check D flip-flop functionality after reset
        reset = 0; // Release reset
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D value 1 after reset");
            $finish;
        end

        // Test case 6: Final check with D = 0
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D value 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule