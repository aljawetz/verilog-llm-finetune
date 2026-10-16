`timescale 1ns/1ps

module tb_Altera_UP_Audio_Bit_Counter;

    // Parameters
    parameter BIT_COUNTER_INIT = 5'h0F;

    // Inputs
    reg clk;
    reg reset;
    reg bit_clk_rising_edge;
    reg bit_clk_falling_edge;
    reg left_right_clk_rising_edge;
    reg left_right_clk_falling_edge;

    // Outputs
    wire counting;

    // Instantiate the Unit Under Test (UUT)
    Altera_UP_Audio_Bit_Counter uut (
        .clk(clk),
        .reset(reset),
        .bit_clk_rising_edge(bit_clk_rising_edge),
        .bit_clk_falling_edge(bit_clk_falling_edge),
        .left_right_clk_rising_edge(left_right_clk_rising_edge),
        .left_right_clk_falling_edge(left_right_clk_falling_edge),
        .counting(counting)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        bit_clk_rising_edge = 0;
        bit_clk_falling_edge = 0;
        left_right_clk_rising_edge = 0;
        left_right_clk_falling_edge = 0;

        // Release reset
        #10 reset = 0;

        // Test 1: Check initial counting state after reset
        #10;
        if (counting !== 0) begin
            $display("FAIL: Initial counting state should be 0 after reset");
            $finish;
        end

        // Test 2: Trigger left_right_clk to reset bit counter
        left_right_clk_rising_edge = 1;
        #10 left_right_clk_rising_edge = 0;

        // Test 3: Check counting state after resetting bit counter
        #10;
        if (counting !== 1) begin
            $display("FAIL: Counting state should be 1 after left_right_clk rising edge");
            $finish;
        end

        // Test 4: Simulate bit clock falling edges
        bit_clk_falling_edge = 1; // Simulate falling edge
        #10 bit_clk_falling_edge = 0;

        // Check counting state after one bit clock falling edge
        #10;
        if (counting !== 1) begin
            $display("FAIL: Counting state should remain 1 after one bit clock falling edge");
            $finish;
        end

        // Continue simulating bit clock falling edges until counter reaches zero
        for (integer i = 0; i < BIT_COUNTER_INIT; i = i + 1) begin
            bit_clk_falling_edge = 1; // Simulate falling edge
            #10 bit_clk_falling_edge = 0;
            #10;
        end

        // Test 5: Check counting state after counter reaches zero
        if (counting !== 0) begin
            $display("FAIL: Counting state should be 0 after bit counter reaches zero");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule