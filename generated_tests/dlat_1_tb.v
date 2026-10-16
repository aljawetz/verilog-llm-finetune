`timescale 1ns/1ps

module tb_dlat;
  reg d;
  reg en;
  wire q;

  // Instantiate the D latch
  dlat uut (
    .d(d),
    .en(en),
    .q(q)
  );

  initial begin
    // Initialize inputs
    d = 0;
    en = 0;

    // Test sequence
    // Test 1: Enable high, set d to 1
    en = 1; d = 1; #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when en=1 and d=1, got q=%b", q);
      $finish;
    end

    // Test 2: Enable high, set d to 0
    d = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when en=1 and d=0, got q=%b", q);
      $finish;
    end

    // Test 3: Enable low, check if q retains value
    en = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when en=0, got q=%b", q);
      $finish;
    end

    // Test 4: Enable high again, set d to 1
    en = 1; d = 1; #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when en=1 and d=1, got q=%b", q);
      $finish;
    end

    // Test 5: Enable low, check if q retains value
    en = 0; #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when en=0, got q=%b", q);
      $finish;
    end

    // Test 6: Enable high, set d to 0
    en = 1; d = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when en=1 and d=0, got q=%b", q);
      $finish;
    end

    // Final check with enable low
    en = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when en=0, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule