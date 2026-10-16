`timescale 1ns/1ps

module tb_Deco3x8;

reg x, y, z, en;
wire d0, d1, d2, d3, d4, d5, d6, d7;

// Instantiate the module under test (uut)
Deco3x8 uut (
    .x(x),
    .y(y),
    .z(z),
    .en(en),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
);

initial begin
    // Test all combinations of x, y, z
    en = 1; // Enable signal, though not used in the implementation
    x = 0; y = 0; z = 0; #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (0, 0, 0) failed");

    x = 0; y = 0; z = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b1 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (0, 0, 1) failed");

    x = 0; y = 1; z = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b1 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (0, 1, 0) failed");

    x = 0; y = 1; z = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b1 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (0, 1, 1) failed");

    x = 1; y = 0; z = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b1 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (1, 0, 0) failed");

    x = 1; y = 0; z = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b1 || d6 !== 1'b0 || d7 !== 1'b0) 
        $display("FAIL: Test case (1, 0, 1) failed");

    x = 1; y = 1; z = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b1 || d7 !== 1'b0) 
        $display("FAIL: Test case (1, 1, 0) failed");

    x = 1; y = 1; z = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0 || 
        d4 !== 1'b0 || d5 !== 1'b0 || d6 !== 1'b0 || d7 !== 1'b1) 
        $display("FAIL: Test case (1, 1, 1) failed");

    $display("PASS");
    $finish;
end

endmodule