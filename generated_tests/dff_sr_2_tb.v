`timescale 1ns/1ps

module tb_dff_sr;
  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the DFF module
  dff_sr uut (
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
    // Initialize inputs
    d = 0;
    rst = 0;

    // Test case 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test case 2: Check D input capture
    rst = 0; // Deassert reset
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d value (expected 0)");
      $finish;
    end

    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d value (expected 1)");
      $finish;
    end

    // Test case 3: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test case 4: Check D input capture after reset
    rst = 0; // Deassert reset
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d value (expected 0)");
      $finish;
    end

    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d value (expected 1)");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule