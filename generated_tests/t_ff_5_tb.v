`timescale 1ns/1ps

module tb_t_ff;

reg clk;
reg rst;
reg t;
wire q;

// Instantiate the module under test
t_ff uut (
    .clk(clk),
    .rst(rst),
    .t(t),
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
    #10; // Wait for some time

    // Release reset
    rst = 0;
    #10;

    // Test toggling behavior
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: Expected q to be 1 after toggle, got %b", q);
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0) begin
        $display("FAIL: Expected q to be 0 after toggle, got %b", q);
        $finish;
    end

    // Test with T not set
    t = 0; // Set T to hold
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Expected q to remain 0, got %b", q);
        $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 0) begin
        $display("FAIL: Expected q to be 0 after reset, got %b", q);
        $finish;
    end

    // Release reset and toggle again
    rst = 0;
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: Expected q to be 1 after toggle, got %b", q);
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0) begin
        $display("FAIL: Expected q to be 0 after toggle, got %b", q);
        $finish;
    end

    // Final check with T not set
    t = 0; // Set T to hold
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Expected q to remain 0, got %b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule