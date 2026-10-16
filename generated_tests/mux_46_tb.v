`timescale 1ns/1ps

module tb_mux;

reg s;
reg i1;
reg i0;
wire y;

// Instantiate the module under test (uut)
mux uut (
    .y(y),
    .s(s),
    .i1(i1),
    .i0(i0)
);

initial begin
    // Test case 1: s = 0, i0 = 0, i1 = 0
    s = 0; i0 = 0; i1 = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);

    // Test case 2: s = 0, i0 = 1, i1 = 0
    s = 0; i0 = 1; i1 = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);

    // Test case 3: s = 1, i0 = 0, i1 = 1
    s = 1; i0 = 0; i1 = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y = 1, got y = %b", y);

    // Test case 4: s = 1, i0 = 1, i1 = 0
    s = 1; i0 = 1; i1 = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed, expected y = 0, got y = %b", y);

    // Test case 5: s = 0, i0 = 0, i1 = 1
    s = 0; i0 = 0; i1 = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);

    // Test case 6: s = 1, i0 = 0, i1 = 0
    s = 1; i0 = 0; i1 = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 6 failed, expected y = 0, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule