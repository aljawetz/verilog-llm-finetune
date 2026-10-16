`timescale 1ns/1ps

module tb_FA_beh;

    reg a, b, cin;
    wire s, cout;

    // Instantiate the Unit Under Test (UUT)
    FA_beh uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Test Case 1: 0 + 0 + 0 = 0, cout = 0
        a = 0; b = 0; cin = 0;
        #10;
        if (s !== 0 || cout !== 0) $display("FAIL: Test Case 1 failed");

        // Test Case 2: 0 + 0 + 1 = 1, cout = 0
        a = 0; b = 0; cin = 1;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test Case 2 failed");

        // Test Case 3: 0 + 1 + 0 = 1, cout = 0
        a = 0; b = 1; cin = 0;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test Case 3 failed");

        // Test Case 4: 0 + 1 + 1 = 0, cout = 1
        a = 0; b = 1; cin = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test Case 4 failed");

        // Test Case 5: 1 + 0 + 0 = 1, cout = 0
        a = 1; b = 0; cin = 0;
        #10;
        if (s !== 1 || cout !== 0) $display("FAIL: Test Case 5 failed");

        // Test Case 6: 1 + 0 + 1 = 0, cout = 1
        a = 1; b = 0; cin = 1;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test Case 6 failed");

        // Test Case 7: 1 + 1 + 0 = 0, cout = 1
        a = 1; b = 1; cin = 0;
        #10;
        if (s !== 0 || cout !== 1) $display("FAIL: Test Case 7 failed");

        // Test Case 8: 1 + 1 + 1 = 1, cout = 1
        a = 1; b = 1; cin = 1;
        #10;
        if (s !== 1 || cout !== 1) $display("FAIL: Test Case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule