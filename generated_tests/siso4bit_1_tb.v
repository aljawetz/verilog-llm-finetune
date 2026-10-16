`timescale 1ns/1ps

module tb_siso4bit;

reg clk;
reg clear;
reg si;
wire so;

// Instantiate the module under test
siso4bit uut (
    .clk(clk),
    .clear(clear),
    .si(si),
    .so(so)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    clear = 1;
    si = 0;

    // Wait for a clock cycle
    #10;

    // Release clear
    clear = 0;

    // Test shifting with si = 1
    si = 1; #10;
    if (so !== 0) $display("FAIL: Expected so = 0, got so = %b", so);

    si = 0; #10;
    if (so !== 1) $display("FAIL: Expected so = 1, got so = %b", so);

    si = 1; #10;
    if (so !== 0) $display("FAIL: Expected so = 0, got so = %b", so);

    si = 1; #10;
    if (so !== 1) $display("FAIL: Expected so = 1, got so = %b", so);

    si = 0; #10;
    if (so !== 1) $display("FAIL: Expected so = 1, got so = %b", so);

    // Test clear functionality
    clear = 1; #10;
    if (so !== 0) $display("FAIL: Expected so = 0 after clear, got so = %b", so);

    // Test shifting after clear
    clear = 0; si = 1; #10;
    if (so !== 0) $display("FAIL: Expected so = 0, got so = %b", so);

    si = 0; #10;
    if (so !== 1) $display("FAIL: Expected so = 1, got so = %b", so);

    // Final check
    clear = 1; #10;
    if (so !== 0) $display("FAIL: Expected so = 0 after final clear, got so = %b", so);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule