`timescale 1ns/1ps

module tb_tff_2;

reg t;
reg clk;
reg rst;
wire Q;
wire Q_not;

// Instantiate the module under test (uut)
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
    // Initialize signals
    rst = 1; t = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test case 1: Check initial state after reset
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Initial state after reset is incorrect");
        $finish;
    end

    // Test case 2: Toggle Q when t=1
    t = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q should be 1 when t=1 and clk falls");
        $finish;
    end

    // Test case 3: Hold state when t=0
    t = 0; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q should remain 1 when t=0 and clk falls");
        $finish;
    end

    // Test case 4: Toggle Q again when t=1
    t = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Q should be 0 after toggling again with t=1");
        $finish;
    end

    // Test case 5: Reset the flip-flop
    rst = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test case 6: Toggle after reset
    rst = 0; t = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
        $display("FAIL: Q should be 1 after reset and t=1");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule