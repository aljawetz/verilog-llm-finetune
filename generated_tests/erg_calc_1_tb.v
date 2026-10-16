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
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        keyb_data = 1;
        keyb_clk = 1;

        // Release reset
        #10 reset = 0;

        // Test sequence for adding 2 + 3
        // Input 2
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '2'
        keyb_data = 0; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '2'

        // Input +
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '+'
        keyb_data = 0; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '+'

        // Input 3
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '3'
        keyb_data = 0; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '3'

        // Input =
        keyb_data = 1; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '='
        keyb_data = 0; keyb_clk = 0; #10; keyb_clk = 1; #10; // Send keyb_data for '='

        // Check results
        if (disp_n1 !== 7'b0100100) $display("FAIL: disp_n1 should show '2'");
        if (disp_op !== 7'b0111001) $display("FAIL: disp_op should show '+'");
        if (disp_n2 !== 7'b0010000) $display("FAIL: disp_n2 should show '3'");
        if (disp_eq !== 7'b0110111) $display("FAIL: disp_eq should show '='");
        if (disp_r1 !== 7'b0000000) $display("FAIL: disp_r1 should show '0'");
        if (disp_r0 !== 7'b0000001) $display("FAIL: disp_r0 should show '5'");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule