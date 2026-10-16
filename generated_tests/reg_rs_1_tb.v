`timescale 1ns/1ps

module tb_reg_rs;

    parameter DW = 1;
    parameter RESET_VAL = 0;

    reg clk;
    reg rst_n;
    reg [DW-1:0] data_i;
    wire [DW-1:0] data_o;

    // Instantiate the module under test (uut)
    reg_rs #(
        .DW(DW),
        .RESET_VAL(RESET_VAL)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_i(data_i),
        .data_o(data_o)
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
        data_i = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test 1: Check reset value
        #10;
        if (data_o !== RESET_VAL) begin
            $display("FAIL: Output not equal to RESET_VAL after reset");
            $finish;
        end

        // Test 2: Check data input propagation
        data_i = 1;
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Output not equal to data_i after clock edge");
            $finish;
        end

        // Test 3: Check reset functionality
        rst_n = 0; // Assert reset
        #10;
        if (data_o !== RESET_VAL) begin
            $display("FAIL: Output not equal to RESET_VAL during reset");
            $finish;
        end

        // Test 4: Check data input propagation after reset
        rst_n = 1; // Release reset
        data_i = 2;
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Output not equal to data_i after clock edge post-reset");
            $finish;
        end

        // Test 5: Check another data input propagation
        data_i = 3;
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Output not equal to data_i after clock edge");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule