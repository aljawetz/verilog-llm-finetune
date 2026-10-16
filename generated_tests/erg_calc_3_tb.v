`timescale 1ns/1ps

module tb_erg_calc;
    reg clk;
    reg reset;
    reg keyb_data;
    reg keyb_clk;
    wire [6:0] disp_n1;
    wire [6:0] disp_op;
    wire [6:0] disp_n2;
    wire [6:0] disp_eq;
    wire [6:0] disp_r1;
    wire [6:0] disp_r0;

    // Instantiate the Unit Under Test (UUT)
    erg_calc uut (
        .clk(clk),
        .reset(reset),
        .keyb_data(keyb_data),
        .keyb_clk(keyb_clk),
        .disp_n1(disp_n1),
        .disp_op(disp_op),
        .disp_n2(disp_n2),
        .disp_eq(disp_eq),
        .disp_r1(disp_r1),
        .disp_r0(disp_r0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        keyb_data = 1;
        keyb_clk = 1;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test input: 1 + 2 =
        // Simulate key presses
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press '1'
        keyb_data = 0; keyb_clk = 0; #10; keyb_clk = 1; // Press '2'
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press '+'
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press '2'
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press '='

        // Check outputs
        #10;
        if (disp_n1 !== 7'b1111001) $display("FAIL: disp_n1 incorrect for input 1");
        if (disp_op !== 7'b0111001) $display("FAIL: disp_op incorrect for '+'");
        if (disp_n2 !== 7'b0100100) $display("FAIL: disp_n2 incorrect for input 2");
        if (disp_eq !== 7'b0110111) $display("FAIL: disp_eq incorrect for '='");
        if (disp_r1 !== 7'b0000000) $display("FAIL: disp_r1 incorrect for result 3");
        if (disp_r0 !== 7'b0000011) $display("FAIL: disp_r0 incorrect for result 3");

        // Reset and test error handling
        reset = 1; #10; reset = 0; #10;

        // Test invalid input
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press 'A' (invalid)
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; // Press '='

        // Check error outputs
        #10;
        if (disp_n1 !== 7'b0000110) $display("FAIL: disp_n1 should show error for invalid input");
        if (disp_op !== 7'b1111111) $display("FAIL: disp_op should be empty for invalid input");
        if (disp_n2 !== 7'b1111111) $display("FAIL: disp_n2 should be empty for invalid input");
        if (disp_eq !== 7'b1111111) $display("FAIL: disp_eq should be empty for invalid input");
        if (disp_r1 !== 7'b1111111) $display("FAIL: disp_r1 should be empty for invalid input");
        if (disp_r0 !== 7'b1111111) $display("FAIL: disp_r0 should be empty for invalid input");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule