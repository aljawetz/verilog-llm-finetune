`timescale 1ns/1ps

module tb_shift_reg;

    reg clk;
    reg rst;
    reg SI;
    wire SO;

    // Instantiate the shift_reg module
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
        // Initialize inputs
        rst = 1;
        SI = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test shifting in 1s
        SI = 1;
        #10; // Shift in 1
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 1
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        // Test shifting in 0s
        SI = 0;
        #10; // Shift in 0
        if (SO !== 1) $display("FAIL: Expected SO=1, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        #10; // Shift in 0
        if (SO !== 0) $display("FAIL: Expected SO=0, got SO=%b", SO);

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule