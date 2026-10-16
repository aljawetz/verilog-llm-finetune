`timescale 1ns/1ps

module tb_dff;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the D flip-flop
dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test data input
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: q did not update to d when rst is low");
        $finish;
    end

    // Change data input
    d = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
        $display("FAIL: q did not update to d when rst is low");
        $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule