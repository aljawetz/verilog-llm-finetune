`timescale 1ns/1ps

module tb_data_delay;

    parameter BITS = 8;
    parameter DELAY = 5;

    reg clk;
    reg rst_n;
    reg [BITS-1:0] in_data;
    wire [BITS-1:0] out_data;

    // Instantiate the module under test (uut)
    data_delay #(
        .BITS(BITS),
        .DELAY(DELAY)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .in_data(in_data),
        .out_data(out_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        in_data = 8'h00;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Check output after reset
        #10;
        if (out_data !== 8'h00) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // Test case 2: Apply input data and check delayed output
        in_data = 8'hAA; // Input data
        #10; // Wait for one clock cycle
        if (out_data !== 8'h00) begin
            $display("FAIL: Output should be 0 after one cycle with input AA");
            $finish;
        end

        // Wait for DELAY cycles
        #(DELAY * 10);
        if (out_data !== 8'hAA) begin
            $display("FAIL: Output should be AA after DELAY cycles");
            $finish;
        end

        // Test case 3: Change input data and check delayed output
        in_data = 8'h55; // New input data
        #10; // Wait for one clock cycle
        if (out_data !== 8'hAA) begin
            $display("FAIL: Output should be AA after changing input to 55");
            $finish;
        end

        // Wait for DELAY cycles again
        #(DELAY * 10);
        if (out_data !== 8'h55) begin
            $display("FAIL: Output should be 55 after DELAY cycles with new input");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule