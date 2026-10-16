`timescale 1ns/1ps

module tb_siso;
    reg clk;
    reg s_in;
    reg rst;
    wire s_out;

    // Instantiate the module under test (uut)
    siso uut (
        .clk(clk),
        .s_in(s_in),
        .rst(rst),
        .s_out(s_out)
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
        s_in = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;

        // Test shifting in bits
        // Shift in 1, 1, 1, 1
        s_in = 1; #10;
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after first shift");

        s_in = 1; #10;
        if (s_out !== 1) $display("FAIL: Expected s_out = 1 after second shift");

        s_in = 1; #10;
        if (s_out !== 1) $display("FAIL: Expected s_out = 1 after third shift");

        s_in = 1; #10;
        if (s_out !== 1) $display("FAIL: Expected s_out = 1 after fourth shift");

        // Reset the register
        rst = 1; #10;
        rst = 0; #10;
        if (s_out !== 1) $display("FAIL: Expected s_out = 1 after reset and shift");

        // Shift in 0, 0, 0, 0
        s_in = 0; #10;
        if (s_out !== 1) $display("FAIL: Expected s_out = 1 after first shift with 0");

        s_in = 0; #10;
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after second shift with 0");

        s_in = 0; #10;
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after third shift with 0");

        s_in = 0; #10;
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after fourth shift with 0");

        // Final check
        $display("PASS");
        $finish;
    end
endmodule