`timescale 1ns/1ps

module tb_full_adder;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire s;
  wire co;

  // Instantiate the Unit Under Test (UUT)
  full_adder uut (
    .a(a),
    .b(b),
    .c(c),
    .s(s),
    .co(co)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, co = 0
    a = 0; b = 0; c = 0;
    #10;
    if (s !== 0 || co !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, co = 0
    a = 0; b = 0; c = 1;
    #10;
    if (s !== 1 || co !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, co = 0
    a = 0; b = 1; c = 0;
    #10;
    if (s !== 1 || co !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, co = 1
    a = 0; b = 1; c = 1;
    #10;
    if (s !== 0 || co !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, co = 0
    a = 1; b = 0; c = 0;
    #10;
    if (s !== 1 || co !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, co = 1
    a = 1; b = 0; c = 1;
    #10;
    if (s !== 0 || co !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, co = 1
    a = 1; b = 1; c = 0;
    #10;
    if (s !== 0 || co !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, co = 1
    a = 1; b = 1; c = 1;
    #10;
    if (s !== 1 || co !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule