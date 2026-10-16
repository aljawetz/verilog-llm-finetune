`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg d;
  reg preset;
  reg clk;
  reg rst;

  // Outputs
  wire qn;
  wire qnbar;

  // Instantiate the Unit Under Test (UUT)
  d_ff uut (
    .d(d),
    .preset(preset),
    .clk(clk),
    .rst(rst),
    .qn(qn),
    .qnbar(qnbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;
    preset = 0;
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; #10; // Assert reset
    if (qn !== 0) begin
      $display("FAIL: Reset did not set qn to 0");
      $finish;
    end
    rst = 0; #10;

    // Test 2: Check preset functionality
    preset = 1; #10; // Assert preset
    if (qn !== 1) begin
      $display("FAIL: Preset did not set qn to 1");
      $finish;
    end
    preset = 0; #10;

    // Test 3: Check D input functionality
    d = 1; #10; // Set D to 1
    if (qn !== 1) begin
      $display("FAIL: qn did not follow D input");
      $finish;
    end

    // Test 4: Check D input changes
    d = 0; #10; // Change D to 0
    if (qn !== 0) begin
      $display("FAIL: qn did not follow D input");
      $finish;
    end

    // Test 5: Check complementary output
    if (qnbar !== 1) begin
      $display("FAIL: qnbar did not match expected value");
      $finish;
    end

    // Test 6: Check behavior on clock edge
    d = 1; #10; // Change D to 1
    if (qn !== 1) begin
      $display("FAIL: qn did not follow D input on clock edge");
      $finish;
    end

    // Final check for qnbar
    if (qnbar !== 0) begin
      $display("FAIL: qnbar did not match expected value");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule