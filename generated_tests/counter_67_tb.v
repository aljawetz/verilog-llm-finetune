`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg reset;
    reg clear;
    wire [6:0] count;

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
        #10 reset = 0; // Assert reset
        #10 reset = 1; // Deassert reset
        if (count !== 7'b0000000) begin
            $display("FAIL: Counter did not reset to 0");
            $finish;
        end

        // Test 2: Count up
        #10; // Wait for one clock cycle
        if (count !== 7'b0000001) begin
            $display("FAIL: Counter did not increment to 1");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 7'b0000010) begin
            $display("FAIL: Counter did not increment to 2");
            $finish;
        end

        // Test 3: Clear the counter
        clear = 1; // Assert clear
        #10 clear = 0; // Deassert clear
        if (count !== 7'b0000000) begin
            $display("FAIL: Counter did not clear to 0");
            $finish;
        end

        // Test 4: Count up again
        #10; // Wait for one clock cycle
        if (count !== 7'b0000001) begin
            $display("FAIL: Counter did not increment to 1 after clear");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 7'b0000010) begin
            $display("FAIL: Counter did not increment to 2 after clear");
            $finish;
        end

        // Test 5: Reset while counting
        #10 reset = 0; // Assert reset
        #10 reset = 1; // Deassert reset
        if (count !== 7'b0000000) begin
            $display("FAIL: Counter did not reset to 0 during counting");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule