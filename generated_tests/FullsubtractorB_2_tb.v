`timescale 1ns/1ps

module tb_FullsubtractorB;

reg P, Q, Bin;
wire D, Bout;

// Instantiate the FullsubtractorB module
FullsubtractorB uut (
    .D(D),
    .Bout(Bout),
    .P(P),
    .Q(Q),
    .Bin(Bin)
);

initial begin
    // Test case 1: P=0, Q=0, Bin=0
    P = 0; Q = 0; Bin = 0;
    #10;
    if (D !== 0 || Bout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: P=0, Q=0, Bin=1
    P = 0; Q = 0; Bin = 1;
    #10;
    if (D !== 1 || Bout !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: P=0, Q=1, Bin=0
    P = 0; Q = 1; Bin = 0;
    #10;
    if (D !== 1 || Bout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: P=0, Q=1, Bin=1
    P = 0; Q = 1; Bin = 1;
    #10;
    if (D !== 0 || Bout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: P=1, Q=0, Bin=0
    P = 1; Q = 0; Bin = 0;
    #10;
    if (D !== 1 || Bout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: P=1, Q=0, Bin=1
    P = 1; Q = 0; Bin = 1;
    #10;
    if (D !== 0 || Bout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: P=1, Q=1, Bin=0
    P = 1; Q = 1; Bin = 0;
    #10;
    if (D !== 0 || Bout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: P=1, Q=1, Bin=1
    P = 1; Q = 1; Bin = 1;
    #10;
    if (D !== 1 || Bout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule