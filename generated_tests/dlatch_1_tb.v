`timescale 1ns/1ps

module tb_dlatch;

  reg d;
  reg en;
  reg rst;
  wire q;

  // Instantiate the D-latch module
  dlatch uut (
    .d(d),
    .en(en),
    .rst(rst),
    .q(q)
  );

  initial begin
    // Initialize inputs
    d = 0;
    en = 0;
    rst = 0;

    // Test sequence
    // Test 1: Reset functionality
    rst = 1; #10; // Set reset high
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    rst = 0; // Clear reset
    #10;

    // Test 2: Enable functionality
    d = 1; en = 1; #10; // Enable and set d to 1
    if (q !== 1) begin
      $display("FAIL: q did not update to d when en is high");
      $finish;
    end

    // Test 3: Disable functionality
    en = 0; #10; // Disable
    d = 0; // Change d to 0
    #10;
    if (q !== 1) begin
      $display("FAIL: q changed when en is low");
      $finish;
    end

    // Test 4: Reset while enabled
    rst = 1; #10; // Set reset high
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 when en is high");
      $finish;
    end

    // Test 5: Enable again after reset
    rst = 0; d = 1; en = 1; #10; // Clear reset and enable
    if (q !== 1) begin
      $display("FAIL: q did not update to d after reset");
      $finish;
    end

    // Test 6: Check latch holds value when disabled
    en = 0; #10; // Disable
    d = 0; // Change d to 0
    #10;
    if (q !== 1) begin
      $display("FAIL: q changed when en is low after setting d to 0");
      $finish;
    end

    // Test 7: Enable again and change d
    en = 1; d = 0; #10; // Enable and set d to 0
    if (q !== 0) begin
      $display("FAIL: q did not update to d when en is high again");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule