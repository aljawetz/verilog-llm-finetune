`timescale 1ns/1ps

module tb_sequence_counter;

    reg clk;
    reg reset;
    wire [3:0] counter;

    // Instantiate the module under test (uut)
    sequence_counter uut (
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

        // Check initial state
        if (counter !== 4'b0000) begin
            $display("FAIL: Initial counter value is not 0");
            $finish;
        end

        // Cycle through the sequence
        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value is not 0 after 1st clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0010) begin
            $display("FAIL: Counter value is not 2 after 2nd clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0101) begin
            $display("FAIL: Counter value is not 5 after 3rd clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value is not 8 after 4th clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1011) begin
            $display("FAIL: Counter value is not 11 after 5th clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1110) begin
            $display("FAIL: Counter value is not 14 after 6th clock");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value is not 0 after 7th clock");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check after reset
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value is not 0 after reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule