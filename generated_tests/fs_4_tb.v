`timescale 1ns/1ps

module tb_fs;

reg a, b, bin;
wire d, bo;

// Instantiate the full subtractor
fs uut (
    .a(a),
    .b(b),
    .bin(bin),
    .d(d),
    .bo(bo)
);

initial begin
    // Test case 1: a=0, b=0, bin=0
    a = 0; b = 0; bin = 0;
    #10;
    if (d !== 0 || bo !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, bin=1
    a = 0; b = 0; bin = 1;
    #10;
    if (d !== 1 || bo !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, bin=0
    a = 0; b = 1; bin = 0;
    #10;
    if (d !== 1 || bo !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, bin=1
    a = 0; b = 1; bin = 1;
    #10;
    if (d !== 0 || bo !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, bin=0
    a = 1; b = 0; bin = 0;
    #10;
    if (d !== 1 || bo !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, bin=1
    a = 1; b = 0; bin = 1;
    #10;
    if (d !== 0 || bo !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, bin=0
    a = 1; b = 1; bin = 0;
    #10;
    if (d !== 0 || bo !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, bin=1
    a = 1; b = 1; bin = 1;
    #10;
    if (d !== 1 || bo !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule