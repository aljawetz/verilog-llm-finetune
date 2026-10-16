`timescale 1ns/1ps

module tb_sr_latch_with_enable;

  reg S;
  reg R;
  reg EN;
  wire Q;
  wire Qn;

  // Instantiate the module under test (uut)
  sr_latch_with_enable uut (
    .S(S),
    .R(R),
    .EN(EN),
    .Q(Q),
    .Qn(Qn)
  );

  initial begin
    // Initialize signals
    S = 0;
    R = 0;
    EN = 0;

    // Test sequence
    // Test 1: EN = 0, should hold previous state (undefined)
    #10 EN = 0; S = 1; R = 0; // Should not change Q
    #10 if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected undefined outputs when EN is low");
      $finish;
    end

    // Test 2: EN = 1, S = 0, R = 1 (reset)
    #10 EN = 1; S = 0; R = 1; // Q should be 0, Qn should be 1
    #10 if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Expected Q=0, Qn=1 for S=0, R=1 with EN=1");
      $finish;
    end

    // Test 3: EN = 1, S = 1, R = 0 (set)
    #10 S = 1; R = 0; // Q should be 1, Qn should be 0
    #10 if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Expected Q=1, Qn=0 for S=1, R=0 with EN=1");
      $finish;
    end

    // Test 4: EN = 1, S = 0, R = 0 (hold state)
    #10 S = 0; R = 0; // Q should hold previous state (1)
    #10 if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Expected Q=1, Qn=0 for hold state with EN=1");
      $finish;
    end

    // Test 5: EN = 1, S = 1, R = 1 (undefined)
    #10 S = 1; R = 1; // Q should be undefined
    #10 if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected undefined outputs for S=1, R=1 with EN=1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule