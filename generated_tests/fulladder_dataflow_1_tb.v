`timescale 1ns/1ps

module tb_fulladder_dataflow;

    // Inputs
    reg a_in;
    reg b_in;
    reg c_in;

    // Outputs
    wire s_out;
    wire c_out;

    // Instantiate the Unit Under Test (UUT)
    fulladder_dataflow uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .s_out(s_out),
        .c_out(c_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry = 0
        a_in = 0; b_in = 0; c_in = 0;
        #10;
        if (s_out !== 0 || c_out !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, carry = 0
        a_in = 0; b_in = 0; c_in = 1;
        #10;
        if (s_out !== 1 || c_out !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0 = 1, carry = 0
        a_in = 0; b_in = 1; c_in = 0;
        #10;
        if (s_out !== 1 || c_out !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 1 + 0 + 0 = 1, carry = 0
        a_in = 1; b_in = 0; c_in = 0;
        #10;
        if (s_out !== 1 || c_out !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 1 + 0 = 0, carry = 1
        a_in = 1; b_in = 1; c_in = 0;
        #10;
        if (s_out !== 0 || c_out !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1 = 0, carry = 1
        a_in = 1; b_in = 0; c_in = 1;
        #10;
        if (s_out !== 0 || c_out !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 0 + 1 + 1 = 0, carry = 1
        a_in = 0; b_in = 1; c_in = 1;
        #10;
        if (s_out !== 0 || c_out !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1 = 1, carry = 1
        a_in = 1; b_in = 1; c_in = 1;
        #10;
        if (s_out !== 1 || c_out !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule