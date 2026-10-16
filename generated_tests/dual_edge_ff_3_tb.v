`timescale 1ns/1ps

module tb_dual_edge_ff;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the dual_edge_ff module
dual_edge_ff uut (
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
    // Initialize inputs
    rst = 1;
    d = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check output after rising edge
    d = 1;
    #10; // Wait for next rising edge
    if (q !== 1) begin
        $display("FAIL: Expected q=1 after rising edge, got q=%b", q);
        $finish;
    end

    // Test case 2: Check output after falling edge
    #10; // Wait for next falling edge
    if (q !== 1) begin
        $display("FAIL: Expected q=1 after falling edge, got q=%b", q);
        $finish;
    end

    // Test case 3: Change input and check output
    d = 0;
    #10; // Wait for next rising edge
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after rising edge, got q=%b", q);
        $finish;
    end

    #10; // Wait for next falling edge
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after falling edge, got q=%b", q);
        $finish;
    end

    // Test case 4: Assert reset functionality
    rst = 1;
    #10; // Wait for reset to take effect
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after reset, got q=%b", q);
        $finish;
    end

    // Release reset and check again
    rst = 0;
    d = 1;
    #10; // Wait for next rising edge
    if (q !== 1) begin
        $display("FAIL: Expected q=1 after rising edge post-reset, got q=%b", q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule