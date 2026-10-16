`timescale 1ns/1ps

module tb_odd_counter;

    reg clk;
    reg rst;
    wire [7:0] out;

    // Instantiate the odd_counter module
    odd_counter uut (
        .clk(clk),
        .rst(rst),
        .out(out)
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

        // Check initial output after reset
        if (out !== 8'h1) begin
            $display("FAIL: Initial output after reset is not 1");
            $finish;
        end

        // Wait for a few clock cycles and check output
        #10; // Wait for 1 clock cycle
        if (out !== 8'h3) begin
            $display("FAIL: Output after 1 clock cycle is not 3");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 8'h5) begin
            $display("FAIL: Output after 2 clock cycles is not 5");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 8'h7) begin
            $display("FAIL: Output after 3 clock cycles is not 7");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 8'h9) begin
            $display("FAIL: Output after 4 clock cycles is not 9");
            $finish;
        end

        // Test reset functionality
        rst = 1;
        #10; // Wait for 10ns
        rst = 0;

        // Check output after reset
        if (out !== 8'h1) begin
            $display("FAIL: Output after reset is not 1");
            $finish;
        end

        // Continue testing
        #10; // Wait for 1 clock cycle
        if (out !== 8'h3) begin
            $display("FAIL: Output after 1 clock cycle post-reset is not 3");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule