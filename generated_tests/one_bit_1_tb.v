`timescale 1ns/1ps

module tb_one_bit;

  // Inputs
  reg a;
  reg cin;

  // Outputs
  wire sum;
  wire c1;

  // Instantiate the module under test (uut)
  one_bit uut (
    .sum(sum),
    .c1(c1),
    .a(a),
    .cin(cin)
  );

  initial begin
    // Test case 1: a = 0, cin = 0
    a = 0; cin = 0;
    #10;
    if (sum !== 0 || c1 !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, cin=0)");
      $finish;
    end

    // Test case 2: a = 0, cin = 1
    a = 0; cin = 1;
    #10;
    if (sum !== 1 || c1 !== 0) begin
      $display("FAIL: Test case 2 failed (a=0, cin=1)");
      $finish;
    end

    // Test case 3: a = 1, cin = 0
    a = 1; cin = 0;
    #10;
    if (sum !== 1 || c1 !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, cin=0)");
      $finish;
    end

    // Test case 4: a = 1, cin = 1
    a = 1; cin = 1;
    #10;
    if (sum !== 0 || c1 !== 1) begin
      $display("FAIL: Test case 4 failed (a=1, cin=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule