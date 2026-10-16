`timescale 1ns/1ps

module tb_sr;

  reg s, r, rst, clk;
  wire q, qbar;

  // Instantiate the SR flip-flop
  sr uut (
    .s(s),
    .r(r),
    .rst(rst),
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
    rst = 1;
    s = 0;
    r = 0;

    // Test 1: Reset the flip-flop
    rst = 0; #10; // Active-low reset
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Reset did not clear outputs");
      $finish;
    end

    // Test 2: Set the flip-flop
    rst = 1; s = 1; r = 0; #10; // Set condition
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Set did not set outputs");
      $finish;
    end

    // Test 3: Reset the flip-flop again
    s = 0; r = 0; #10; // Maintain state
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Maintain state failed");
      $finish;
    end

    // Test 4: Reset the flip-flop
    rst = 0; #10; // Active-low reset
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Reset did not clear outputs");
      $finish;
    end

    // Test 5: Force an unknown state
    rst = 1; s = 1; r = 1; #10; // Invalid condition
    if (q !== 1'bx || qbar !== 1'bx) begin
      $display("FAIL: Invalid state did not result in unknown outputs");
      $finish;
    end

    // Test 6: Set again
    s = 1; r = 0; #10; // Set condition
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Set did not set outputs");
      $finish;
    end

    // Test 7: Reset again
    rst = 0; #10; // Active-low reset
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Reset did not clear outputs");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule