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
    // Initialize signals
    reset = 1;
    t = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: Toggle when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Expected q to be 1 after toggle, got %b", q);
        $finish;
    end

    // Test case 2: Toggle again
    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to be 0 after toggle, got %b", q);
        $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to remain 0, got %b", q);
        $finish;
    end

    // Test case 4: Reset functionality
    reset = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to be 0 after reset, got %b", q);
        $finish;
    end

    // Test case 5: Toggle after reset
    reset = 0; // Release reset
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Expected q to be 1 after toggle, got %b", q);
        $finish;
    end

    // Test case 6: Toggle again
    #10; // Wait for another clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Expected q to be 0 after toggle, got %b", q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule