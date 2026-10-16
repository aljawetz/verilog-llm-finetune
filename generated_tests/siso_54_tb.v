`timescale 1ns/1ps

module tb_siso;

    reg clk;
    reg clear;
    reg s_in;
    wire s_out;

    // Instantiate the module under test (uut)
    siso uut (
        .clk(clk),
        .clear(clear),
        .s_in(s_in),
        .s_out(s_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        clear = 1;
        s_in = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        clear = 0;

        // Test shifting in values
        s_in = 1; #10; // Shift in 1
        if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

        s_in = 0; #10; // Shift in 0
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        s_in = 1; #10; // Shift in 1
        if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

        s_in = 1; #10; // Shift in 1
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        s_in = 0; #10; // Shift in 0
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        // Clear the register
        clear = 1; #10;
        clear = 0; #10;

        // Check if the register is cleared
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after clear, got %b", s_out);

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule