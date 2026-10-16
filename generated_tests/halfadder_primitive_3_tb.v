`timescale 1ns/1ps

module tb_halfadder_primitive;

    // Inputs
    reg a_in;
    reg b_in;

    // Outputs
    wire s_out;
    wire c_out;

    // Instantiate the Unit Under Test (UUT)
    halfadder_primitive uut (
        .s_out(s_out),
        .c_out(c_out),
        .a_in(a_in),
        .b_in(b_in)
    );

    initial begin
        // Test case 1: a_in = 0, b_in = 0
        a_in = 0; b_in = 0;
        #10;
        if (s_out !== 0 || c_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (s_out !== 1 || c_out !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (s_out !== 1 || c_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (s_out !== 0 || c_out !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule