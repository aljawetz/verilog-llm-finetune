`timescale 1ns/1ps

module tb_bcd_ex3;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // Outputs
    wire w;
    wire x;
    wire y;
    wire z;

    // Instantiate the Unit Under Test (UUT)
    bcd_ex3 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Test case 1: a=0, b=0, c=0, d=0
        a = 0; b = 0; c = 0; d = 0;
        #10;
        if (w !== 0 || x !== 1 || y !== 1 || z !== 1) $display("FAIL: Test case 1 failed");

        // Test case 2: a=1, b=0, c=0, d=0
        a = 1; b = 0; c = 0; d = 0;
        #10;
        if (w !== 1 || x !== 1 || y !== 1 || z !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, c=1, d=0
        a = 0; b = 1; c = 1; d = 0;
        #10;
        if (w !== 1 || x !== 0 || y !== 0 || z !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, c=0, d=1
        a = 0; b = 1; c = 0; d = 1;
        #10;
        if (w !== 1 || x !== 0 || y !== 1 || z !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: a=0, b=0, c=1, d=1
        a = 0; b = 0; c = 1; d = 1;
        #10;
        if (w !== 0 || x !== 1 || y !== 1 || z !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=1, c=1, d=1
        a = 1; b = 1; c = 1; d = 1;
        #10;
        if (w !== 1 || x !== 0 || y !== 1 || z !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, c=0, d=0
        a = 1; b = 1; c = 0; d = 0;
        #10;
        if (w !== 1 || x !== 1 || y !== 1 || z !== 1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule