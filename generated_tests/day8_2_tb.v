`timescale 1ns/1ps

module tb_day8;

  reg clk;
  reg reset;
  wire [7:0] count_o;

  // Instantiate the module under test (uut)
  day8 uut (
    .clk(clk),
    .reset(reset),
    .count_o(count_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial count value
    if (count_o !== 8'h0) begin
      $display("FAIL: Initial count_o is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count_o !== 8'h1) begin
      $display("FAIL: count_o is not 1 after 1 clock cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count_o !== 8'h2) begin
      $display("FAIL: count_o is not 2 after 2 clock cycles");
      $finish;
    end

    // Reset the counter
    reset = 1;
    #10; // Wait for 1 clock cycle
    reset = 0; // Release reset

    // Check count after reset
    if (count_o !== 8'h0) begin
      $display("FAIL: count_o is not zero after reset");
      $finish;
    end

    // Continue counting
    #20; // Wait for 2 clock cycles
    if (count_o !== 8'h2) begin
      $display("FAIL: count_o is not 2 after 2 more clock cycles post-reset");
      $finish;
    end

    // Test wrap-around
    reset = 1; // Reset the counter
    #10;
    reset = 0; // Release reset

    // Count to 255
    repeat (255) begin
      #10; // Wait for 1 clock cycle
    end

    // Check wrap-around
    #10; // Wait for 1 clock cycle
    if (count_o !== 8'h0) begin
      $display("FAIL: count_o did not wrap around to zero after reaching 255");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule