`timescale 1ns/1ps

module tb_half_sub;

reg a;
reg b;
wire diff;
wire bo;

// Instantiate the half_sub module
half_sub uut (
    .a(a),
    .b(b),
    .diff(diff),
    .bo(bo)
);

initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (diff !== 0 || bo !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (diff !== 1 || bo !== 1) $display("FAIL: Test case 2 failed (a=0, b=1)");

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (diff !== 1 || bo !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (diff !== 0 || bo !== 0) $display("FAIL: Test case 4 failed (a=1, b=1)");

    $display("PASS");
    $finish;
end

endmodule