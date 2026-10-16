`timescale 1ns/1ps

module tb_full_subtractor;

reg a, b, c;
wire difference, borrow;

// Instantiate the full subtractor
full_subtractor uut (
    .a(a),
    .b(b),
    .c(c),
    .difference(difference),
    .borrow(borrow)
);

initial begin
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0;
    #10;
    if (difference !== 0 || borrow !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1;
    #10;
    if (difference !== 1 || borrow !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0;
    #10;
    if (difference !== 1 || borrow !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1;
    #10;
    if (difference !== 0 || borrow !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0;
    #10;
    if (difference !== 1 || borrow !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1;
    #10;
    if (difference !== 0 || borrow !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0;
    #10;
    if (difference !== 0 || borrow !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1;
    #10;
    if (difference !== 1 || borrow !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule