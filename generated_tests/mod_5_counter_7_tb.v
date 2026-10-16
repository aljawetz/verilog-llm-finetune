`timescale 1ns/1ps

module tb_mod_5_counter;

    reg clk;
    reg reset;
    wire [2:0] counter;

    // Instantiate the module under test (uut)
    mod_5_counter uut (
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
        // Initialize signals
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Check initial counter value
        if (counter !== 3'b000) begin
            $display("FAIL: Initial counter value is not 0");
            $finish;
        end

        // Test counting up to 4
        #10; // Wait for 1 clock cycle
        if (counter !== 3'b001) begin
            $display("FAIL: Counter value is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3'b010) begin
            $display("FAIL: Counter value is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3'b011) begin
            $display("FAIL: Counter value is not 3 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3'b100) begin
            $display("FAIL: Counter value is not 4 after 4 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3'b000) begin
            $display("FAIL: Counter value is not 0 after 5 clock cycles");
            $finish;
        end

        // Test reset functionality
        #10; // Wait for 1 clock cycle
        reset = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        reset = 0; // Deassert reset

        // Check counter after reset
        if (counter !== 3'b000) begin
            $display("FAIL: Counter value is not 0 after reset");
            $finish;
        end

        // Continue counting after reset
        #10; // Wait for 1 clock cycle
        if (counter !== 3'b001) begin
            $display("FAIL: Counter value is not 1 after reset and 1 clock cycle");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule