`timescale 1ns/1ps

module tb_downcounter;

reg [3:0] d;
reg sel;
reg clk;
reg rst;
wire [3:0] q;

// Instantiate the downcounter module
downcounter uut (
    .d(d),
    .sel(sel),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    sel = 0;
    d = 4'b0000;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test incrementing behavior
    d = 4'b1111; // Set d to max value
    sel = 0; // Increment mode
    #10;
    if (q !== 4'b0000) $display("FAIL: Expected q = 0000 after incrementing from 1111, got q = %b", q);

    // Increment from 0 to 1
    #10;
    if (q !== 4'b0001) $display("FAIL: Expected q = 0001, got q = %b", q);

    // Increment from 1 to 2
    #10;
    if (q !== 4'b0010) $display("FAIL: Expected q = 0010, got q = %b", q);

    // Test decrementing behavior
    sel = 1; // Decrement mode
    #10;
    if (q !== 4'b0001) $display("FAIL: Expected q = 0001, got q = %b", q);

    // Decrement from 1 to 0
    #10;
    if (q !== 4'b0000) $display("FAIL: Expected q = 0000, got q = %b", q);

    // Decrement from 0 to 15
    #10;
    if (q !== 4'b1111) $display("FAIL: Expected q = 1111 after decrementing from 0000, got q = %b", q);

    // Decrement from 15 to 14
    #10;
    if (q !== 4'b1110) $display("FAIL: Expected q = 1110, got q = %b", q);

    // Final check for incrementing back to 0
    sel = 0; // Increment mode
    #10;
    if (q !== 4'b1111) $display("FAIL: Expected q = 1111 after incrementing from 1110, got q = %b", q);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule