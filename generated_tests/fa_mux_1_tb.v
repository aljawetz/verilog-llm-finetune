`timescale 1ns/1ps

module tb_fa_mux;

reg a, b, cin;
wire sum, cout;

// Instantiate the module under test (uut)
fa_mux uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    // Test case 1: a=0, b=0, cin=0
    a = 0; b = 0; cin = 0; #10;
    if (sum !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, cin=1
    a = 0; b = 0; cin = 1; #10;
    if (sum !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, cin=0
    a = 0; b = 1; cin = 0; #10;
    if (sum !== 0 || cout !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, cin=1
    a = 0; b = 1; cin = 1; #10;
    if (sum !== 1 || cout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, cin=0
    a = 1; b = 0; cin = 0; #10;
    if (sum !== 0 || cout !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, cin=1
    a = 1; b = 0; cin = 1; #10;
    if (sum !== 1 || cout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, cin=0
    a = 1; b = 1; cin = 0; #10;
    if (sum !== 1 || cout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, cin=1
    a = 1; b = 1; cin = 1; #10;
    if (sum !== 0 || cout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule