`timescale 1ns/1ps

module tb_t_ff;

reg t;
reg clk;
reg rst;
wire q;

// Instantiate the module under test
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
    rst = 1;
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check reset functionality
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not toggle to 1 when t is high");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not toggle to 0 when t is high again");
        $finish;
    end

    // Test case 3: Keep q unchanged when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q changed when t is low");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q changed when t is still low");
        $finish;
    end

    // Test case 4: Toggle q again with t high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not toggle to 1 when t is high again");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule