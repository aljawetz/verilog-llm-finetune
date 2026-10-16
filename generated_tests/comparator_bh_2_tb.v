`timescale 1ns/1ps

module tb_comparator_bh;

  reg [3:0] a;
  reg [3:0] b;
  wire equal;
  wire grt;
  wire lst;

  // Instantiate the module under test (uut)
  comparator_bh uut (
    .a(a),
    .b(b),
    .equal(equal),
    .grt(grt),
    .lst(lst)
  );

  initial begin
    // Test case 1: a < b
    a = 4'b0010; // 2
    b = 4'b0100; // 4
    #10;
    if (equal !== 0 || grt !== 0 || lst !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a > b
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    #10;
    if (equal !== 0 || grt !== 1 || lst !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 4'b0101; // 5
    b = 4'b0101; // 5
    #10;
    if (equal !== 1 || grt !== 0 || lst !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b (boundary case)
    a = 4'b0000; // 0
    b = 4'b0001; // 1
    #10;
    if (equal !== 0 || grt !== 0 || lst !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a > b (boundary case)
    a = 4'b1111; // 15
    b = 4'b1110; // 14
    #10;
    if (equal !== 0 || grt !== 1 || lst !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b (boundary case)
    a = 4'b0000; // 0
    b = 4'b0000; // 0
    #10;
    if (equal !== 1 || grt !== 0 || lst !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule