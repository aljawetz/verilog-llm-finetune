`timescale 1ns/1ps

module tb_counter;

  reg clk;
  reg reset;
  wire [7:0] cnt_o;

  // Instantiate the counter module
  counter uut (
    .clk(clk),
    .reset(reset),
    .cnt_o(cnt_o)
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

    // Check initial value after reset
    if (cnt_o !== 1) begin
      $display("FAIL: Initial count value is not 1");
      $finish;
    end

    // Wait for a few clock cycles and check the count value
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 3) begin
      $display("FAIL: Count value after 1 clock cycle is not 3");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 5) begin
      $display("FAIL: Count value after 2 clock cycles is not 5");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 7) begin
      $display("FAIL: Count value after 3 clock cycles is not 7");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 9) begin
      $display("FAIL: Count value after 4 clock cycles is not 9");
      $finish;
    end

    // Assert reset again
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check value after reset
    if (cnt_o !== 1) begin
      $display("FAIL: Count value after reset is not 1");
      $finish;
    end

    // Continue counting
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 3) begin
      $display("FAIL: Count value after reset and 1 clock cycle is not 3");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule