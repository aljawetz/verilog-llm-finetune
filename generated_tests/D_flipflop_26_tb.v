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
        reset = 1; d = 0;
        #10; // Wait for 10ns
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test case 2: Set d to 1 and clock
        d = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to 1 on clock edge");
            $finish;
        end

        // Test case 3: Set d to 0 and clock
        d = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to 0 on clock edge");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1;
        #10; // Wait for reset to take effect
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // Test case 5: Check normal operation after reset
        reset = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to 1 after reset");
            $finish;
        end

        // Final check
        d = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule