`timescale 1ns/1ps

module tb_t_ff;

reg clk;
reg rst;
reg t;
wire t_q;

// Instantiate the module under test (uut)
t_ff uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .t_q(t_q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    t = 0;

    // Apply reset
    rst = 1; // Active low reset
    #10;
    rst = 0; // Deassert reset
    #10;

    // Test sequence
    // Check initial state after reset
    if (t_q !== 0) begin
        $display("FAIL: Initial state is not zero after reset");
        $finish;
    end

    // Test toggling behavior
    t = 1; // Set T to toggle
    #10; // Wait for clock edge
    if (t_q !== 1) begin
        $display("FAIL: Expected t_q to be 1 after toggle");
        $finish;
    end

    #10; // Wait for next clock edge
    if (t_q !== 0) begin
        $display("FAIL: Expected t_q to be 0 after toggle");
        $finish;
    end

    // Test maintaining state
    t = 0; // Set T to maintain
    #10; // Wait for clock edge
    if (t_q !== 0) begin
        $display("FAIL: Expected t_q to remain 0");
        $finish;
    end

    #10; // Wait for next clock edge
    if (t_q !== 0) begin
        $display("FAIL: Expected t_q to remain 0");
        $finish;
    end

    // Test toggling again
    t = 1; // Set T to toggle
    #10; // Wait for clock edge
    if (t_q !== 1) begin
        $display("FAIL: Expected t_q to be 1 after toggle");
        $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset
    #10;

    // Check state after reset
    if (t_q !== 0) begin
        $display("FAIL: Expected t_q to be 0 after reset");
        $finish;
    end

    // Final check for toggling
    t = 1; // Set T to toggle
    #10; // Wait for clock edge
    if (t_q !== 1) begin
        $display("FAIL: Expected t_q to be 1 after toggle");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule