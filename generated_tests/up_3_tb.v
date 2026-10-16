`timescale 1ns/1ps

module tb_up;
  reg reset;
  reg clk;
  wire [3:0] count_out;

  // Instantiate the module under test (uut)
  up uut (
    .reset(reset),
    .clk(clk),
    .count_out(count_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial count after reset
    if (count_out !== 4'b0000) begin
      $display("FAIL: Initial count after reset is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'b0001) begin
      $display("FAIL: Count after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count_out !== 4'b0010) begin
      $display("FAIL: Count after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count_out !== 4'b0011) begin
      $display("FAIL: Count after 3 clock cycles is not 3");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count_out !== 4'b0100) begin
      $display("FAIL: Count after 4 clock cycles is not 4");
      $finish;
    end

    // Assert reset again
    reset = 1;
    #10; // Wait for 1 clock cycle
    reset = 0; // Release reset

    // Check count after reset
    if (count_out !== 4'b0000) begin
      $display("FAIL: Count after reset is not zero");
      $finish;
    end

    // Continue counting
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'b0001) begin
      $display("FAIL: Count after reset and 1 clock cycle is not 1");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule