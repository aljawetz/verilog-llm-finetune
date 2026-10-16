`timescale 1ns/1ps

module tb_partial_product_gen;

reg [15:0] md;
reg zero;
reg double;
reg negation;
wire [16:0] pp;

// Instantiate the module under test (uut)
partial_product_gen uut (
    .md(md),
    .zero(zero),
    .double(double),
    .negation(negation),
    .pp(pp)
);

initial begin
    // Test case 1: Normal multiplication
    md = 16'h0001; // 1
    zero = 0;
    double = 0;
    negation = 0;
    #10;
    if (pp !== 17'h0001) $display("FAIL: Test case 1 failed, expected 0001, got %h", pp);

    // Test case 2: Negation
    md = 16'h0001; // 1
    zero = 0;
    double = 0;
    negation = 1;
    #10;
    if (pp !== 17'hFFFF) $display("FAIL: Test case 2 failed, expected FFFF, got %h", pp);

    // Test case 3: Zeroing
    md = 16'h0001; // 1
    zero = 1;
    double = 0;
    negation = 0;
    #10;
    if (pp !== 17'h0000) $display("FAIL: Test case 3 failed, expected 0000, got %h", pp);

    // Test case 4: Doubling
    md = 16'h0001; // 1
    zero = 0;
    double = 1;
    negation = 0;
    #10;
    if (pp !== 17'h0002) $display("FAIL: Test case 4 failed, expected 0002, got %h", pp);

    // Test case 5: Doubling with negation
    md = 16'h0001; // 1
    zero = 0;
    double = 1;
    negation = 1;
    #10;
    if (pp !== 17'hFFFF) $display("FAIL: Test case 5 failed, expected FFFF, got %h", pp);

    // Test case 6: Edge case with maximum value
    md = 16'hFFFF; // -1
    zero = 0;
    double = 0;
    negation = 0;
    #10;
    if (pp !== 17'hFFFF) $display("FAIL: Test case 6 failed, expected FFFF, got %h", pp);

    // Test case 7: Edge case with zero
    md = 16'hFFFF; // -1
    zero = 1;
    double = 0;
    negation = 0;
    #10;
    if (pp !== 17'h0000) $display("FAIL: Test case 7 failed, expected 0000, got %h", pp);

    // Test case 8: Edge case with negation
    md = 16'hFFFF; // -1
    zero = 0;
    double = 0;
    negation = 1;
    #10;
    if (pp !== 17'h0000) $display("FAIL: Test case 8 failed, expected 0000, got %h", pp);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule