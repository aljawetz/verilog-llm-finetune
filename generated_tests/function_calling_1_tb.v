`timescale 1ns/1ps

module tb_function_calling;

reg a, b, c, d, e;
wire f;

// Instantiate the module under test
function_calling uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f)
);

initial begin
    // Test case 1: (1 + 2) + (3 - 1) = 5, e = 10, f should be 10
    a = 1; b = 2; c = 3; d = 1; e = 10;
    #10;
    if (f !== 10) $display("FAIL: Test case 1 failed, expected f = 10, got f = %d", f);

    // Test case 2: (0 + 0) + (0 - 0) = 0, e = 5, f should be 0
    a = 0; b = 0; c = 0; d = 0; e = 5;
    #10;
    if (f !== 0) $display("FAIL: Test case 2 failed, expected f = 0, got f = %d", f);

    // Test case 3: (2 + 3) + (4 - 2) = 7, e = 15, f should be 15
    a = 2; b = 3; c = 4; d = 2; e = 15;
    #10;
    if (f !== 15) $display("FAIL: Test case 3 failed, expected f = 15, got f = %d", f);

    // Test case 4: (1 + 1) + (2 - 3) = 0, e = 20, f should be 0
    a = 1; b = 1; c = 2; d = 3; e = 20;
    #10;
    if (f !== 0) $display("FAIL: Test case 4 failed, expected f = 0, got f = %d", f);

    // Test case 5: (5 + 5) + (10 - 5) = 15, e = 25, f should be 25
    a = 5; b = 5; c = 10; d = 5; e = 25;
    #10;
    if (f !== 25) $display("FAIL: Test case 5 failed, expected f = 25, got f = %d", f);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule