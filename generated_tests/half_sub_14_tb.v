`timescale 1ns/1ps

module tb_half_sub;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire Do;
    wire Bo;

    // Instantiate the Unit Under Test (UUT)
    half_sub uut (
        .a(a),
        .b(b),
        .Do(Do),
        .Bo(Bo)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (Do !== 0 || Bo !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (Do !== 1 || Bo !== 0) $display("FAIL: Test case 2 failed (a=0, b=1)");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (Do !== 1 || Bo !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (Do !== 0 || Bo !== 1) $display("FAIL: Test case 4 failed (a=1, b=1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule