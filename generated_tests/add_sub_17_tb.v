`timescale 1ns/1ps

module tb_add_sub;

reg a;
reg b;
reg mode;
wire s_d;
wire cout;

// Instantiate the module under test (uut)
add_sub uut (
    .a(a),
    .b(b),
    .mode(mode),
    .s_d(s_d),
    .cout(cout)
);

initial begin
    // Test Case 1: Addition (mode = 0)
    a = 0; b = 0; mode = 0; #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test Case 1 failed");

    a = 0; b = 1; mode = 0; #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test Case 2 failed");

    a = 1; b = 0; mode = 0; #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test Case 3 failed");

    a = 1; b = 1; mode = 0; #10;
    if (s_d !== 0 || cout !== 1) $display("FAIL: Test Case 4 failed");

    // Test Case 2: Subtraction (mode = 1)
    a = 0; b = 0; mode = 1; #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test Case 5 failed");

    a = 0; b = 1; mode = 1; #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test Case 6 failed");

    a = 1; b = 0; mode = 1; #10;
    if (s_d !== 1 || cout !== 0) $display("FAIL: Test Case 7 failed");

    a = 1; b = 1; mode = 1; #10;
    if (s_d !== 0 || cout !== 0) $display("FAIL: Test Case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule