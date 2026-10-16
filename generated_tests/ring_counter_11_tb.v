`timescale 1ns/1ps

module tb_ring_counter;

    reg Clock;
    reg Reset;
    wire [3:0] Count_out;

    // Instantiate the ring_counter module
    ring_counter uut (
        .Clock(Clock),
        .Reset(Reset),
        .Count_out(Count_out)
    );

    // Clock generation
    initial begin
        Clock = 0;
        forever #5 Clock = ~Clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize Reset
        Reset = 1;
        #10; // Wait for 10ns
        Reset = 0; // Release Reset

        // Check initial state
        if (Count_out !== 4'b0001) begin
            $display("FAIL: Initial state is incorrect, expected 0001, got %b", Count_out);
            $finish;
        end

        // Shift the counter and check the outputs
        #10; // Wait for one clock cycle
        if (Count_out !== 4'b0010) begin
            $display("FAIL: After 1 clock cycle, expected 0010, got %b", Count_out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Count_out !== 4'b0100) begin
            $display("FAIL: After 2 clock cycles, expected 0100, got %b", Count_out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Count_out !== 4'b1000) begin
            $display("FAIL: After 3 clock cycles, expected 1000, got %b", Count_out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Count_out !== 4'b0001) begin
            $display("FAIL: After 4 clock cycles, expected 0001, got %b", Count_out);
            $finish;
        end

        // Assert that the counter continues to cycle correctly
        #10; // Wait for another clock cycle
        if (Count_out !== 4'b0010) begin
            $display("FAIL: After 5 clock cycles, expected 0010, got %b", Count_out);
            $finish;
        end

        // Test reset functionality
        #10; // Wait for another clock cycle
        Reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        Reset = 0; // Release reset

        // Check if it resets correctly
        if (Count_out !== 4'b0001) begin
            $display("FAIL: After reset, expected 0001, got %b", Count_out);
            $finish;
        end

        // Final check to ensure the counter works after reset
        #10; // Wait for one clock cycle
        if (Count_out !== 4'b0010) begin
            $display("FAIL: After reset and 1 clock cycle, expected 0010, got %b", Count_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule