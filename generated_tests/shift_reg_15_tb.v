`timescale 1ns/1ps

module tb_shift_reg;

    reg clk;
    reg rst;
    reg SI;
    wire SO;

    // Instantiate the shift register
    shift_reg uut (
        .SO(SO),
        .clk(clk),
        .rst(rst),
        .SI(SI)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        SI = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test case 1: Shift with SI = 0
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; SI = 0; // Shift 0 in
        #10; // Check output
        if (SO !== 1'b0) $display("FAIL: Expected SO = 0, got SO = %b", SO);

        // Test case 2: Shift with SI = 1
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; SI = 1; // Shift 1 in
        #10; // Check output
        if (SO !== 1'b1) $display("FAIL: Expected SO = 1, got SO = %b", SO);

        // Test case 3: Reset functionality
        #10; rst = 1; // Assert reset
        #10; rst = 0; // Deassert reset
        #10; // Check output after reset
        if (SO !== 1'b0) $display("FAIL: Expected SO = 0 after reset, got SO = %b", SO);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule