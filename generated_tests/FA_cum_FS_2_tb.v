`timescale 1ns/1ps

module tb_FA_cum_FS;

reg a, b, c, mode;
wire sum, carry, differ, barrow;

// Instantiate the module under test
FA_cum_FS uut (
    .a(a),
    .b(b),
    .c(c),
    .mode(mode),
    .sum(sum),
    .carry(carry),
    .differ(differ),
    .barrow(barrow)
);

initial begin
    // Test Full Adder (mode = 0)
    mode = 0;

    // Test case 1: 0 + 0 + 0
    a = 0; b = 0; c = 0;
    #10;
    if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1
    a = 0; b = 0; c = 1;
    #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0
    a = 0; b = 1; c = 0;
    #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1
    a = 0; b = 1; c = 1;
    #10;
    if (sum !== 0 || carry !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0
    a = 1; b = 0; c = 0;
    #10;
    if (sum !== 1 || carry !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1
    a = 1; b = 0; c = 1;
    #10;
    if (sum !== 0 || carry !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0
    a = 1; b = 1; c = 0;
    #10;
    if (sum !== 0 || carry !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1
    a = 1; b = 1; c = 1;
    #10;
    if (sum !== 1 || carry !== 1) $display("FAIL: Test case 8 failed");

    // Test Full Subtractor (mode = 1)
    mode = 1;

    // Test case 1: 0 - 0 - 0
    a = 0; b = 0; c = 0;
    #10;
    if (differ !== 0 || barrow !== 0) $display("FAIL: Test case 1 FS failed");

    // Test case 2: 0 - 0 - 1
    a = 0; b = 0; c = 1;
    #10;
    if (differ !== 1 || barrow !== 1) $display("FAIL: Test case 2 FS failed");

    // Test case 3: 0 - 1 - 0
    a = 0; b = 1; c = 0;
    #10;
    if (differ !== 1 || barrow !== 1) $display("FAIL: Test case 3 FS failed");

    // Test case 4: 0 - 1 - 1
    a = 0; b = 1; c = 1;
    #10;
    if (differ !== 0 || barrow !== 1) $display("FAIL: Test case 4 FS failed");

    // Test case 5: 1 - 0 - 0
    a = 1; b = 0; c = 0;
    #10;
    if (differ !== 1 || barrow !== 0) $display("FAIL: Test case 5 FS failed");

    // Test case 6: 1 - 0 - 1
    a = 1; b = 0; c = 1;
    #10;
    if (differ !== 0 || barrow !== 0) $display("FAIL: Test case 6 FS failed");

    // Test case 7: 1 - 1 - 0
    a = 1; b = 1; c = 0;
    #10;
    if (differ !== 0 || barrow !== 0) $display("FAIL: Test case 7 FS failed");

    // Test case 8: 1 - 1 - 1
    a = 1; b = 1; c = 1;
    #10;
    if (differ !== 1 || barrow !== 1) $display("FAIL: Test case 8 FS failed");

    $display("PASS");
    $finish;
end

endmodule