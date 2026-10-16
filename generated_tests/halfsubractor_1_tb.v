`timescale 1ns/1ps

module tb_halfsubractor;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire diff;
    wire bout;

    // Instantiate the Unit Under Test (UUT)
    halfsubractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (diff !== 0 || bout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (diff !== 1 || bout !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (diff !== 1 || bout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (diff !== 0 || bout !== 0) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule