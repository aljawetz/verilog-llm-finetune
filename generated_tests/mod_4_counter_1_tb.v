`timescale 1ns/1ps

module tb_mod_4_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    mod_4_counter #(4) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
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
        reset = 0; // Release reset

        // Check initial count after reset
        if (count !== 0) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Count up to 3
        #20; // Wait for 2 clock cycles
        if (count !== 2) begin
            $display("FAIL: Count is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3) begin
            $display("FAIL: Count is not 3 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 0) begin
            $display("FAIL: Count is not 0 after 4 clock cycles");
            $finish;
        end

        // Test reset functionality
        #10; // Wait for 1 clock cycle
        if (count !== 1) begin
            $display("FAIL: Count is not 1 after 5 clock cycles");
            $finish;
        end

        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Check count after reset
        if (count !== 0) begin
            $display("FAIL: Count is not zero after reset");
            $finish;
        end

        // Count up again
        #30; // Wait for 3 clock cycles
        if (count !== 3) begin
            $display("FAIL: Count is not 3 after 3 more clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 0) begin
            $display("FAIL: Count is not 0 after 4 more clock cycles");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule