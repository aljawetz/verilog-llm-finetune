`timescale 1ns/1ps

module tb_base_and_or;

  reg [3:0] aIn;
  reg [3:0] bIn;
  reg doAnd;
  reg doOr;
  wire isAnd;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  base_and_or uut (
    .aIn(aIn),
    .bIn(bIn),
    .doAnd(doAnd),
    .doOr(doOr),
    .isAnd(isAnd),
    .out(out)
  );

  initial begin
    // Test case 1: AND operation
    aIn = 4'b1100; bIn = 4'b1010; doAnd = 1; doOr = 0;
    #10;
    if (out !== 4'b1000 || isAnd !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: OR operation
    aIn = 4'b1100; bIn = 4'b1010; doAnd = 0; doOr = 1;
    #10;
    if (out !== 4'b1110 || isAnd !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Both doAnd and doOr are high
    aIn = 4'b1100; bIn = 4'b1010; doAnd = 1; doOr = 1;
    #10;
    if (out !== 4'b0000 || isAnd !== 1'bx) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Both doAnd and doOr are low
    aIn = 4'b1100; bIn = 4'b1010; doAnd = 0; doOr = 0;
    #10;
    if (out !== 4'b0000 || isAnd !== 1'bx) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule