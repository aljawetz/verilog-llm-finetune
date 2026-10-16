`timescale 1ns/1ps

module tb_srflipflop;
  reg s, r, clk, rst;
  wire q, qbar;

  // Instantiate the SR Flip-Flop
  srflipflop uut (
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
    rst = 1; s = 0; r = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test case 1: Set the flip-flop
    s = 1; r = 0; #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 1 failed - Expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 2: Reset the flip-flop
    s = 0; r = 1; #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 2 failed - Expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 3: Hold state
    s = 0; r = 0; #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 3 failed - Expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 4 failed - Expected q=1, qbar=0, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 5: Invalid state
    s = 1; r = 1; #10;
    if (q !== 1'bx || qbar !== 1'bx) begin
      $display("FAIL: Test case 5 failed - Expected q=x, qbar=x, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 6: Reset again
    s = 0; r = 1; #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 6 failed - Expected q=0, qbar=1, got q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule