`timescale 1ns/1ps

module tb_add_6bit;

  reg [5:0] a;
  reg [5:0] b;
  wire [5:0] sum;

  // Instantiate the module under test (uut)
  add_6bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    a = 6'b000000; b = 6'b000000;
    #10;
    if (sum !== 6'b000000) begin
      $display("FAIL: Test case 1 failed, expected 0 but got %b", sum);
      $finish;
    end

    // Test case 2: 1 + 1 = 2
    a = 6'b000001; b = 6'b000001;
    #10;
    if (sum !== 6'b000010) begin
      $display("FAIL: Test case 2 failed, expected 2 but got %b", sum);
      $finish;
    end

    // Test case 3: 15 + 1 = 16
    a = 6'b001111; b = 6'b000001;
    #10;
    if (sum !== 6'b010000) begin
      $display("FAIL: Test case 3 failed, expected 16 but got %b", sum);
      $finish;
    end

    // Test case 4: 32 + 32 = 0 (overflow)
    a = 6'b100000; b = 6'b100000;
    #10;
    if (sum !== 6'b000000) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %b", sum);
      $finish;
    end

    // Test case 5: 20 + 10 = 30
    a = 6'b010100; b = 6'b001010;
    #10;
    if (sum !== 6'b011110) begin
      $display("FAIL: Test case 5 failed, expected 30 but got %b", sum);
      $finish;
    end

    // Test case 6: 63 + 1 = 0 (overflow)
    a = 6'b111111; b = 6'b000001;
    #10;
    if (sum !== 6'b000000) begin
      $display("FAIL: Test case 6 failed, expected 0 but got %b", sum);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule