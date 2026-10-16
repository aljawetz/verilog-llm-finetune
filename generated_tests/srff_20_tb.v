`timescale 1ns/1ps

module tb_srff;

  reg s, r, clk;
  wire q, qbar;

  // Instantiate the module under test (uut)
  srff uut (
    .q(q),
    .qbar(qbar),
    .s(s),
    .r(r),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s = 0; r = 0;
    #10; // Wait for clock to stabilize

    // Test case 1: Set condition (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 1 failed (Set condition)");
      $finish;
    end

    // Test case 2: Reset condition (s=0, r=1)
    s = 0; r = 1;
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 2 failed (Reset condition)");
      $finish;
    end

    // Test case 3: Hold condition (s=0, r=0)
    s = 0; r = 0;
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 3 failed (Hold condition)");
      $finish;
    end

    // Test case 4: Set condition again (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 4 failed (Set condition again)");
      $finish;
    end

    // Test case 5: Reset condition again (s=0, r=1)
    s = 0; r = 1;
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 5 failed (Reset condition again)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule