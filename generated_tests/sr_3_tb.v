`timescale 1ns/1ps

module tb_sr;
  reg clk;
  reg reset;
  reg s;
  reg r;
  wire q;

  // Instantiate the SR module
  sr uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    s = 0;
    r = 0;
    #10; // Wait for 10ns

    // Test 1: Reset functionality
    reset = 1; #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Set functionality
    reset = 0; s = 1; r = 0; #10;
    if (q !== 1) begin
      $display("FAIL: q did not set to 1 when s=1, r=0");
      $finish;
    end

    // Test 3: Reset functionality again
    reset = 1; #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 4: Clear functionality
    reset = 0; s = 0; r = 1; #10;
    if (q !== 0) begin
      $display("FAIL: q did not clear to 0 when s=0, r=1");
      $finish;
    end

    // Test 5: Retain functionality
    reset = 0; s = 1; r = 0; #10;
    if (q !== 1) begin
      $display("FAIL: q did not set to 1 when s=1, r=0");
      $finish;
    end
    s = 0; r = 0; #10;
    if (q !== 1) begin
      $display("FAIL: q did not retain value when s=0, r=0");
      $finish;
    end

    // Test 6: High impedance functionality
    s = 0; r = 1; #10;
    if (q !== 0) begin
      $display("FAIL: q did not clear to 0 when s=0, r=1");
      $finish;
    end
    s = 1; r = 1; #10;
    if (q !== 1'bz) begin
      $display("FAIL: q did not go to high impedance when s=1, r=1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule