`timescale 1ns/1ps

module tb_sr_ff_sync_r;

  reg s;
  reg r;
  reg reset;
  reg clk;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  sr_ff_sync_r uut (
    .s(s),
    .r(r),
    .reset(reset),
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
    // Initialize signals
    reset = 1;
    s = 0;
    r = 0;

    // Apply reset
    #10;
    reset = 0; // Release reset

    // Test case 1: Set condition
    s = 1; r = 0; 
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 1 failed (Set condition)");
      $finish;
    end

    // Test case 2: Reset condition
    s = 0; r = 1; 
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 2 failed (Reset condition)");
      $finish;
    end

    // Test case 3: Hold condition
    s = 0; r = 0; 
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 3 failed (Hold condition after reset)");
      $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; 
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 4 failed (Set again)");
      $finish;
    end

    // Test case 5: Invalid condition
    s = 1; r = 1; 
    #10;
    if (q !== 1'bx || qbar !== 1'bx) begin
      $display("FAIL: Test case 5 failed (Invalid condition)");
      $finish;
    end

    // Test case 6: Reset again
    s = 0; r = 1; 
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 6 failed (Reset again)");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule