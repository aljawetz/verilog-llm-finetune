`timescale 1ns/1ps

module tb_reset_controller;

reg clk;
reg rst;
wire rst_correct;

// Instantiate the module under test (uut)
reset_controller uut (
    .clk(clk),
    .rst(rst),
    .rst_correct(rst_correct)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    rst = 1; // Active reset
    #10; // Wait for 10ns
    if (rst_correct !== 1) begin
        $display("FAIL: rst_correct should be 1 during reset");
        $finish;
    end

    // Release reset
    rst = 0; // Deactivate reset
    #10; // Wait for 10ns
    if (rst_correct !== 0) begin
        $display("FAIL: rst_correct should be 0 after reset is released");
        $finish;
    end

    // Apply reset again
    rst = 1; // Active reset
    #10; // Wait for 10ns
    if (rst_correct !== 1) begin
        $display("FAIL: rst_correct should be 1 during reset");
        $finish;
    end

    // Release reset again
    rst = 0; // Deactivate reset
    #10; // Wait for 10ns
    if (rst_correct !== 0) begin
        $display("FAIL: rst_correct should be 0 after reset is released");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule