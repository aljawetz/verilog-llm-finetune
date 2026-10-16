`timescale 1ns/1ps

module tb_reg_2bit;

    // Inputs
    reg clk;
    reg rst;
    reg [1:0] in0;

    // Outputs
    wire [1:0] out0;

    // Instantiate the Unit Under Test (UUT)
    reg_2bit uut (
        .clk(clk), 
        .rst(rst), 
        .in0(in0), 
        .out0(out0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        in0 = 2'b00;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Load data into register
        in0 = 2'b01;
        #10;
        if (out0 !== 2'b01) begin
            $display("FAIL: Expected out0 = 01, got %b", out0);
            $finish;
        end

        // Test case 2: Load new data
        in0 = 2'b10;
        #10;
        if (out0 !== 2'b10) begin
            $display("FAIL: Expected out0 = 10, got %b", out0);
            $finish;
        end

        // Test case 3: Assert reset
        rst = 1;
        #10;
        if (out0 !== 2'b00) begin
            $display("FAIL: Expected out0 = 00 after reset, got %b", out0);
            $finish;
        end

        // Test case 4: Release reset and load data
        rst = 0;
        in0 = 2'b11;
        #10;
        if (out0 !== 2'b11) begin
            $display("FAIL: Expected out0 = 11, got %b", out0);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule