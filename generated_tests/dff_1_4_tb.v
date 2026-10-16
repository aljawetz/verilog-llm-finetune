`timescale 1ns/1ps

module tb_dff_1;

reg D;
reg clk;
reg rst;
wire Q;

// Instantiate the module under test
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

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Test D flip-flop functionality
    D = 1; // Set D to 1
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1");
        $finish;
    end

    D = 0; // Set D to 0
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when D is 0");
        $finish;
    end

    D = 1; // Set D to 1 again
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1");
        $finish;
    end

    // Final check
    rst = 1; // Assert reset again
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule