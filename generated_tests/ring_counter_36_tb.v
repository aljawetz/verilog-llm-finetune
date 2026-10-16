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

        // Check initial state after reset
        if (out !== 4'b0001) begin
            $display("FAIL: Initial output after reset is incorrect. Expected 0001, got %b", out);
            $finish;
        end

        // Wait for one clock cycle
        #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Output after 1 clock cycle is incorrect. Expected 0010, got %b", out);
            $finish;
        end

        // Wait for another clock cycle
        #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Output after 2 clock cycles is incorrect. Expected 0100, got %b", out);
            $finish;
        end

        // Wait for another clock cycle
        #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Output after 3 clock cycles is incorrect. Expected 1000, got %b", out);
            $finish;
        end

        // Wait for another clock cycle
        #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Output after 4 clock cycles is incorrect. Expected 0001, got %b", out);
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;

        // Check output after reset again
        if (out !== 4'b0001) begin
            $display("FAIL: Output after reset is incorrect. Expected 0001, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule