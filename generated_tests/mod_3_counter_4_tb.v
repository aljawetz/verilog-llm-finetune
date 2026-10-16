`timescale 1ns/1ps

module tb_mod_3_counter;

    reg clk;
    reg reset;
    wire [1:0] counter;

    // Instantiate the module under test (uut)
    mod_3_counter uut (
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

        // Check initial value
        if (counter !== 0) begin
            $display("FAIL: Initial counter value is not 0");
            $finish;
        end

        // Test counting behavior
        #10; // Wait for 10ns
        if (counter !== 1) begin
            $display("FAIL: Counter value is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 2) begin
            $display("FAIL: Counter value is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 0) begin
            $display("FAIL: Counter value is not 0 after 3 clock cycles");
            $finish;
        end

        // Test reset functionality
        #10; // Wait for 10ns
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Check counter after reset
        if (counter !== 0) begin
            $display("FAIL: Counter value is not 0 after reset");
            $finish;
        end

        // Continue counting
        #10; // Wait for 10ns
        if (counter !== 1) begin
            $display("FAIL: Counter value is not 1 after 1 clock cycle post-reset");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 2) begin
            $display("FAIL: Counter value is not 2 after 2 clock cycles post-reset");
            $finish;
        end

        #10; // Wait for 10ns
        if (counter !== 0) begin
            $display("FAIL: Counter value is not 0 after 3 clock cycles post-reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule