`timescale 1ns/1ps

module tb_sr_ff_async_rst;

reg clk;
reg rst;
reg S;
reg R;
wire Q;
wire Q_bar;

// Instantiate the module under test (uut)
sr_ff_async_rst uut (
    .clk(clk),
    .rst(rst),
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    S = 0;
    R = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set Q to 1
    S = 1; R = 0; // Set
    #10;
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when S=1 and R=0");
        $finish;
    end

    // Test case 2: Reset Q to 0
    S = 0; R = 1; // Reset
    #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when S=0 and R=1");
        $finish;
    end

    // Test case 3: Hold Q state
    S = 0; R = 0; // Hold
    #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q should remain 0 when S=0 and R=0");
        $finish;
    end

    // Test case 4: Invalid state
    S = 1; R = 1; // Invalid state
    #10;
    if (Q !== 1'bx) begin
        $display("FAIL: Q should be x when S=1 and R=1");
        $finish;
    end

    // Test case 5: Check async reset
    rst = 1; // Assert reset
    #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when reset is asserted");
        $finish;
    end

    // Test case 6: Release reset and set again
    rst = 0; S = 1; R = 0; // Set
    #10;
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after reset is released and S=1, R=0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule