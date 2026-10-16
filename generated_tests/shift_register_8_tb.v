`timescale 1ns/1ps

module tb_shift_register;

    reg clk;
    reg reset;
    reg serial_in;
    reg shift_enable;
    wire [3:0] q;

    // Instantiate the shift_register module
    shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift_enable(shift_enable),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        serial_in = 0;
        shift_enable = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test 1: Shift with serial input
        shift_enable = 1;
        serial_in = 1; // Shift in 1
        #10;
        if (q !== 4'b0001) $display("FAIL: Expected q = 0001, got q = %b", q);

        serial_in = 0; // Shift in 0
        #10;
        if (q !== 4'b0010) $display("FAIL: Expected q = 0010, got q = %b", q);

        serial_in = 1; // Shift in 1
        #10;
        if (q !== 4'b0101) $display("FAIL: Expected q = 0101, got q = %b", q);

        // Test 2: Disable shifting
        shift_enable = 0;
        #10;
        if (q !== 4'b0101) $display("FAIL: Expected q = 0101, got q = %b", q);

        // Test 3: Reset the register
        reset = 1;
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 0000, got q = %b", q);

        // Test 4: Shift after reset
        reset = 0;
        shift_enable = 1;
        serial_in = 1; // Shift in 1
        #10;
        if (q !== 4'b0001) $display("FAIL: Expected q = 0001, got q = %b", q);

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule