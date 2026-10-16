`timescale 1ns/1ps

module tb_Full_Adder_1;

    // Inputs
    reg a;
    reg b;
    reg c_in;

    // Outputs
    wire c_out;
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    Full_Adder_1 uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .sum(sum)
    );

    initial begin
        // Test cases
        // Test case 1: 0 + 0 + 0
        a = 0; b = 0; c_in = 0;
        #10;
        if (c_out !== 0 || sum !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1
        a = 0; b = 0; c_in = 1;
        #10;
        if (c_out !== 0 || sum !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0
        a = 0; b = 1; c_in = 0;
        #10;
        if (c_out !== 0 || sum !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: 0 + 1 + 1
        a = 0; b = 1; c_in = 1;
        #10;
        if (c_out !== 1 || sum !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 0 + 0
        a = 1; b = 0; c_in = 0;
        #10;
        if (c_out !== 0 || sum !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1
        a = 1; b = 0; c_in = 1;
        #10;
        if (c_out !== 1 || sum !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: 1 + 1 + 0
        a = 1; b = 1; c_in = 0;
        #10;
        if (c_out !== 1 || sum !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1
        a = 1; b = 1; c_in = 1;
        #10;
        if (c_out !== 1 || sum !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule