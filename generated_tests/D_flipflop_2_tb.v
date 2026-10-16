`timescale 1ns/1ps

module tb_D_flipflop;

    // Inputs
    reg clk;
    reg reset;
    reg d;

    // Outputs
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
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
        reset = 1;
        d = 0;

        // Wait for a clock cycle
        #10;

        // Test reset functionality
        reset = 1; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test D flip-flop functionality
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test multiple clock cycles
        d = 1; #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        d = 0; #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Final reset test
        reset = 1; #10; // Assert reset
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule