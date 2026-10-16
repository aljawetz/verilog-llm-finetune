`timescale 1ns/1ps

module tb_dff_1;

reg D;
reg clk;
reg rst;
wire Q;

// Instantiate the D flip-flop
dff_1 uut (
    .D(D),
    .clk(clk),
    .rst(rst),
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
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Reset did not set Q to 0");
        $finish;
    end

    // Test 2: Check D input when reset is inactive
    rst = 0; // Deactivate reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not follow D when reset is inactive");
        $finish;
    end

    // Test 3: Check D input when reset is inactive with D = 0
    D = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q did not follow D when D is 0");
        $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Reset did not set Q to 0 again");
        $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deactivate reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not follow D after reset was deactivated");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule