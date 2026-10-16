`timescale 1ns/1ps

module tb_accu;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg [7:0] data_in;
    reg valid_in;
    wire valid_out;
    wire [9:0] data_out;

    // Instantiate the module under test (uut)
    accu uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .valid_in(valid_in),
        .valid_out(valid_out),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        valid_in = 0;
        data_in = 8'd0;

        // Release reset
        #10 rst_n = 1;

        // Test case 1: Accumulate four valid inputs
        valid_in = 1;
        data_in = 8'd1; #10; // 1
        data_in = 8'd2; #10; // 2
        data_in = 8'd3; #10; // 3
        data_in = 8'd4; #10; // 4

        // Check output after 4th input
        if (valid_out !== 1'b1 || data_out !== 10'd10) begin
            $display("FAIL: Expected valid_out = 1 and data_out = 10 after 4 inputs");
            $finish;
        end

        // Reset the module
        valid_in = 0; #10;

        // Test case 2: Accumulate another set of valid inputs
        valid_in = 1;
        data_in = 8'd5; #10; // 5
        data_in = 8'd6; #10; // 6
        data_in = 8'd7; #10; // 7
        data_in = 8'd8; #10; // 8

        // Check output after 4th input
        if (valid_out !== 1'b1 || data_out !== 10'd26) begin
            $display("FAIL: Expected valid_out = 1 and data_out = 26 after 4 inputs");
            $finish;
        end

        // Reset the module
        valid_in = 0; #10;

        // Test case 3: No valid inputs
        valid_in = 0; data_in = 8'd0; #10; // No accumulation
        if (valid_out !== 1'b0) begin
            $display("FAIL: Expected valid_out = 0 when valid_in is 0");
            $finish;
        end

        // Test case 4: Accumulate with some invalid inputs
        valid_in = 1;
        data_in = 8'd9; #10; // 9
        valid_in = 0; #10; // Invalid input
        data_in = 8'd10; #10; // 10
        valid_in = 1; #10; // Valid input again
        data_in = 8'd11; #10; // 11
        data_in = 8'd12; #10; // 12

        // Check output after 4th input
        if (valid_out !== 1'b1 || data_out !== 10'd42) begin
            $display("FAIL: Expected valid_out = 1 and data_out = 42 after 4 inputs");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule