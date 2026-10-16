`timescale 1ns/1ps

module tb_tff_2;

reg t;
reg clk;
reg rst;
wire Q;
wire Q_not;

// Instantiate the module under test
tff_2 uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .Q(Q),
    .Q_not(Q_not)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1; t = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check initial state after reset
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Initial state after reset is incorrect");
        $finish;
    end

    // Test case 2: Toggle Q when t = 1
    t = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q and Q_not did not toggle correctly when t=1");
        $finish;
    end

    // Test case 3: Maintain state when t = 0
    t = 0; 
    #10; // Wait for one clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q and Q_not changed when t=0");
        $finish;
    end

    // Test case 4: Toggle Q again when t = 1
    t = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Q and Q_not did not toggle correctly on second toggle");
        $finish;
    end

    // Test case 5: Reset the flip-flop
    rst = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Q and Q_not did not reset correctly");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule