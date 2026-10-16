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
    S = 0; R = 0; EN = 0;

    // Test 1: Hold state when EN=0
    #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Initial state should be undefined when EN=0");
      $finish;
    end

    // Enable the latch
    EN = 1;

    // Test 2: Set state
    S = 1; R = 0; 
    #10;
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Expected Q=1, Qn=0 when S=1, R=0, EN=1");
      $finish;
    end

    // Test 3: Hold state
    S = 0; R = 0; 
    #10;
    if (Q !== 1 || Qn !== 0) begin
      $display("FAIL: Expected Q=1, Qn=0 when S=0, R=0, EN=1");
      $finish;
    end

    // Test 4: Reset state
    S = 0; R = 1; 
    #10;
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Expected Q=0, Qn=1 when S=0, R=1, EN=1");
      $finish;
    end

    // Test 5: Hold state
    S = 0; R = 0; 
    #10;
    if (Q !== 0 || Qn !== 1) begin
      $display("FAIL: Expected Q=0, Qn=1 when S=0, R=0, EN=1");
      $finish;
    end

    // Test 6: Invalid state
    S = 1; R = 1; 
    #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q=undefined, Qn=undefined when S=1, R=1, EN=1");
      $finish;
    end

    // Test 7: Check hold state after invalid
    S = 0; R = 0; 
    #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q=undefined, Qn=undefined when S=0, R=0, EN=1 after invalid state");
      $finish;
    end

    // Test 8: Reset latch
    EN = 0; S = 0; R = 1; 
    #10;
    if (Q !== 1'bx || Qn !== 1'bx) begin
      $display("FAIL: Expected Q=undefined, Qn=undefined when EN=0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule