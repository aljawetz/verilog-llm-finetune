`timescale 1ns/1ps

module tb_tff;

reg clk;
reg reset;
reg t;
wire q;

// Instantiate the module under test (uut)
tff uut (
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    t = 0;

    // Apply reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Test sequence
    // Test Case 1: Check reset functionality
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test Case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Expected q to be 1 after toggling");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to be 0 after toggling again");
        $finish;
    end

    // Test Case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to remain 0 when t is low");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to remain 0 when t is low");
        $finish;
    end

    // Test Case 4: Toggle q again with t high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Expected q to be 1 after toggling");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule