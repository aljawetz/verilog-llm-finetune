`timescale 1ns/1ps

module tb_structural_modelling;

    reg a, b, c_in;
    wire s, c_out;

    // Instantiate the module under test (uut)
    structural_modelling uut (
        .s(s),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    initial begin
        // Test case 1: a=0, b=0, c_in=0
        a = 0; b = 0; c_in = 0;
        #10;
        if (s !== 0 || c_out !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a=0, b=0, c_in=1
        a = 0; b = 0; c_in = 1;
        #10;
        if (s !== 1 || c_out !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, c_in=0
        a = 0; b = 1; c_in = 0;
        #10;
        if (s !== 1 || c_out !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, c_in=1
        a = 0; b = 1; c_in = 1;
        #10;
        if (s !== 0 || c_out !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: a=1, b=0, c_in=0
        a = 1; b = 0; c_in = 0;
        #10;
        if (s !== 1 || c_out !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=0, c_in=1
        a = 1; b = 0; c_in = 1;
        #10;
        if (s !== 0 || c_out !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, c_in=0
        a = 1; b = 1; c_in = 0;
        #10;
        if (s !== 0 || c_out !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: a=1, b=1, c_in=1
        a = 1; b = 1; c_in = 1;
        #10;
        if (s !== 1 || c_out !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule