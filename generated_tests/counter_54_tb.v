`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg reset;
    reg clear;
    wire [3:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .clear(clear),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        clear = 0;

        // Test 1: Reset the counter
        #2 reset = 0; // Assert reset
        #10; // Wait for a few clock cycles
        if (count !== 4'b0000) begin
            $display("FAIL: Counter did not reset to 0");
            $finish;
        end
        reset = 1; // Deassert reset

        // Test 2: Increment the counter
        #10; // Wait for a few clock cycles
        if (count !== 4'b0001) begin
            $display("FAIL: Counter did not increment to 1");
            $finish;
        end

        // Test 3: Clear the counter
        clear = 1; // Assert clear
        #10; // Wait for a clock cycle
        if (count !== 4'b0000) begin
            $display("FAIL: Counter did not clear to 0");
            $finish;
        end
        clear = 0; // Deassert clear

        // Test 4: Increment the counter again
        #10; // Wait for a few clock cycles
        if (count !== 4'b0001) begin
            $display("FAIL: Counter did not increment to 1 after clear");
            $finish;
        end

        // Test 5: Count to maximum and check overflow
        #40; // Wait for 4 clock cycles to reach 5
        if (count !== 4'b0101) begin
            $display("FAIL: Counter did not increment correctly");
            $finish;
        end

        // Test 6: Reset during counting
        #10 reset = 0; // Assert reset
        #10; // Wait for a few clock cycles
        if (count !== 4'b0000) begin
            $display("FAIL: Counter did not reset to 0 during counting");
            $finish;
        end
        reset = 1; // Deassert reset

        // Test 7: Count again after reset
        #20; // Wait for a few clock cycles
        if (count !== 4'b0010) begin
            $display("FAIL: Counter did not increment correctly after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule