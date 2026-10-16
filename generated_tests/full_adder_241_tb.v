`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Outputs
    wire s;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .c(c),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        a = 0; b = 0; c = 0;
        #10;
        if (s !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, cout = 0
        a = 0; b = 0; c = 1;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 1 = 0, cout = 1
        a = 0; b = 1; c = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: 1 + 0 + 1 = 0, cout = 1
        a = 1; b = 0; c = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 1 + 0 = 0, cout = 1
        a = 1; b = 1; c = 0;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 1 + 1 = 1, cout = 1
        a = 1; b = 1; c = 1;
        #10;
        if (s !== 1 || cout !== 1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule