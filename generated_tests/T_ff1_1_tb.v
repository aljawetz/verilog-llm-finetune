`timescale 1ns/1ps

module tb_T_ff1;

reg T;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the T flip-flop module
T_ff1 uut (
    .T(T),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    T = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Check initial state after reset
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Initial state after reset is incorrect");
        $finish;
    end

    // Test toggling behavior
    T = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Toggled state is incorrect after first clock");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Toggled state is incorrect after second clock");
        $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: State after reset is incorrect");
        $finish;
    end
    rst = 0; // Deassert reset

    // Test toggling again
    T = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Toggled state is incorrect after third clock");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Toggled state is incorrect after fourth clock");
        $finish;
    end

    // Final check with T low
    T = 0; // Set T to not toggle
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: State should remain unchanged when T is low");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule