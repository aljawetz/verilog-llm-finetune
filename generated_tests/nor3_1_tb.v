`timescale 1ns/1ps

module tb_nor3;

    reg in1, in2, in3;
    wire out;

    // Instantiate the module under test (uut)
    nor3 uut (
        .out(out),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );

    initial begin
        // Test case 1: All inputs are 0
        in1 = 0; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed (expected out = 1, got out = %b)", out);

        // Test case 2: One input is 1
        in1 = 1; in2 = 0; in3 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 2 failed (expected out = 0, got out = %b)", out);

        // Test case 3: Two inputs are 1
        in1 = 1; in2 = 1; in3 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 3 failed (expected out = 0, got out = %b)", out);

        // Test case 4: All inputs are 1
        in1 = 1; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 4 failed (expected out = 0, got out = %b)", out);

        // Test case 5: Two inputs are 1, one is 0
        in1 = 0; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed (expected out = 0, got out = %b)", out);

        // Test case 6: Two inputs are 0, one is 1
        in1 = 0; in2 = 0; in3 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 6 failed (expected out = 0, got out = %b)", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule