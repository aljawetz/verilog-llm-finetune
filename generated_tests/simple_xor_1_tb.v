`timescale 1ns/1ps

module tb_simple_xor;

    // Inputs
    reg a_in;
    reg b_in;

    // Outputs
    wire y_out;

    // Instantiate the Unit Under Test (UUT)
    simple_xor uut (
        .a_in(a_in),
        .b_in(b_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: a_in = 0, b_in = 0
        a_in = 0; b_in = 0;
        #10;
        if (y_out !== 0) $display("FAIL: Test case 1 failed (0 XOR 0)");

        // Test case 2: a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (y_out !== 1) $display("FAIL: Test case 2 failed (0 XOR 1)");

        // Test case 3: a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (y_out !== 1) $display("FAIL: Test case 3 failed (1 XOR 0)");

        // Test case 4: a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (y_out !== 0) $display("FAIL: Test case 4 failed (1 XOR 1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule