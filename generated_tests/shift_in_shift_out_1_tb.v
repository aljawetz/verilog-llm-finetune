`timescale 1ns/1ps

module tb_shift_in_shift_out;

    reg in;
    reg rst_n;
    reg clk;
    wire out;

    // Instantiate the module under test (uut)
    shift_in_shift_out uut (
        .in(in),
        .rst_n(rst_n),
        .clk(clk),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in = 0;
        rst_n = 0; // Active low reset
        #10;

        // Release reset
        rst_n = 1;
        #10;

        // Test shifting in data
        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        in = 0; #10; // Shift in 0
        if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

        in = 0; #10; // Shift in 0
        if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

        in = 1; #10; // Shift in 1
        if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

        // Reset the shift register
        rst_n = 0; #10; // Assert reset
        rst_n = 1; #10; // Release reset

        // Check output after reset
        if (out !== 0) $display("FAIL: Expected out = 0 after reset, got %b", out);

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule