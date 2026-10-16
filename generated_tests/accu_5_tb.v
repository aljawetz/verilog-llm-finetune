`timescale 1ns/1ps

module tb_accu;

    // Parameters
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
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        data_in = 8'd0;
        valid_in = 0;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Accumulate four valid inputs
        data_in = 8'd10; valid_in = 1; #10; // valid input 1
        data_in = 8'd20; valid_in = 1; #10; // valid input 2
        data_in = 8'd30; valid_in = 1; #10; // valid input 3
        data_in = 8'd40; valid_in = 1; #10; // valid input 4
        valid_in = 0; #10; // Wait for output

        // Check output
        if (valid_out !== 1'b1 || data_out !== 10'd100) begin
            $display("FAIL: Expected valid_out=1 and data_out=100, got valid_out=%b and data_out=%d", valid_out, data_out);
            $finish;
        end

        // Reset for next test
        rst_n = 0; #10; rst_n = 1; #10;

        // Test case 2: Accumulate another set of inputs
        data_in = 8'd5; valid_in = 1; #10; // valid input 1
        data_in = 8'd15; valid_in = 1; #10; // valid input 2
        data_in = 8'd25; valid_in = 1; #10; // valid input 3
        data_in = 8'd35; valid_in = 1; #10; // valid input 4
        valid_in = 0; #10; // Wait for output

        // Check output
        if (valid_out !== 1'b1 || data_out !== 10'd80) begin
            $display("FAIL: Expected valid_out=1 and data_out=80, got valid_out=%b and data_out=%d", valid_out, data_out);
            $finish;
        end

        // Reset for next test
        rst_n = 0; #10; rst_n = 1; #10;

        // Test case 3: No valid inputs
        valid_in = 0; #40; // Wait without valid inputs

        // Check output
        if (valid_out !== 1'b0) begin
            $display("FAIL: Expected valid_out=0 when no valid inputs, got valid_out=%b", valid_out);
            $finish;
        end

        // Test case 4: Accumulate less than four inputs
        data_in = 8'd1; valid_in = 1; #10; // valid input 1
        data_in = 8'd2; valid_in = 1; #10; // valid input 2
        valid_in = 0; #10; // Wait for output

        // Check output
        if (valid_out !== 1'b0) begin
            $display("FAIL: Expected valid_out=0 after less than four inputs, got valid_out=%b", valid_out);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule