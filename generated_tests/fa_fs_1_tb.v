`timescale 1ns/1ps

module tb_fa_fs;

    reg a, b, cin, u;
    wire s, cout;

    // Instantiate the module under test (uut)
    fa_fs uut (
        .a(a),
        .b(b),
        .cin(cin),
        .u(u),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Test case 1: u = 0, a = 0, b = 0, cin = 0
        a = 0; b = 0; cin = 0; u = 0;
        #10;
        if (s !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: u = 0, a = 0, b = 0, cin = 1
        a = 0; b = 0; cin = 1; u = 0;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: u = 0, a = 0, b = 1, cin = 0
        a = 0; b = 1; cin = 0; u = 0;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: u = 0, a = 1, b = 1, cin = 1
        a = 1; b = 1; cin = 1; u = 0;
        #10;
        if (s !== 1 || cout !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: u = 1, a = 0, b = 1, cin = 0
        a = 0; b = 1; cin = 0; u = 1;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: u = 1, a = 1, b = 0, cin = 1
        a = 1; b = 0; cin = 1; u = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: u = 1, a = 1, b = 1, cin = 1
        a = 1; b = 1; cin = 1; u = 1;
        #10;
        if (s !== 1 || cout !== 1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule