`timescale 1ns/1ps

module tb_tff;

reg clk;
reg reset;
reg t;
wire q;

// Instantiate the T flip-flop
tff uut (
    .clk(clk),
    .reset(reset),
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
    // Initialize inputs
    reset = 1;
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10; // Wait for 10ns

    // Test case 1: Toggle when t is high
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
        $display("FAIL: Expected q = 1 after toggle, got q = %b", q);
        $finish;
    end

    // Test case 2: Toggle again
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q = 0 after toggle, got q = %b", q);
        $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0;
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q = 0 with t low, got q = %b", q);
        $finish;
    end

    // Test case 4: Reset functionality
    reset = 1;
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q = 0 after reset, got q = %b", q);
        $finish;
    end

    // Test case 5: Toggle after reset
    reset = 0;
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
        $display("FAIL: Expected q = 1 after toggle, got q = %b", q);
        $finish;
    end

    // Test case 6: Final toggle
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q = 0 after toggle, got q = %b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule