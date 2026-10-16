`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] counter;

    // Instantiate the ring_counter module
    ring_counter #(4) uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
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

        // Check initial state after reset
        if (counter !== 4'b0001) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Run the counter for a few cycles
        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value after 1 clock cycle is incorrect");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0100) begin
            $display("FAIL: Counter value after 2 clock cycles is incorrect");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0010) begin
            $display("FAIL: Counter value after 3 clock cycles is incorrect");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0001) begin
            $display("FAIL: Counter value after 4 clock cycles is incorrect");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check state after reset again
        if (counter !== 4'b0001) begin
            $display("FAIL: Counter value after reset is incorrect");
            $finish;
        end

        // Final check to ensure it cycles correctly again
        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value after 1 clock cycle post-reset is incorrect");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule