`timescale 1ns/1ps

module tb_sr_ff;
  reg clk;
  reg reset;
  reg s;
  reg r;
  wire q;
  wire qbar;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
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
    reset = 0; // Deactivate reset
    #10;
    if (q !== 0) begin
      $display("FAIL: Initial state after reset is not 0");
      $finish;
    end

    // Test setting the flip-flop
    s = 1; r = 0; // Set
    #10;
    if (q !== 1) begin
      $display("FAIL: q should be 1 after setting");
      $finish;
    end

    // Test holding the state
    s = 0; r = 0; // Hold
    #10;
    if (q !== 1) begin
      $display("FAIL: q should still be 1 after holding");
      $finish;
    end

    // Test resetting the flip-flop
    s = 0; r = 1; // Reset
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after resetting");
      $finish;
    end

    // Test undefined state
    s = 1; r = 1; // Undefined state
    #10;
    if (q !== 1'bx) begin
      $display("FAIL: q should be undefined after setting both s and r");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule