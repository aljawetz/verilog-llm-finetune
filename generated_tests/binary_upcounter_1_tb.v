`timescale 1ns/1ps

module tb_binary_upcounter;

reg [3:0] data_in;
reg load;
reg clk;
reg resetn;
wire [3:0] count;

// Instantiate the binary_upcounter module
binary_upcounter uut (
    .data_in(data_in),
    .load(load),
    .clk(clk),
    .resetn(resetn),
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
    resetn = 0;
    load = 0;
    data_in = 4'b0000;

    // Apply reset
    #10;
    resetn = 1; // Release reset

    // Test counting
    #10;
    if (count !== 4'd0) $display("FAIL: Count should be 0 after reset");

    // Test counting up
    #10;
    if (count !== 4'd1) $display("FAIL: Count should be 1 after one clock cycle");

    // Test loading data
    data_in = 4'b1010; // Load 10
    load = 1; // Assert load
    #10;
    load = 0; // Deassert load
    if (count !== 4'b1010) $display("FAIL: Count should be 10 after loading data");

    // Test counting after loading
    #10;
    if (count !== 4'b1011) $display("FAIL: Count should be 11 after one clock cycle");

    // Test wrap-around
    #10;
    if (count !== 4'b1100) $display("FAIL: Count should be 12 after one more clock cycle");
    #10;
    if (count !== 4'b1101) $display("FAIL: Count should be 13 after one more clock cycle");
    #10;
    if (count !== 4'b1110) $display("FAIL: Count should be 14 after one more clock cycle");
    #10;
    if (count !== 4'b1111) $display("FAIL: Count should be 15 after one more clock cycle");
    #10;
    if (count !== 4'b0000) $display("FAIL: Count should be 0 after wrap-around");

    // End simulation
    $display("PASS");
    $finish;
end

endmodule