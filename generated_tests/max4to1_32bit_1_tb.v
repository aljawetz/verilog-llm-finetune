`timescale 1ns/1ps

module tb_max4to1_32bit;

    reg signed [31:0] in0, in1, in2, in3;
    wire signed [31:0] out0;

    // Instantiate the module under test (uut)
    max4to1_32bit uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out0(out0)
    );

    initial begin
        // Test case 1: All inputs are negative
        in0 = -5; in1 = -10; in2 = -3; in3 = -7;
        #10;
        if (out0 !== -3) $display("FAIL: Test case 1 failed, expected -3 but got %d", out0);

        // Test case 2: All inputs are positive
        in0 = 5; in1 = 10; in2 = 3; in3 = 7;
        #10;
        if (out0 !== 10) $display("FAIL: Test case 2 failed, expected 10 but got %d", out0);

        // Test case 3: Mixed inputs
        in0 = -5; in1 = 10; in2 = 3; in3 = -7;
        #10;
        if (out0 !== 10) $display("FAIL: Test case 3 failed, expected 10 but got %d", out0);

        // Test case 4: All inputs are the same
        in0 = 42; in1 = 42; in2 = 42; in3 = 42;
        #10;
        if (out0 !== 42) $display("FAIL: Test case 4 failed, expected 42 but got %d", out0);

        // Test case 5: Zero and negative
        in0 = 0; in1 = -1; in2 = -2; in3 = -3;
        #10;
        if (out0 !== 0) $display("FAIL: Test case 5 failed, expected 0 but got %d", out0);

        // Test case 6: Large positive and negative values
        in0 = 2147483647; in1 = -2147483648; in2 = 100; in3 = 200;
        #10;
        if (out0 !== 2147483647) $display("FAIL: Test case 6 failed, expected 2147483647 but got %d", out0);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule