`timescale 1ns/1ps

module tb_sr_latch;
  reg S;
  reg R;
  wire Q;
  wire Q_not;

  // Instantiate the SR Latch
  sr_latch uut (
    .S(S),
    .R(R),
    .Q(Q),
    .Q_not(Q_not)
  );

  initial begin
    // Initialize inputs
    S = 0;
    R = 0;

    // Test case 1: Set condition (S=1, R=0)
    S = 1; R = 0;
    #10;
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Test case 1 failed (Set condition)");
      $finish;
    end

    // Test case 2: Reset condition (S=0, R=1)
    S = 0; R = 1;
    #10;
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 2 failed (Reset condition)");
      $finish;
    end

    // Test case 3: Hold condition (S=0, R=0)
    S = 0; R = 0;
    #10;
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 3 failed (Hold condition)");
      $finish;
    end

    // Test case 4: Set again (S=1, R=0)
    S = 1; R = 0;
    #10;
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Test case 4 failed (Set condition again)");
      $finish;
    end

    // Test case 5: Reset again (S=0, R=1)
    S = 0; R = 1;
    #10;
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 5 failed (Reset condition again)");
      $finish;
    end

    // Final check for hold condition
    S = 0; R = 0;
    #10;
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Final hold condition failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule