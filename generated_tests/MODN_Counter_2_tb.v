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

    // Check initial count
    if (count !== 0) begin
      $display("FAIL: Initial count is not 0");
      $finish;
    end

    // Count up to 9
    repeat (10) begin
      #10; // Wait for the next clock edge
    end

    // Check count after reaching 9
    if (count !== 0) begin
      $display("FAIL: Count did not reset to 0 after reaching 9");
      $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check count after reset
    if (count !== 0) begin
      $display("FAIL: Count is not 0 after reset");
      $finish;
    end

    // Count up again
    repeat (10) begin
      #10; // Wait for the next clock edge
    end

    // Final check
    if (count !== 0) begin
      $display("FAIL: Count did not reset to 0 after reaching 9 again");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule