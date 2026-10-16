`timescale 1ns/1ps

module tb_FBUC;
    reg clk;
    reg reset;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    FBUC uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10 ns
        reset = 0; // Release reset

        // Check initial output
        if (out !== 4'b0000) begin
            $display("FAIL: Initial output is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check output
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0001) begin
            $display("FAIL: Output after 1 clock cycle is not 1");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: Output after 2 clock cycles is not 2");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (out !== 4'b0011) begin
            $display("FAIL: Output after 3 clock cycles is not 3");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after 4 clock cycles is not 4");
            $finish;
        end

        // Assert reset and check output
        reset = 1;
        #10; // Wait for 1 clock cycle
        reset = 0; // Release reset

        // Check output after reset
        if (out !== 4'b0000) begin
            $display("FAIL: Output after reset is not zero");
            $finish;
        end

        // Continue counting
        #10; // Wait for 1 clock cycle
        if (out !== 4'b0001) begin
            $display("FAIL: Output after 1 clock cycle post-reset is not 1");
            $finish;
        end

        // Final checks
        #10; // Wait for 1 more clock cycle
        if (out !== 4'b0010) begin
            $display("FAIL: Output after 2 clock cycles post-reset is not 2");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule