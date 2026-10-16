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
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial state
        if (out !== 4'b0001) begin
            $display("FAIL: Initial state is incorrect, got %b", out);
            $finish;
        end

        // Shift through the ring counter
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: After 1 clock cycle, expected 0010, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: After 2 clock cycles, expected 0100, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b1000) begin
            $display("FAIL: After 3 clock cycles, expected 1000, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 4'b0001) begin
            $display("FAIL: After 4 clock cycles, expected 0001, got %b", out);
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;

        // Check state after reset
        if (out !== 4'b0001) begin
            $display("FAIL: After reset, expected 0001, got %b", out);
            $finish;
        end

        // Final checks
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: After 1 clock cycle post-reset, expected 0010, got %b", out);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule