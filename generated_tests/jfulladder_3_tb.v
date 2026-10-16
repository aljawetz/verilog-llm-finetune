`timescale 1ns/1ps

module tb_jfulladder;

  // Inputs
  reg a;
  reg b;
  reg carryin;

  // Outputs
  wire y;
  wire carryout;

  // Instantiate the Unit Under Test (UUT)
  jfulladder uut (
    .y(y),
    .carryout(carryout),
    .a(a),
    .b(b),
    .carryin(carryin)
  );

  initial begin
    // Test Case 1: 0 + 0 + 0 = 0, carryout = 0
    a = 0; b = 0; carryin = 0;
    #10;
    if (y !== 0 || carryout !== 0) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2: 0 + 0 + 1 = 1, carryout = 0
    a = 0; b = 0; carryin = 1;
    #10;
    if (y !== 1 || carryout !== 0) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3: 0 + 1 + 0 = 1, carryout = 0
    a = 0; b = 1; carryin = 0;
    #10;
    if (y !== 1 || carryout !== 0) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // Test Case 4: 0 + 1 + 1 = 0, carryout = 1
    a = 0; b = 1; carryin = 1;
    #10;
    if (y !== 0 || carryout !== 1) begin
      $display("FAIL: Test Case 4 failed");
      $finish;
    end

    // Test Case 5: 1 + 0 + 0 = 1, carryout = 0
    a = 1; b = 0; carryin = 0;
    #10;
    if (y !== 1 || carryout !== 0) begin
      $display("FAIL: Test Case 5 failed");
      $finish;
    end

    // Test Case 6: 1 + 0 + 1 = 0, carryout = 1
    a = 1; b = 0; carryin = 1;
    #10;
    if (y !== 0 || carryout !== 1) begin
      $display("FAIL: Test Case 6 failed");
      $finish;
    end

    // Test Case 7: 1 + 1 + 0 = 0, carryout = 1
    a = 1; b = 1; carryin = 0;
    #10;
    if (y !== 0 || carryout !== 1) begin
      $display("FAIL: Test Case 7 failed");
      $finish;
    end

    // Test Case 8: 1 + 1 + 1 = 1, carryout = 1
    a = 1; b = 1; carryin = 1;
    #10;
    if (y !== 1 || carryout !== 1) begin
      $display("FAIL: Test Case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule