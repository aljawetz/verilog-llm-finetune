`timescale 1ns/1ps

module tb_sequence_count;
    reg clk;
    reg rst;
    wire [3:0] counter;

    // Instantiate the module under test (uut)
    sequence_count uut (
        .clk(clk),
        .rst(rst),
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
        rst = 1;
        #10; // Wait for 10ns
        rst = 0;

        // Check initial state
        if (counter !== 4'b0000) begin
            $display("FAIL: Initial counter value is not 0");
            $finish;
        end

        // Apply the sequence
        #10; // Wait for 10ns
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value after first clock is not 0");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b0010) begin
            $display("FAIL: Counter value after second clock is not 2");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b0101) begin
            $display("FAIL: Counter value after third clock is not 5");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value after fourth clock is not 8");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b1011) begin
            $display("FAIL: Counter value after fifth clock is not 11");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b1110) begin
            $display("FAIL: Counter value after sixth clock is not 14");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 4'b0000) begin
            $display("FAIL: Counter value after seventh clock is not 0");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end
endmodule