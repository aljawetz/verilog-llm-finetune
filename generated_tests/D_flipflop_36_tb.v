`timescale 1ns/1ps

module tb_D_flipflop;

    // Inputs
    reg d;
    reg clk;
    reg reset;

    // Outputs
    wire Q;

    // Instantiate the Unit Under Test (UUT)
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
        // Initialize inputs
        d = 0;
        reset = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Check D flip-flop functionality
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D when D is 1");
            $finish;
        end

        // Test 3: Change D and check Q
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not follow D when D is 0");
            $finish;
        end

        // Test 4: Check reset again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // Test 5: Check Q holds value when reset is not asserted
        reset = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not follow D when D is 1 after reset");
            $finish;
        end

        // Final check: Ensure Q holds value
        #10; // Wait for another clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not hold value after D was set to 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule