`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] out;

    // Instantiate the ring_counter module
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for two clock cycles
        reset = 0;

        // Check initial state after reset
        if (out !== 4'b0001) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Cycle through the ring counter
        #10; // Wait for one clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: State after 1 clock cycle is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: State after 2 clock cycles is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (out !== 4'b1000) begin
            $display("FAIL: State after 3 clock cycles is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (out !== 4'b0001) begin
            $display("FAIL: State after 4 clock cycles is incorrect");
            $finish;
        end

        // Assert reset functionality
        reset = 1;
        #10; // Wait for two clock cycles
        reset = 0;

        // Check state after reset again
        if (out !== 4'b0001) begin
            $display("FAIL: State after reset is incorrect");
            $finish;
        end

        // Final check for one complete cycle
        #40; // Wait for four clock cycles
        if (out !== 4'b0001) begin
            $display("FAIL: Final state after complete cycle is incorrect");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule