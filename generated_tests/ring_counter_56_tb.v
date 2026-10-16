`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the ring_counter module
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
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
        #10; // Wait for a clock cycle
        reset = 0;

        // Check initial state after reset
        if (q !== 4'b1000) begin
            $display("FAIL: Initial state after reset is incorrect, got %b", q);
            $finish;
        end

        // Run the counter for a few cycles
        #10; // Wait for 1 clock cycle
        if (q !== 4'b0100) begin
            $display("FAIL: State after 1 clock cycle is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0010) begin
            $display("FAIL: State after 2 clock cycles is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: State after 3 clock cycles is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: State after 4 clock cycles is incorrect, got %b", q);
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for a clock cycle
        reset = 0;

        // Check state after reset again
        if (q !== 4'b1000) begin
            $display("FAIL: State after reset is incorrect, got %b", q);
            $finish;
        end

        // Final check for a few more cycles
        #10; // Wait for 1 clock cycle
        if (q !== 4'b0100) begin
            $display("FAIL: State after 1 clock cycle post-reset is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0010) begin
            $display("FAIL: State after 2 clock cycles post-reset is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: State after 3 clock cycles post-reset is incorrect, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: State after 4 clock cycles post-reset is incorrect, got %b", q);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule