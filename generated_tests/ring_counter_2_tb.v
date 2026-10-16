`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] out;

    // Instantiate the module under test
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
        reset = 0; // Release reset

        // Check initial state
        if (out !== 4'b0001) begin
            $display("FAIL: Initial output is incorrect, got %b", out);
            $finish;
        end

        // Cycle through the ring counter
        #10; // Wait for one clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: Output after 1 clock cycle is incorrect, got %b", out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after 2 clock cycles is incorrect, got %b", out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (out !== 4'b1000) begin
            $display("FAIL: Output after 3 clock cycles is incorrect, got %b", out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (out !== 4'b0001) begin
            $display("FAIL: Output after 4 clock cycles is incorrect, got %b", out);
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (out !== 4'b0001) begin
            $display("FAIL: Output after reset is incorrect, got %b", out);
            $finish;
        end

        reset = 0; // Release reset
        #10; // Wait for one clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: Output after reset and 1 clock cycle is incorrect, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule