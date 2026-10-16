`timescale 1ns/1ps

module tb_mod8_modern;
  reg clk;
  reg rst;
  wire [2:0] cnt;

  // Instantiate the module under test (uut)
  mod8_modern uut (
    .clk(clk),
    .rst(rst),
    .cnt(cnt)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;

    // Check initial value
    if (cnt !== 3'b000) begin
      $display("FAIL: Initial count is not 0");
      $finish;
    end

    // Test counting sequence
    #10; // cnt should be 1
    if (cnt !== 3'b001) begin
      $display("FAIL: Count is not 1 after 1 clock cycle");
      $finish;
    end

    #10; // cnt should be 2
    if (cnt !== 3'b010) begin
      $display("FAIL: Count is not 2 after 2 clock cycles");
      $finish;
    end

    #10; // cnt should jump to 4
    if (cnt !== 3'b100) begin
      $display("FAIL: Count did not jump to 4 after 3 clock cycles");
      $finish;
    end

    #10; // cnt should be 5
    if (cnt !== 3'b101) begin
      $display("FAIL: Count is not 5 after 4 clock cycles");
      $finish;
    end

    #10; // cnt should be 6
    if (cnt !== 3'b110) begin
      $display("FAIL: Count is not 6 after 5 clock cycles");
      $finish;
    end

    #10; // cnt should reset to 0 after reaching 7
    if (cnt !== 3'b111) begin
      $display("FAIL: Count is not 7 after 6 clock cycles");
      $finish;
    end

    #10; // cnt should reset to 0
    if (cnt !== 3'b000) begin
      $display("FAIL: Count did not reset to 0 after reaching 7");
      $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset

    // Check if count is 0 after reset
    if (cnt !== 3'b000) begin
      $display("FAIL: Count is not 0 after reset");
      $finish;
    end

    // Final checks
    #10; // cnt should be 1
    if (cnt !== 3'b001) begin
      $display("FAIL: Count is not 1 after reset and 1 clock cycle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule