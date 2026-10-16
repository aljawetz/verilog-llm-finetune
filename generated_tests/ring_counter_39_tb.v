`timescale 1ns/1ps

module tb_ring_counter;

reg clk;
reg init;
wire [7:0] count;

// Instantiate the module under test (uut)
ring_counter uut (
    .clk(clk),
    .init(init),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    init = 0;
    
    // Wait for a few clock cycles
    #10;

    // Test case 1: Initialize the counter
    init = 1; 
    #10; // Wait for one clock cycle
    init = 0; // Release init

    // Check if count is initialized correctly
    if (count !== 8'b10000000) begin
        $display("FAIL: Initial count is incorrect, got %b", count);
        $finish;
    end

    // Test case 2: Shift the counter
    #10; // Wait for one clock cycle
    if (count !== 8'b00000001) begin
        $display("FAIL: Count after first shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b00000010) begin
        $display("FAIL: Count after second shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b00000100) begin
        $display("FAIL: Count after third shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b00001000) begin
        $display("FAIL: Count after fourth shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b00010000) begin
        $display("FAIL: Count after fifth shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b00100000) begin
        $display("FAIL: Count after sixth shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b01000000) begin
        $display("FAIL: Count after seventh shift is incorrect, got %b", count);
        $finish;
    end

    #10; // Wait for one clock cycle
    if (count !== 8'b10000000) begin
        $display("FAIL: Count after eighth shift is incorrect, got %b", count);
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule