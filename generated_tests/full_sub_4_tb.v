`timescale 1ns/1ps

module tb_full_sub;

    reg a;
    reg b;
    reg cin;
    wire bor;
    wire diff;

    // Instantiate the full_sub module
    full_sub uut (
        .a(a),
        .b(b),
        .cin(cin),
        .bor(bor),
        .diff(diff)
    );

    initial begin
        // Test case 1: a=0, b=0, cin=0
        a = 0; b = 0; cin = 0;
        #10;
        if (bor !== 0 || diff !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a=0, b=0, cin=1
        a = 0; b = 0; cin = 1;
        #10;
        if (bor !== 1 || diff !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a=0, b=1, cin=0
        a = 0; b = 1; cin = 0;
        #10;
        if (bor !== 1 || diff !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: a=0, b=1, cin=1
        a = 0; b = 1; cin = 1;
        #10;
        if (bor !== 1 || diff !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: a=1, b=0, cin=0
        a = 1; b = 0; cin = 0;
        #10;
        if (bor !== 0 || diff !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: a=1, b=0, cin=1
        a = 1; b = 0; cin = 1;
        #10;
        if (bor !== 0 || diff !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: a=1, b=1, cin=0
        a = 1; b = 1; cin = 0;
        #10;
        if (bor !== 1 || diff !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: a=1, b=1, cin=1
        a = 1; b = 1; cin = 1;
        #10;
        if (bor !== 1 || diff !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule