`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire cout;
    wire sum;

    // Instantiate the half_adder module
    half_adder uut (
        .a(a),
        .b(b),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (cout !== 0 || sum !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (cout !== 0 || sum !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (cout !== 0 || sum !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (cout !== 1 || sum !== 0) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule