`timescale 1ns/1ps

module tb_t_flipflop;

reg t;
reg clk;
reg reset;
wire q;
wire qbar;

// Instantiate the T flip-flop
t_flipflop uut (
    .t(t),
    .clk(clk),
    .reset(reset),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    t = 0;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: q did not toggle to 1 when t is high");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q did not toggle to 0 on next clock cycle");
        $finish;
    end

    // Test case 3: Check when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q should remain 0 when t is low");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q should still remain 0 when t is low");
        $finish;
    end

    // Test case 4: Toggle q again when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: q did not toggle to 1 when t is high again");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: q did not toggle to 0 on next clock cycle");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule