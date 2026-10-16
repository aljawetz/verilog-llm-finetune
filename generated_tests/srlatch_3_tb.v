`timescale 1ns/1ps

module tb_srlatch;

  reg s;
  reg r;
  wire q;
  wire qbar;

  // Instantiate the SR Latch
  srlatch uut (
    .s(s),
    .r(r),
    .q(q),
    .qbar(qbar)
  );

  initial begin
    // Initialize inputs
    s = 0;
    r = 0;

    // Test case 1: Set condition (s = 1, r = 0)
    s = 1; r = 0;
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 1 failed (Set condition)");
      $finish;
    end

    // Test case 2: Reset condition (s = 0, r = 1)
    s = 0; r = 1;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 2 failed (Reset condition)");
      $finish;
    end

    // Test case 3: Hold condition (s = 0, r = 0)
    s = 0; r = 0;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 3 failed (Hold condition)");
      $finish;
    end

    // Test case 4: Set condition again (s = 1, r = 0)
    s = 1; r = 0;
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 4 failed (Set condition again)");
      $finish;
    end

    // Test case 5: Reset condition again (s = 0, r = 1)
    s = 0; r = 1;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 5 failed (Reset condition again)");
      $finish;
    end

    // Final state check (Hold condition)
    s = 0; r = 0;
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Final state check failed (Hold condition)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule