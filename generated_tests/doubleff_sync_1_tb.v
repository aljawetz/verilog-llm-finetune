`timescale 1ns/1ps

module tb_doubleff_sync;

parameter WIDTH = 4;
reg clk;
reg rst;
reg [WIDTH-1:0] d;
wire [WIDTH-1:0] q;

// Instantiate the module under test
doubleff_sync uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize
    rst = 1;
    d = 4'b0000;
    #10;

    // Apply reset
    rst = 0;
    #10;
    rst = 1;
    #10;

    // Test case 1: Check output after one clock cycle
    d = 4'b1010; // Input data
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
        $display("FAIL: Output should be 0000 after reset");
        $finish;
    end

    // Test case 2: Check output after two clock cycles
    #10; // Wait for another clock cycle
    if (q !== 4'b1010) begin
        $display("FAIL: Output should be 1010 after two clock cycles");
        $finish;
    end

    // Test case 3: Change input and check output
    d = 4'b1100; // New input data
    #10; // Wait for one clock cycle
    if (q !== 4'b1010) begin
        $display("FAIL: Output should still be 1010 after one clock cycle with new input");
        $finish;
    end

    // Wait for another clock cycle
    #10; 
    if (q !== 4'b1100) begin
        $display("FAIL: Output should be 1100 after two clock cycles with new input");
        $finish;
    end

    // Test case 4: Check output with reset during operation
    d = 4'b1111; // New input data
    #10; // Wait for one clock cycle
    rst = 0; // Assert reset
    #10; // Wait for reset to take effect
    rst = 1; // Deassert reset
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
        $display("FAIL: Output should be 0000 after reset during operation");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule