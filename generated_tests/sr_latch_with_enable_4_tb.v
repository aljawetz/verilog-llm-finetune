`timescale 1ns/1ps

module tb_sr_latch_with_enable;

  reg S;
  reg R;
  reg EN;
  wire Q;
  wire Qn;

  // Instantiate the SR latch with enable
  sr_latch_with_enable uut (
    .S(S),
    .R(R),
    .EN(EN),
    .Q(Q),
    .Qn(Qn)
  );

  initial begin
    // Test case 1: EN = 1, S = 0, R = 0 (Hold state)
    EN = 1; S = 0; R = 0; #10;
    if (Q !== 1'bx && Qn !== 1'bx) begin
      $display("FAIL: Initial state should hold");
      $finish;
    end

    // Test case 2: EN = 1, S = 0, R = 1 (Reset)
    S = 0; R = 1; #10;
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Expected Q = 0, Qn = 1 after reset");
      $finish;
    end

    // Test case 3: EN = 1, S = 1, R = 0 (Set)
    S = 1; R = 0; #10;
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Expected Q = 1, Qn = 0 after set");
      $finish;
    end

    // Test case 4: EN = 1, S = 1, R = 1 (Undefined state)
    S = 1; R = 1; #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q = x, Qn = x for undefined state");
      $finish;
    end

    // Test case 5: EN = 0, S = 0, R = 0 (Hold state)
    EN = 0; S = 0; R = 0; #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q = x, Qn = x when EN = 0");
      $finish;
    end

    // Test case 6: EN = 0, S = 0, R = 1 (Should not change)
    S = 0; R = 1; #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q = x, Qn = x when EN = 0");
      $finish;
    end

    // Test case 7: EN = 0, S = 1, R = 0 (Should not change)
    S = 1; R = 0; #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q = x, Qn = x when EN = 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule