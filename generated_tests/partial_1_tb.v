`timescale 1ns/1ps

module tb_partial;

reg [15:0] x;
reg x_sel;
reg x2_sel;
reg neg;
wire [16:0] pp;

// Instantiate the module under test
partial uut (
    .x(x),
    .x_sel(x_sel),
    .x2_sel(x2_sel),
    .neg(neg),
    .pp(pp)
);

initial begin
    // Test case 1: x = 0, x_sel = 0, x2_sel = 0, neg = 0
    x = 16'h0000; x_sel = 0; x2_sel = 0; neg = 0;
    #10;
    if (pp !== 17'h00000) $display("FAIL: Test case 1 failed, expected 0, got %h", pp);

    // Test case 2: x = 1, x_sel = 1, x2_sel = 0, neg = 0
    x = 16'h0001; x_sel = 1; x2_sel = 0; neg = 0;
    #10;
    if (pp !== 17'h00001) $display("FAIL: Test case 2 failed, expected 1, got %h", pp);

    // Test case 3: x = 1, x_sel = 0, x2_sel = 1, neg = 0
    x = 16'h0001; x_sel = 0; x2_sel = 1; neg = 0;
    #10;
    if (pp !== 17'h00002) $display("FAIL: Test case 3 failed, expected 2, got %h", pp);

    // Test case 4: x = 1, x_sel = 1, x2_sel = 0, neg = 1
    x = 16'h0001; x_sel = 1; x2_sel = 0; neg = 1;
    #10;
    if (pp !== 17'hFFFFE) $display("FAIL: Test case 4 failed, expected FFFFFE, got %h", pp);

    // Test case 5: x = 1, x_sel = 0, x2_sel = 1, neg = 1
    x = 16'h0001; x_sel = 0; x2_sel = 1; neg = 1;
    #10;
    if (pp !== 17'hFFFFD) $display("FAIL: Test case 5 failed, expected FFFFFD, got %h", pp);

    // Test case 6: x = 16'hFFFF, x_sel = 1, x2_sel = 0, neg = 0
    x = 16'hFFFF; x_sel = 1; x2_sel = 0; neg = 0;
    #10;
    if (pp !== 17'h0000F) $display("FAIL: Test case 6 failed, expected 0F, got %h", pp);

    // Test case 7: x = 16'hFFFF, x_sel = 0, x2_sel = 1, neg = 0
    x = 16'hFFFF; x_sel = 0; x2_sel = 1; neg = 0;
    #10;
    if (pp !== 17'h1FFFF) $display("FAIL: Test case 7 failed, expected 1FFFF, got %h", pp);

    // Test case 8: x = 16'hFFFF, x_sel = 1, x2_sel = 0, neg = 1
    x = 16'hFFFF; x_sel = 1; x2_sel = 0; neg = 1;
    #10;
    if (pp !== 17'hFFFF0) $display("FAIL: Test case 8 failed, expected FFFFF0, got %h", pp);

    // Test case 9: x = 16'hFFFF, x_sel = 0, x2_sel = 1, neg = 1
    x = 16'hFFFF; x_sel = 0; x2_sel = 1; neg = 1;
    #10;
    if (pp !== 17'hFFFFE) $display("FAIL: Test case 9 failed, expected FFFFFE, got %h", pp);

    $display("PASS");
    $finish;
end

endmodule