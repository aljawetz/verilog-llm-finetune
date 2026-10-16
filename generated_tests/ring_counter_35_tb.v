`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] counter;

    // Instantiate the ring_counter module
    ring_counter uut (
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

        // Check initial state after reset
        if (counter !== 4'b0001) begin
            $display("FAIL: Initial counter value is incorrect after reset");
            $finish;
        end

        // Run the counter for several clock cycles
        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value is incorrect after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0100) begin
            $display("FAIL: Counter value is incorrect after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0010) begin
            $display("FAIL: Counter value is incorrect after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4'b0001) begin
            $display("FAIL: Counter value is incorrect after 4 clock cycles");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check counter value after reset again
        if (counter !== 4'b0001) begin
            $display("FAIL: Counter value is incorrect after reset");
            $finish;
        end

        // Final check for one more cycle
        #10; // Wait for 1 clock cycle
        if (counter !== 4'b1000) begin
            $display("FAIL: Counter value is incorrect after 1 clock cycle post-reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule