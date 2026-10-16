`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire s;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (s !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule