`timescale 1ns/1ps

module tb_sipo_geffe;

reg ser_in;
reg clk;
reg rst;
wire [2:0] q;

// Instantiate the module under test
sipo_geffe uut (
    .ser_in(ser_in),
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
    // Initialize inputs
    ser_in = 0;
    rst = 1; // Activate reset
    #10; // Wait for 10ns
    rst = 0; // Deactivate reset

    // Test case 1: Shift in bits
    ser_in = 1; #10; // Shift in 1
    if (q !== 3'b001) $display("FAIL: Expected q = 001, got q = %b", q);

    ser_in = 0; #10; // Shift in 0
    if (q !== 3'b010) $display("FAIL: Expected q = 010, got q = %b", q);

    ser_in = 1; #10; // Shift in 1
    if (q !== 3'b101) $display("FAIL: Expected q = 101, got q = %b", q);

    ser_in = 0; #10; // Shift in 0
    if (q !== 3'b010) $display("FAIL: Expected q = 010, got q = %b", q);

    // Test case 2: Reset functionality
    rst = 1; #10; // Activate reset
    if (q !== 3'b000) $display("FAIL: Expected q = 000 after reset, got q = %b", q);
    
    rst = 0; // Deactivate reset
    ser_in = 1; #10; // Shift in 1
    ser_in = 1; #10; // Shift in 1
    ser_in = 0; #10; // Shift in 0
    if (q !== 3'b110) $display("FAIL: Expected q = 110, got q = %b", q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule