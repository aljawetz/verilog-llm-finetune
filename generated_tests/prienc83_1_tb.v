`timescale 1ns/1ps

module tb_prienc83;

reg i0, i1, i2, i3, i4, i5, i6, i7;
wire o0, o1, o2, valid;

// Instantiate the module under test
prienc83 uut (
    .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
    .o0(o0), .o1(o1), .o2(o2), .valid(valid)
);

initial begin
    // Test case 1: Only i0 is active
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || valid !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: Only i3 is active
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 1 || valid !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: Multiple inputs active, highest priority is i5
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 1; i6 = 1; i7 = 0;
    #10;
    if (o0 !== 0 || o1 !== 1 || o2 !== 1 || valid !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: All inputs active
    i0 = 1; i1 = 1; i2 = 1; i3 = 1; i4 = 1; i5 = 1; i6 = 1; i7 = 1;
    #10;
    if (o0 !== 1 || o1 !== 1 || o2 !== 1 || valid !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: Only i7 is active
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 1;
    #10;
    if (o0 !== 1 || o1 !== 1 || o2 !== 1 || valid !== 1) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule