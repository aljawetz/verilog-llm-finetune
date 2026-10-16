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
        #10; // Wait for 10ns
        reset = 0;

        // Check initial state
        if (out !== 4'b0000) begin
            $display("FAIL: Initial output is not 0000");
            $finish;
        end

        // Cycle through the states
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after 1st cycle is not 0000");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0011) begin
            $display("FAIL: Output after 2nd cycle is not 0011");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after 3rd cycle is not 0100");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0111) begin
            $display("FAIL: Output after 4th cycle is not 0111");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after 5th cycle is not 0000");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check output after reset
        if (out !== 4'b0000) begin
            $display("FAIL: Output after reset is not 0000");
            $finish;
        end

        // Final check to ensure it cycles again
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after 1st cycle post-reset is not 0000");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0011) begin
            $display("FAIL: Output after 2nd cycle post-reset is not 0011");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after 3rd cycle post-reset is not 0100");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0111) begin
            $display("FAIL: Output after 4th cycle post-reset is not 0111");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Output after 5th cycle post-reset is not 0000");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule