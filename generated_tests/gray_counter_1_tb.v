`timescale 1ns/1ps

module tb_gray_counter;

    reg clk;
    reg rst;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    gray_counter uut (
        .clk(clk),
        .rst(rst),
        .y(y)
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
        rst = 0; // Release reset

        // Check initial state
        if (y !== 4'b0000) begin
            $display("FAIL: Initial output is not zero");
            $finish;
        end

        // Test counting
        #10; // Wait for 1 clock cycle
        if (y !== 4'b0001) begin
            $display("FAIL: Output after 1 clock cycle is not 0001");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0011) begin
            $display("FAIL: Output after 2 clock cycles is not 0011");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0010) begin
            $display("FAIL: Output after 3 clock cycles is not 0010");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0110) begin
            $display("FAIL: Output after 4 clock cycles is not 0110");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0111) begin
            $display("FAIL: Output after 5 clock cycles is not 0111");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0101) begin
            $display("FAIL: Output after 6 clock cycles is not 0101");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0100) begin
            $display("FAIL: Output after 7 clock cycles is not 0100");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b1100) begin
            $display("FAIL: Output after 8 clock cycles is not 1100");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        rst = 0; // Release reset

        // Check output after reset
        if (y !== 4'b0000) begin
            $display("FAIL: Output after reset is not zero");
            $finish;
        end

        // Final check for a few more cycles
        #10; // Wait for 1 clock cycle
        if (y !== 4'b0001) begin
            $display("FAIL: Output after reset and 1 clock cycle is not 0001");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (y !== 4'b0011) begin
            $display("FAIL: Output after reset and 2 clock cycles is not 0011");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule