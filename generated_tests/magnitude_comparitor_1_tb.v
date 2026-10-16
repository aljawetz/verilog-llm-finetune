`timescale 1ns/1ps

module tb_magnitude_comparitor;

  reg [3:0] a;
  reg [3:0] b;
  wire A_less_B;
  wire A_great_B;
  wire A_equal_B;

  // Instantiate the module under test
  magnitude_comparitor uut (
    .a(a),
    .b(b),
    .A_less_B(A_less_B),
    .A_great_B(A_great_B),
    .A_equal_B(A_equal_B)
  );

  initial begin
    // Test case 1: a < b
    a = 4'b0010; // 2
    b = 4'b0100; // 4
    #10;
    if (A_less_B !== 1'b1 || A_great_B !== 1'b0 || A_equal_B !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a > b
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    #10;
    if (A_less_B !== 1'b0 || A_great_B !== 1'b1 || A_equal_B !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 4'b0101; // 5
    b = 4'b0101; // 5
    #10;
    if (A_less_B !== 1'b0 || A_great_B !== 1'b0 || A_equal_B !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b (edge case)
    a = 4'b0000; // 0
    b = 4'b0001; // 1
    #10;
    if (A_less_B !== 1'b1 || A_great_B !== 1'b0 || A_equal_B !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a > b (edge case)
    a = 4'b1111; // 15
    b = 4'b0000; // 0
    #10;
    if (A_less_B !== 1'b0 || A_great_B !== 1'b1 || A_equal_B !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule