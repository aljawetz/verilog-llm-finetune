`timescale 1ns/1ps

module tb_dff_1;

reg D;
reg clk;
reg rst;
wire Q;

// Instantiate the module under test (uut)
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
    // Initialize signals
    D = 0;
    rst = 0;

    // Test 1: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when rst is high");
        $finish;
    end

    // Test 2: D input propagation
    rst = 0; // Deassert reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1 and rst is low");
        $finish;
    end

    // Test 3: Change D input
    D = 0; // Change D to 0
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when D is 0 and rst is low");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when rst is high");
        $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deassert reset
    D = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1 and rst is low");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule