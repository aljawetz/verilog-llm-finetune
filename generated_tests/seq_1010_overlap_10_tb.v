`timescale 1ns/1ps

module tb_seq_1010_overlap;

    reg x;
    reg clk;
    reg reset;
    wire z;

    // Instantiate the module under test
    seq_1010_overlap uut (
        .x(x),
        .clk(clk),
        .reset(reset),
        .z(z)
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
        x = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test case 1: Sequence "1010"
        #10 x = 1; // S0 -> S10
        #10 x = 0; // S10 -> S11, z should be 0
        #10 x = 1; // S11 -> S2, z should be 1
        #10 x = 0; // S2 -> S10, z should be 0
        #10; // Check z
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after '1010' sequence");
            $finish;
        end

        // Test case 2: Overlapping sequence "1010" again
        #10 x = 1; // S10
        #10 x = 0; // S11, z should be 0
        #10 x = 1; // S11 -> S2, z should be 1
        #10 x = 0; // S2 -> S10, z should be 0
        #10; // Check z
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after overlapping '1010' sequence");
            $finish;
        end

        // Test case 3: Reset functionality
        #10 reset = 1; // Assert reset
        #10 reset = 0; // Release reset
        #10; // Check z
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after reset");
            $finish;
        end

        // Test case 4: No sequence
        #10 x = 0; // Remain in S0
        #10; // Check z
        if (z !== 0) begin
            $display("FAIL: Expected z=0 with no input");
            $finish;
        end

        // Test case 5: Another sequence "1010"
        #10 x = 1; // S0 -> S10
        #10 x = 0; // S10 -> S11, z should be 0
        #10 x = 1; // S11 -> S2, z should be 1
        #10 x = 0; // S2 -> S10, z should be 0
        #10; // Check z
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after second '1010' sequence");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule