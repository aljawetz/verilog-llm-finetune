`timescale 1ns/1ps

module tb_d_latch;

  reg d;
  reg en;
  reg rstn;
  wire q;

  // Instantiate the D latch
  d_latch uut (
    .d(d),
    .en(en),
    .rstn(rstn),
    .q(q)
  );

  initial begin
    // Initialize signals
    d = 0;
    en = 0;
    rstn = 1;

    // Test 1: Check reset functionality
    rstn = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check that q retains its value when en is low
    rstn = 1; #10;
    d = 1; en = 0; #10;
    if (q !== 0) begin
      $display("FAIL: q should retain value when en is low");
      $finish;
    end

    // Test 3: Check that q updates to d when en is high
    en = 1; #10;
    if (q !== 1) begin
      $display("FAIL: q did not update to d when en is high");
      $finish;
    end

    // Test 4: Check that q retains its value when en goes low again
    en = 0; #10;
    if (q !== 1) begin
      $display("FAIL: q should retain value when en goes low");
      $finish;
    end

    // Test 5: Check reset functionality again
    rstn = 0; #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 6: Check that q updates to d when en is high after reset
    rstn = 1; #10;
    d = 0; en = 1; #10;
    if (q !== 0) begin
      $display("FAIL: q did not update to d after reset when en is high");
      $finish;
    end

    // Test 7: Check that q updates to d when en is high with d = 1
    d = 1; #10;
    if (q !== 1) begin
      $display("FAIL: q did not update to d when d = 1 and en is high");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule