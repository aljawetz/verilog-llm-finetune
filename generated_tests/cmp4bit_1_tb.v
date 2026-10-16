`timescale 1ns/1ps

module tb_cmp4bit;

reg [3:0] a;
reg [3:0] b;
wire gt;
wire eq;
wire lt;

// Instantiate the module under test (uut)
cmp4bit uut (
    .a(a),
    .b(b),
    .gt(gt),
    .eq(eq),
    .lt(lt)
);

// Test procedure
initial begin
    // Test case 1: a = 4'b0000, b = 4'b0000 (equal)
    a = 4'b0000; b = 4'b0000;
    #10;
    if (gt !== 0 || eq !== 1 || lt !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 4'b0001, b = 4'b0000 (greater)
    a = 4'b0001; b = 4'b0000;
    #10;
    if (gt !== 1 || eq !== 0 || lt !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 4'b0000, b = 4'b0001 (less)
    a = 4'b0000; b = 4'b0001;
    #10;
    if (gt !== 0 || eq !== 0 || lt !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 4'b1111, b = 4'b1111 (equal)
    a = 4'b1111; b = 4'b1111;
    #10;
    if (gt !== 0 || eq !== 1 || lt !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: a = 4'b1110, b = 4'b1111 (less)
    a = 4'b1110; b = 4'b1111;
    #10;
    if (gt !== 0 || eq !== 0 || lt !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: a = 4'b1111, b = 4'b1110 (greater)
    a = 4'b1111; b = 4'b1110;
    #10;
    if (gt !== 1 || eq !== 0 || lt !== 0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule