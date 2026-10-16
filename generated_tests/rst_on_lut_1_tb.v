`timescale 1ns/1ps

module tb_rst_on_lut;

  reg rst;
  reg clk;
  reg a;
  reg b;
  wire q;
  wire out;

  // Instantiate the module under test (uut)
  rst_on_lut uut (
    .rst(rst),
    .clk(clk),
    .a(a),
    .b(b),
    .q(q),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 0;
    a = 0;
    b = 0;

    // Test 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Test 2: Check latching of 'a' when rst is low
    rst = 0; // Deassert reset
    a = 1;   // Set 'a' to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q should be 1 after latching 'a' when rst is low");
      $finish;
    end

    // Test 3: Check output 'out' when rst is low
    b = 1;   // Set 'b' to 1
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: out should be 1 when b is 1 and rst is low");
      $finish;
    end

    // Test 4: Check output 'out' when rst is high
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: out should be 0 when rst is high");
      $finish;
    end

    // Test 5: Check latching of 'a' after reset is deasserted
    rst = 0; // Deassert reset
    a = 0;   // Set 'a' to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q should be 0 after latching 'a' when rst is low");
      $finish;
    end

    // Final check: Ensure 'out' is still correct
    b = 1;   // Set 'b' to 1
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: out should be 1 when b is 1 and rst is low");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule