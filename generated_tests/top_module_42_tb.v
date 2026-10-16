`timescale 1ns/1ps

module tb_top_module;

    reg a, b, cin;
    wire cout, sum;

    // Instantiate the module under test
    top_module uut (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        // Test case 1: a=0, b=0, cin=0
        a = 0; b = 0; cin = 0;
        #10;
        if (cout !== 0 || sum !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a=0, b=0, cin=1
        a = 0; b = 0; cin = 1;
        #10;
        if (cout !== 0 || sum !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, cin=0
        a = 0; b = 1; cin = 0;
        #10;
        if (cout !== 0 || sum !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, cin=1
        a = 0; b = 1; cin = 1;
        #10;
        if (cout !== 1 || sum !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: a=1, b=0, cin=0
        a = 1; b = 0; cin = 0;
        #10;
        if (cout !== 0 || sum !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=0, cin=1
        a = 1; b = 0; cin = 1;
        #10;
        if (cout !== 1 || sum !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, cin=0
        a = 1; b = 1; cin = 0;
        #10;
        if (cout !== 1 || sum !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: a=1, b=1, cin=1
        a = 1; b = 1; cin = 1;
        #10;
        if (cout !== 1 || sum !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule