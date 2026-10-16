`timescale 1ns/1ps

module tb_fa;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire sum;
    wire ca;

    // Instantiate the Unit Under Test (UUT)
    fa uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .ca(ca)
    );

    initial begin
        // Test case 1: a=0, b=0, c=0
        a = 0; b = 0; c = 0;
        #10;
        if (sum !== 0 || ca !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a=0, b=0, c=1
        a = 0; b = 0; c = 1;
        #10;
        if (sum !== 1 || ca !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, c=0
        a = 0; b = 1; c = 0;
        #10;
        if (sum !== 1 || ca !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, c=1
        a = 0; b = 1; c = 1;
        #10;
        if (sum !== 0 || ca !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: a=1, b=0, c=0
        a = 1; b = 0; c = 0;
        #10;
        if (sum !== 1 || ca !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=0, c=1
        a = 1; b = 0; c = 1;
        #10;
        if (sum !== 0 || ca !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, c=0
        a = 1; b = 1; c = 0;
        #10;
        if (sum !== 0 || ca !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: a=1, b=1, c=1
        a = 1; b = 1; c = 1;
        #10;
        if (sum !== 1 || ca !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule