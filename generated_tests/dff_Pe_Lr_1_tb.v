`timescale 1ns/1ps

module tb_dff_Pe_Lr;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_Pe_Lr uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 0;
    d = 0;

    // Apply reset
    #3;
    rst = 1; // Release reset
    #10;

    // Test case 1: Check reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Check D flip-flop functionality
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d on rising edge");
      $finish;
    end

    // Test case 3: Change D to 0
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d on rising edge");
      $finish;
    end

    // Test case 4: Check reset functionality again
    rst = 0; // Assert reset
    #3;
    rst = 1; // Release reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 after release");
      $finish;
    end

    // Test case 5: Check D flip-flop functionality with new values
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d on rising edge");
      $finish;
    end

    // Test case 6: Final check with D = 0
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d on rising edge");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule