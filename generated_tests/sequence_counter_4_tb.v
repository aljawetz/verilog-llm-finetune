`timescale 1ns/1ps

module tb_sequence_counter;

    reg clk;
    reg reset;
    wire [3:0] counter;

    // Instantiate the module under test
    sequence_counter uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial state
        if (counter !== 4'b0000) begin
            $display("FAIL: Initial counter value is incorrect");
            $finish;
        end

        // Wait for the counter to go through its sequence
        #10; // Wait for 1st clock cycle
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value after 1st cycle is incorrect");
            $finish;
        end

        #10; // Wait for 2nd clock cycle
        if (counter !== 4'b0010) begin
            $display("FAIL: Counter value after 2nd cycle is incorrect");
            $finish;
        end

        #10; // Wait for 3rd clock cycle
        if (counter !== 4'b0101) begin
            $display("FAIL: Counter value after 3rd cycle is incorrect");
            $finish;
        end

        #10; // Wait for 4th clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value after 4th cycle is incorrect");
            $finish;
        end

        #10; // Wait for 5th clock cycle
        if (counter !== 4'b1011) begin
            $display("FAIL: Counter value after 5th cycle is incorrect");
            $finish;
        end

        #10; // Wait for 6th clock cycle
        if (counter !== 4'b1110) begin
            $display("FAIL: Counter value after 6th cycle is incorrect");
            $finish;
        end

        #10; // Wait for 7th clock cycle
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value after 7th cycle is incorrect");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;

        // Check counter after reset
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value after reset is incorrect");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule