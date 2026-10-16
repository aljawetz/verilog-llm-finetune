`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg rstn;
    wire [1:0] out;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .rstn(rstn),
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
        rstn = 0; // Active-low reset
        #10; // Wait for 10ns
        rstn = 1; // Release reset

        // Check initial output
        if (out !== 2'b00) begin
            $display("FAIL: Initial output is not zero");
            $finish;
        end

        // Wait for 4 clock cycles and check output
        #40; // Wait for 4 clock cycles (40ns)
        if (out !== 2'b00) begin
            $display("FAIL: Output after 4 cycles is not zero");
            $finish;
        end

        // Test counting
        #10; // Wait for 1 clock cycle
        if (out !== 2'b01) begin
            $display("FAIL: Output after 1 cycle is not 1");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 2'b10) begin
            $display("FAIL: Output after 2 cycles is not 2");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 2'b11) begin
            $display("FAIL: Output after 3 cycles is not 3");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 2'b00) begin
            $display("FAIL: Output after 4 cycles is not zero");
            $finish;
        end

        // Test reset functionality
        rstn = 0; // Assert reset
        #10; // Wait for 1 clock cycle
        if (out !== 2'b00) begin
            $display("FAIL: Output during reset is not zero");
            $finish;
        end

        rstn = 1; // Release reset
        #10; // Wait for 1 clock cycle
        if (out !== 2'b01) begin
            $display("FAIL: Output after reset is not 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule