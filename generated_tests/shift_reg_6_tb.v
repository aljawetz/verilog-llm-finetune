`timescale 1ns/1ps

module tb_shift_reg;
    parameter SIZE = 4;
    reg clk;
    reg rstn;
    reg SI;
    wire SO;

    // Instantiate the shift register
    shift_reg #(SIZE) uut (
        .clk(clk),
        .rstn(rstn),
        .SI(SI),
        .SO(SO)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        SI = 0;

        // Apply reset
        #10;
        rstn = 1; // Release reset

        // Test shifting in values
        SI = 1; #10; // Shift in 1
        if (SO !== 0) $display("FAIL: Expected SO = 0, got SO = %b", SO);

        SI = 1; #10; // Shift in 1
        if (SO !== 0) $display("FAIL: Expected SO = 0, got SO = %b", SO);

        SI = 0; #10; // Shift in 0
        if (SO !== 1) $display("FAIL: Expected SO = 1, got SO = %b", SO);

        SI = 1; #10; // Shift in 1
        if (SO !== 0) $display("FAIL: Expected SO = 0, got SO = %b", SO);

        // Test reset functionality
        rstn = 0; #10; // Assert reset
        if (SO !== 0) $display("FAIL: Expected SO = 0 after reset, got SO = %b", SO);

        rstn = 1; // Release reset
        SI = 1; #10; // Shift in 1
        if (SO !== 0) $display("FAIL: Expected SO = 0, got SO = %b", SO);

        // Final test with multiple shifts
        SI = 1; #10; // Shift in 1
        SI = 1; #10; // Shift in 1
        SI = 0; #10; // Shift in 0
        if (SO !== 1) $display("FAIL: Expected SO = 1, got SO = %b", SO);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule