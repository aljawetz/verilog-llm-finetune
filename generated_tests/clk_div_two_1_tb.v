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
    #5 clk_in = ~clk_in; // 10ns period for clk_in
end

initial begin
    // Initialize signals
    clk_in = 0;
    rst = 0;

    // Test sequence
    // Test 1: Reset the output
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after reset");
        $finish;
    end
    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Test 2: Check clk_out toggling
    // Wait for 20ns and check toggling
    #20;
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after 20ns");
        $finish;
    end

    #10;
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after 30ns");
        $finish;
    end

    #10;
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after 40ns");
        $finish;
    end

    // Test 3: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after reset");
        $finish;
    end
    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Test 4: Check clk_out toggling after reset
    #20;
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after 20ns post reset");
        $finish;
    end

    #10;
    if (clk_out !== 0) begin
        $display("FAIL: clk_out should be 0 after 30ns post reset");
        $finish;
    end

    #10;
    if (clk_out !== 1) begin
        $display("FAIL: clk_out should be 1 after 40ns post reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule