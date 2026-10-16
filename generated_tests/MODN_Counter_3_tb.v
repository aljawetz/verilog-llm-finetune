`timescale 1ns/1ps

module tb_MODN_Counter;
  reg clk;
  reg rst;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  MODN_Counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test counting from 0 to 9
    #50; // Wait for 50ns to observe counts
    if (count !== 4'd5) begin
      $display("FAIL: Expected count to be 5 after 50ns, got %d", count);
      $finish;
    end

    // Wait for the counter to reach 9
    #40; // Wait for 40ns to reach count 9
    if (count !== 4'd9) begin
      $display("FAIL: Expected count to be 9 after 90ns, got %d", count);
      $finish;
    end

    // Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Release reset
    #10; // Wait for 10ns

    if (count !== 4'd1) begin
      $display("FAIL: Expected count to be 1 after reset, got %d", count);
      $finish;
    end

    // Continue counting to 9 again
    #80; // Wait for 80ns to reach count 9 again
    if (count !== 4'd9) begin
      $display("FAIL: Expected count to be 9 after 180ns, got %d", count);
      $finish;
    end

    // Final reset check
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Release reset
    #10; // Wait for 10ns

    if (count !== 4'd1) begin
      $display("FAIL: Expected count to be 1 after final reset, got %d", count);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule