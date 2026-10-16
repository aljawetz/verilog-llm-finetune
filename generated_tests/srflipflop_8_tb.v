`timescale 1ns/1ps

module tb_srflipflop;
  reg s, r, clk;
  wire q, qbar;

  // Instantiate the SR Flip-Flop
  srflipflop uut (
    .s(s),
    .r(r),
    .clk(clk),
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
    s = 0; r = 0;
    #10; // Wait for clock to stabilize

    // Test case 1: Set condition (s=1, r=0)
    s = 1; r = 0;
    #10; // Wait for clock edge
    if (q !== 1) $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);

    // Test case 2: Reset condition (s=0, r=1)
    s = 0; r = 1;
    #10; // Wait for clock edge
    if (q !== 0) $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);

    // Test case 3: Hold condition (s=0, r=0)
    s = 0; r = 0;
    #10; // Wait for clock edge
    if (q !== 0) $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);

    // Test case 4: Set condition again (s=1, r=0)
    s = 1; r = 0;
    #10; // Wait for clock edge
    if (q !== 1) $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);

    // Test case 5: Invalid condition (s=1, r=1)
    s = 1; r = 1;
    #10; // Wait for clock edge
    if (q !== 1'bx) $display("FAIL: Test case 5 failed, expected q=x, got q=%b", q);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule