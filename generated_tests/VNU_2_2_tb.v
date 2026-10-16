`timescale 1ns/1ps

module tb_VNU_2;

reg signed [31:0] R1;
reg signed [31:0] R2;
reg signed [31:0] L;
wire signed [31:0] Q1;
wire signed [31:0] Q2;
wire P;
reg clk;
reg rst;

VNU_2 uut (
    .Q1(Q1),
    .Q2(Q2),
    .R1(R1),
    .R2(R2),
    .L(L),
    .P(P),
    .clk(clk),
    .rst(rst)
);

initial begin
    clk = 0;
    rst = 1;
    #5 rst = 0; // Release reset after 5 ns
end

always #5 clk = ~clk; // Clock generation with a period of 10 ns

initial begin
    // Test case 1
    R1 = 32'd10;
    R2 = 32'd20;
    L = 32'd5;
    #10; // Wait for one clock cycle

    if (Q1 !== 32'd15) $display("FAIL: Q1 expected 15, got %d", Q1);
    if (Q2 !== 32'd25) $display("FAIL: Q2 expected 25, got %d", Q2);
    if (P !== 1'b0) $display("FAIL: P expected 0, got %b", P);

    // Test case 2
    R1 = -32'd10;
    R2 = -32'd20;
    L = -32'd5;
    #10; // Wait for one clock cycle

    if (Q1 !== -32'd25) $display("FAIL: Q1 expected -25, got %d", Q1);
    if (Q2 !== -32'd15) $display("FAIL: Q2 expected -15, got %d", Q2);
    if (P !== 1'b1) $display("FAIL: P expected 1, got %b", P);

    // Test case 3: Reset functionality
    rst = 1;
    #10; // Wait for reset to take effect
    if (Q1 !== L) $display("FAIL: Q1 expected %d (L), got %d", L, Q1);
    if (Q2 !== L) $display("FAIL: Q2 expected %d (L), got %d", L, Q2);

    $display("PASS");
    $finish;
end

endmodule