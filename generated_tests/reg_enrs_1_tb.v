`timescale 1ns/1ps

module tb_reg_enrs;

    parameter DW = 4;
    parameter RESET_VAL = 4'b1010;

    reg clk;
    reg rst_n;
    reg en;
    reg [DW-1:0] data_i;
    wire [DW-1:0] data_o;

    // Instantiate the module under test
    reg_enrs #(
        .DW(DW),
        .RESET_VAL(RESET_VAL)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
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
        en = 0;
        data_i = 4'b0000;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test case 1: Check reset value
        #10;
        if (data_o !== RESET_VAL) begin
            $display("FAIL: Reset value check failed, expected %b, got %b", RESET_VAL, data_o);
            $finish;
        end

        // Test case 2: Enable and load data
        en = 1;
        data_i = 4'b1101; // New data to load
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Data load failed, expected %b, got %b", data_i, data_o);
            $finish;
        end

        // Test case 3: Disable loading
        en = 0;
        data_i = 4'b0011; // New data to load, should not take effect
        #10;
        if (data_o !== 4'b1101) begin
            $display("FAIL: Data should not change when disabled, expected %b, got %b", 4'b1101, data_o);
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst_n = 0; // Assert reset
        #10;
        rst_n = 1; // Release reset
        #10;
        if (data_o !== RESET_VAL) begin
            $display("FAIL: Reset value check failed after reset, expected %b, got %b", RESET_VAL, data_o);
            $finish;
        end

        // Test case 5: Enable and load new data again
        en = 1;
        data_i = 4'b0110; // New data to load
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Data load failed on second load, expected %b, got %b", data_i, data_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule