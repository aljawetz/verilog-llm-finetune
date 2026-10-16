`timescale 1ns/1ps

module tb_up_counter;
  reg clk;
  reg rst;
  wire [2:0] count;

  // Instantiate the up_counter module
  up_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    rst = 0; // Deassert reset

    // Check count after reset
    if (count !== 3'b000) begin
      $display("FAIL: Count should be 0 after reset");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count should be 1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 3'b010) begin
      $display("FAIL: Count should be 2");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 3'b011) begin
      $display("FAIL: Count should be 3");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 3'b100) begin
      $display("FAIL: Count should be 4");
      $finish;
    end

    // Assert reset again
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    if (count !== 3'b000) begin
      $display("FAIL: Count should be 0 after reset");
      $finish;
    end

    // Deassert reset and check count again
    rst = 0; // Deassert reset
    #10; // Wait for a clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count should be 1 after reset deassertion");
      $finish;
    end

    // Continue counting
    #30; // Wait for 3 clock cycles
    if (count !== 3'b100) begin
      $display("FAIL: Count should be 4 after 3 more clock cycles");
      $finish;
    end

    // Wait for one more clock cycle
    #10; // Wait for another clock cycle
    if (count !== 3'b101) begin
      $display("FAIL: Count should be 5");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end
endmodule