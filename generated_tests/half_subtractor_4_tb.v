`timescale 1ns/1ps

module tb_half_subtractor;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire Diff;
    wire Barrow;

    // Instantiate the Unit Under Test (UUT)
    half_subtractor uut (
        .a(a),
        .b(b),
        .Diff(Diff),
        .Barrow(Barrow)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (Diff !== 0 || Barrow !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (Diff !== 1 || Barrow !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (Diff !== 1 || Barrow !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (Diff !== 0 || Barrow !== 1) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule