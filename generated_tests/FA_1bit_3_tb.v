`timescale 1ns/1ps

module tb_FA_1bit;

    reg a, b, c;
    wire carry, s;

    // Instantiate the module under test (uut)
    FA_1bit uut (
        .a(a),
        .b(b),
        .c(c),
        .carry(carry),
        .s(s)
    );

    initial begin
        // Test cases
        // Test case 1: a=0, b=0, c=0
        a = 0; b = 0; c = 0; #10;
        if (carry !== 0 || s !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a=0, b=0, c=1
        a = 0; b = 0; c = 1; #10;
        if (carry !== 0 || s !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, c=0
        a = 0; b = 1; c = 0; #10;
        if (carry !== 0 || s !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, c=1
        a = 0; b = 1; c = 1; #10;
        if (carry !== 1 || s !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: a=1, b=0, c=0
        a = 1; b = 0; c = 0; #10;
        if (carry !== 0 || s !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=0, c=1
        a = 1; b = 0; c = 1; #10;
        if (carry !== 1 || s !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, c=0
        a = 1; b = 1; c = 0; #10;
        if (carry !== 1 || s !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: a=1, b=1, c=1
        a = 1; b = 1; c = 1; #10;
        if (carry !== 1 || s !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule