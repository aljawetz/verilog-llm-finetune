`timescale 1ns/1ps

module tb_clk_div_two;

reg clk_in;
reg rst;
wire clk_out;

// Instantiate the module under test
clk_div_two uut (
    .clk_in(clk_in),
    .rst(rst),
    .clk_out(clk_out)
);

// Clock generation
always begin
    #5 clk_in = ~clk_in; // 100MHz clock period
end

initial begin
    // Initialize signals
    clk_in = 0;
    rst = 0;

    // Test case 1: Reset the output
    rst = 1; // Assert reset
    #10; // Wait for two clock cycles
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 during reset");
        $finish;
    end

    // Test case 2: Release reset and check output toggling
    rst = 0; // Deassert reset
    #10; // Wait for two clock cycles
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after reset is released");
        $finish;
    end

    #10; // Wait for two clock cycles
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after two clock cycles");
        $finish;
    end

    #10; // Wait for two clock cycles
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after four clock cycles");
        $finish;
    end

    // Test case 3: Check behavior during reset
    #10; // Wait for two clock cycles
    rst = 1; // Assert reset again
    #10; // Wait for two clock cycles
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 during reset");
        $finish;
    end

    // Test case 4: Release reset and check output toggling again
    rst = 0; // Deassert reset
    #10; // Wait for two clock cycles
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after reset is released");
        $finish;
    end

    #10; // Wait for two clock cycles
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after two clock cycles");
        $finish;
    end

    #10; // Wait for two clock cycles
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after four clock cycles");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule