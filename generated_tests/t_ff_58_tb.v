`timescale 1ns/1ps

module tb_t_ff;

reg t;
reg clk;
reg rst;
wire q;

// Instantiate the module under test (uut)
t_ff uut (
    .t(t),
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
    t = 0;
    rst = 1; // Start with reset high
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test 1: Check reset functionality
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not toggle to 1 when t is high");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not toggle to 0 when t is high");
        $finish;
    end

    // Test 3: Hold q when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q changed when t is low");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q changed when t is low");
        $finish;
    end

    // Test 4: Toggle q again when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not toggle to 1 when t is high again");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not toggle to 0 when t is high again");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule