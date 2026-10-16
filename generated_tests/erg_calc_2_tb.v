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

        // Test: Input 1 + 2 = 3
        send_key(1); // Key for '1'
        send_key(10); // Key for '+'
        send_key(2); // Key for '2'
        send_key(12); // Key for '='

        // Check outputs
        #10;
        if (disp_n1 !== 7'b1111001) $display("FAIL: disp_n1 should show '1'");
        if (disp_op !== 7'b0111001) $display("FAIL: disp_op should show '+'");
        if (disp_n2 !== 7'b0100100) $display("FAIL: disp_n2 should show '2'");
        if (disp_eq !== 7'b0110111) $display("FAIL: disp_eq should show '='");
        if (disp_r1 !== 7'b0110000) $display("FAIL: disp_r1 should show '3'");
        if (disp_r0 !== 7'b0000000) $display("FAIL: disp_r0 should show '0'");

        // Test: Input 4 - 1 = 3
        reset = 1; #10; reset = 0; #10;
        send_key(4); // Key for '4'
        send_key(11); // Key for '-'
        send_key(1); // Key for '1'
        send_key(12); // Key for '='

        // Check outputs
        #10;
        if (disp_n1 !== 7'b0011001) $display("FAIL: disp_n1 should show '4'");
        if (disp_op !== 7'b0111111) $display("FAIL: disp_op should show '-'");
        if (disp_n2 !== 7'b1111001) $display("FAIL: disp_n2 should show '1'");
        if (disp_eq !== 7'b0110111) $display("FAIL: disp_eq should show '='");
        if (disp_r1 !== 7'b0110000) $display("FAIL: disp_r1 should show '3'");
        if (disp_r0 !== 7'b0000000) $display("FAIL: disp_r0 should show '0'");

        // Test: Invalid input
        reset = 1; #10; reset = 0; #10;
        send_key(15); // Invalid key
        send_key(12); // Key for '='

        // Check error handling
        #10;
        if (disp_n1 !== 7'b0000110) $display("FAIL: disp_n1 should show 'E' for error");

        // If all tests pass
        $display("PASS");
        $finish;
    end

    // Task to simulate keyboard input
    task send_key(input [3:0] key);
        begin
            keyb_data = 0; // Start bit
            keyb_clk = 0; #10;
            keyb_data = key[0]; keyb_clk = 1; #10;
            keyb_data = key[1]; keyb_clk = 0; #10;
            keyb_data = key[2]; keyb_clk = 1; #10;
            keyb_data = key[3]; keyb_clk = 0; #10;
            keyb_data = 1; // Stop bit
            keyb_clk = 1; #10;
        end
    endtask
endmodule