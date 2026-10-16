`timescale 1ns/1ps

module tb_clock_divider;

reg clk;
reg rst;
wire divideby2;
wire divideby4;
wire divideby8;
wire divideby16;
wire divideby32;

// Instantiate the clock_divider module
clock_divider uut (
    .clk(clk),
    .rst(rst),
    .divideby2(divideby2),
    .divideby4(divideby4),
    .divideby8(divideby8),
    .divideby16(divideby16),
    .divideby32(divideby32)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Wait for a few clock cycles
    #50;

    // Check outputs after 5 clock cycles
    if (divideby2 !== 1'b1) $display("FAIL: divideby2 expected 1, got %b", divideby2);
    if (divideby4 !== 1'b0) $display("FAIL: divideby4 expected 0, got %b", divideby4);
    if (divideby8 !== 1'b0) $display("FAIL: divideby8 expected 0, got %b", divideby8);
    if (divideby16 !== 1'b0) $display("FAIL: divideby16 expected 0, got %b", divideby16);
    if (divideby32 !== 1'b0) $display("FAIL: divideby32 expected 0, got %b", divideby32);

    // Wait for 5 more clock cycles
    #50;

    // Check outputs after 10 clock cycles
    if (divideby2 !== 1'b0) $display("FAIL: divideby2 expected 0, got %b", divideby2);
    if (divideby4 !== 1'b1) $display("FAIL: divideby4 expected 1, got %b", divideby4);
    if (divideby8 !== 1'b0) $display("FAIL: divideby8 expected 0, got %b", divideby8);
    if (divideby16 !== 1'b0) $display("FAIL: divideby16 expected 0, got %b", divideby16);
    if (divideby32 !== 1'b0) $display("FAIL: divideby32 expected 0, got %b", divideby32);

    // Wait for 5 more clock cycles
    #50;

    // Check outputs after 15 clock cycles
    if (divideby2 !== 1'b1) $display("FAIL: divideby2 expected 1, got %b", divideby2);
    if (divideby4 !== 1'b0) $display("FAIL: divideby4 expected 0, got %b", divideby4);
    if (divideby8 !== 1'b1) $display("FAIL: divideby8 expected 1, got %b", divideby8);
    if (divideby16 !== 1'b0) $display("FAIL: divideby16 expected 0, got %b", divideby16);
    if (divideby32 !== 1'b0) $display("FAIL: divideby32 expected 0, got %b", divideby32);

    // Wait for 5 more clock cycles
    #50;

    // Check outputs after 20 clock cycles
    if (divideby2 !== 1'b0) $display("FAIL: divideby2 expected 0, got %b", divideby2);
    if (divideby4 !== 1'b1) $display("FAIL: divideby4 expected 1, got %b", divideby4);
    if (divideby8 !== 1'b0) $display("FAIL: divideby8 expected 0, got %b", divideby8);
    if (divideby16 !== 1'b1) $display("FAIL: divideby16 expected 1, got %b", divideby16);
    if (divideby32 !== 1'b0) $display("FAIL: divideby32 expected 0, got %b", divideby32);

    // Wait for 5 more clock cycles
    #50;

    // Check outputs after 25 clock cycles
    if (divideby2 !== 1'b1) $display("FAIL: divideby2 expected 1, got %b", divideby2);
    if (divideby4 !== 1'b0) $display("FAIL: divideby4 expected 0, got %b", divideby4);
    if (divideby8 !== 1'b1) $display("FAIL: divideby8 expected 1, got %b", divideby8);
    if (divideby16 !== 1'b0) $display("FAIL: divideby16 expected 0, got %b", divideby16);
    if (divideby32 !== 1'b1) $display("FAIL: divideby32 expected 1, got %b", divideby32);

    // End of test
    $display("PASS");
    $finish;
end

endmodule