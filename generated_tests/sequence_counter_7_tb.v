`timescale 1ns/1ps

module tb_sequence_counter;

    reg clk;
    reg reset;
    wire [3:0] out;

    // Instantiate the module under test
    sequence_counter uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for two clock cycles
        reset = 0;

        // Check initial state
        if (out !== 4'b0000) begin
            $display("FAIL: Initial output is not 0000");
            $finish;
        end

        // Wait for the first state transition
        #10; // Wait for next clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after first clock is not 0000");
            $finish;
        end

        // Wait for the second state transition
        #10; // Wait for next clock cycle
        if (out !== 4'b0011) begin
            $display("FAIL: Output after second clock is not 0011");
            $finish;
        end

        // Wait for the third state transition
        #10; // Wait for next clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after third clock is not 0100");
            $finish;
        end

        // Wait for the fourth state transition
        #10; // Wait for next clock cycle
        if (out !== 4'b0111) begin
            $display("FAIL: Output after fourth clock is not 0111");
            $finish;
        end

        // Wait for the fifth state transition, should wrap around
        #10; // Wait for next clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after fifth clock is not 0000");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for two clock cycles
        reset = 0;

        // Check output after reset
        if (out !== 4'b0000) begin
            $display("FAIL: Output after reset is not 0000");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule