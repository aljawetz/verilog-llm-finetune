`timescale 1ns/1ps

module tb_srff;
  reg s, r, clk, rst;
  wire q, qbar;

  // Instantiate the srff module
  srff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s = 0; r = 0; rst = 1; // Start with reset
    #10; // Wait for reset to take effect
    rst = 0; // Release reset

    // Test case 1: Hold state (00)
    s = 0; r = 0; #10;
    if (q !== 0 || qbar !== 1) $display("FAIL: Test case 1 failed");

    // Test case 2: Reset (01)
    s = 0; r = 1; #10;
    if (q !== 0 || qbar !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: Set (10)
    s = 1; r = 0; #10;
    if (q !== 1 || qbar !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: High impedance (11)
    s = 1; r = 1; #10;
    if (q !== 1'bz || qbar !== 1'bz) $display("FAIL: Test case 4 failed");

    // Test case 5: Hold state (00) again
    s = 0; r = 0; #10;
    if (q !== 1'bz || qbar !== 1'bz) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule