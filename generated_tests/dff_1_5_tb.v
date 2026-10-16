`timescale 1ns/1ps

module tb_dff_1;

reg D;
reg clk;
reg rst;
wire Q;
wire Q_not;

// Instantiate the module under test
dff_1 uut (
    .D(D),
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
    D = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10; // Assert reset
    if (Q !== 0 || Q_not !== 1) begin
        $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
        $finish;
    end

    // Test 2: Check D input propagation
    rst = 0; #10; // Deassert reset
    D = 1; #10; // Set D to 1
    if (Q !== 1 || Q_not !== 0) begin
        $display("FAIL: Q did not follow D when D is 1");
        $finish;
    end

    // Test 3: Change D input
    D = 0; #10; // Set D to 0
    if (Q !== 0 || Q_not !== 1) begin
        $display("FAIL: Q did not follow D when D is 0");
        $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; #10; // Assert reset
    if (Q !== 0 || Q_not !== 1) begin
        $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
        $finish;
    end

    // Test 5: Final state check
    rst = 0; D = 1; #10; // Deassert reset and set D to 1
    if (Q !== 1 || Q_not !== 0) begin
        $display("FAIL: Final state check failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule