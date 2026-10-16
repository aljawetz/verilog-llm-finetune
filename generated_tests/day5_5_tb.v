`timescale 1ns/1ps

module tb_day5;

  reg clk;
  reg reset;
  wire [7:0] cnt_o;

  // Instantiate the module under test (uut)
  day5 uut (
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
    // Initialize signals
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Deassert reset

    // Check initial value after reset
    if (cnt_o !== 8'h1) begin
      $display("FAIL: Initial value after reset is incorrect, got %h", cnt_o);
      $finish;
    end

    // Wait for a few clock cycles and check the counter value
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h3) begin
      $display("FAIL: Counter value after 1 increment is incorrect, got %h", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h5) begin
      $display("FAIL: Counter value after 2 increments is incorrect, got %h", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h7) begin
      $display("FAIL: Counter value after 3 increments is incorrect, got %h", cnt_o);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h9) begin
      $display("FAIL: Counter value after 4 increments is incorrect, got %h", cnt_o);
      $finish;
    end

    // Assert reset again
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Deassert reset

    // Check value after reset again
    if (cnt_o !== 8'h1) begin
      $display("FAIL: Value after reset is incorrect, got %h", cnt_o);
      $finish;
    end

    // Final checks
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h3) begin
      $display("FAIL: Counter value after reset and 1 increment is incorrect, got %h", cnt_o);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule