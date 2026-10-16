`timescale 1ns/1ps

module tb_two_bit_ripple_up;

    reg clk;
    reg reset_n;
    wire [1:0] count;
    wire clkdiv;

    // Instantiate the module under test (uut)
    two_bit_ripple_up uut (
        .clk(clk),
        .reset_n(reset_n),
        .count(count),
        .clkdiv(clkdiv)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset_n = 0; // Assert reset
        #10; // Wait for 10ns
        reset_n = 1; // Deassert reset

        // Check initial count after reset
        if (count !== 2'b00) begin
            $display("FAIL: Initial count after reset is not 00");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 2'b01) begin
            $display("FAIL: Count is not 01 after 1 increment");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b10) begin
            $display("FAIL: Count is not 10 after 2 increments");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b11) begin
            $display("FAIL: Count is not 11 after 3 increments");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b00) begin
            $display("FAIL: Count is not 00 after wrap around");
            $finish;
        end

        // Check clkdiv after wrap around
        if (clkdiv !== 1'b1) begin
            $display("FAIL: clkdiv is not toggled after wrap around");
            $finish;
        end

        // Continue to check the count and clkdiv
        #10; // Wait for 1 clock cycle
        if (count !== 2'b01) begin
            $display("FAIL: Count is not 01 after 1 increment post wrap");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b10) begin
            $display("FAIL: Count is not 10 after 2 increments post wrap");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b11) begin
            $display("FAIL: Count is not 11 after 3 increments post wrap");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 2'b00) begin
            $display("FAIL: Count is not 00 after wrap around post wrap");
            $finish;
        end

        // Final check for clkdiv
        if (clkdiv !== 1'b0) begin
            $display("FAIL: clkdiv is not toggled back after wrap around post wrap");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule