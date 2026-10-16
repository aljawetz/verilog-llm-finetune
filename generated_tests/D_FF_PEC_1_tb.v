`timescale 1ns/1ps

module tb_D_FF_PEC;

reg D;
reg clk;
wire Q;

// Instantiate the D Flip-Flop
D_FF_PEC uut (
    .D(D),
    .clk(clk),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    D = 0;

    // Test case 1: Check initial state
    #10;
    if (Q !== 0) begin
        $display("FAIL: Initial state is incorrect");
        $finish;
    end

    // Test case 2: Check D input propagation
    D = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
        $display("FAIL: Q did not follow D on rising edge");
        $finish;
    end

    // Test case 3: Check D input propagation with D = 0
    D = 0; 
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
        $display("FAIL: Q did not follow D on rising edge");
        $finish;
    end

    // Test case 4: Check multiple transitions
    D = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
        $display("FAIL: Q did not follow D on rising edge");
        $finish;
    end

    D = 0; 
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
        $display("FAIL: Q did not follow D on rising edge");
        $finish;
    end

    // Test case 5: Final check
    D = 1; 
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
        $display("FAIL: Q did not follow D on rising edge");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule