`timescale 1ns/1ps

module tb_mod_5_counter;

    reg clk;
    reg reset;
    wire [2:0] counter;

    // Instantiate the module under test
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
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial counter value
        if (counter !== 0) begin
            $display("FAIL: Initial counter value is not 0");
            $finish;
        end

        // Test counting up to 4
        #10; // Wait for 1 clock cycle
        if (counter !== 1) begin
            $display("FAIL: Counter value is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 2) begin
            $display("FAIL: Counter value is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3) begin
            $display("FAIL: Counter value is not 3 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4) begin
            $display("FAIL: Counter value is not 4 after 4 clock cycles");
            $finish;
        end

        // Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        reset = 0; // Deassert reset

        // Check counter after reset
        if (counter !== 0) begin
            $display("FAIL: Counter value is not 0 after reset");
            $finish;
        end

        // Test counting again
        #10; // Wait for 1 clock cycle
        if (counter !== 1) begin
            $display("FAIL: Counter value is not 1 after reset and 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 2) begin
            $display("FAIL: Counter value is not 2 after reset and 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 3) begin
            $display("FAIL: Counter value is not 3 after reset and 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (counter !== 4) begin
            $display("FAIL: Counter value is not 4 after reset and 4 clock cycles");
            $finish;
        end

        // Check counter wraps around after reaching 4
        #10; // Wait for 1 clock cycle
        if (counter !== 0) begin
            $display("FAIL: Counter value is not 0 after reaching 4");
            $finish;
        end

        // Final check to ensure it counts correctly again
        #10; // Wait for 1 clock cycle
        if (counter !== 1) begin
            $display("FAIL: Counter value is not 1 after wrap around");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule