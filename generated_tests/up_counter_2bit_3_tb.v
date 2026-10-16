`timescale 1ns/1ps

module tb_up_counter_2bit;

    reg reset_n;
    reg clk;
    wire [1:0] q_out;

    // Instantiate the module under test (uut)
    up_counter_2bit uut (
        .reset_n(reset_n),
        .clk(clk),
        .q_out(q_out)
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

        // Check initial value after reset
        if (q_out !== 2'b00) begin
            $display("FAIL: Initial value after reset is not 00");
            $finish;
        end

        // Wait for a few clock cycles and check values
        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b01) begin
            $display("FAIL: Value after 1 clock cycle is not 01");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b10) begin
            $display("FAIL: Value after 2 clock cycles is not 10");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b11) begin
            $display("FAIL: Value after 3 clock cycles is not 11");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b00) begin
            $display("FAIL: Value after 4 clock cycles is not 00");
            $finish;
        end

        // Test reset functionality
        reset_n = 0; // Assert reset
        #10; // Wait for 10ns
        reset_n = 1; // Deassert reset

        // Check value after reset
        if (q_out !== 2'b00) begin
            $display("FAIL: Value after reset is not 00");
            $finish;
        end

        // Continue counting
        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b01) begin
            $display("FAIL: Value after 1 clock cycle is not 01");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b10) begin
            $display("FAIL: Value after 2 clock cycles is not 10");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q_out !== 2'b11) begin
            $display("FAIL: Value after 3 clock cycles is not 11");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule