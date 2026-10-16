`timescale 1ns/1ps

module tb_add_12bit;
  reg [11:0] a;
  reg [11:0] b;
  wire [11:0] sum;

  // Instantiate the module under test (uut)
  add_12bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: Simple addition
    a = 12'd5; b = 12'd10; #10;
    if (sum !== 12'd15) begin
      $display("FAIL: Test case 1 failed, expected 15 but got %d", sum);
      $finish;
    end

    // Test case 2: Adding zeros
    a = 12'd0; b = 12'd0; #10;
    if (sum !== 12'd0) begin
      $display("FAIL: Test case 2 failed, expected 0 but got %d", sum);
      $finish;
    end

    // Test case 3: Maximum values
    a = 12'd4095; b = 12'd1; #10;
    if (sum !== 12'd0) begin
      $display("FAIL: Test case 3 failed, expected 0 (overflow) but got %d", sum);
      $finish;
    end

    // Test case 4: Random values
    a = 12'd1234; b = 12'd567; #10;
    if (sum !== 12'd1801) begin
      $display("FAIL: Test case 4 failed, expected 1801 but got %d", sum);
      $finish;
    end

    // Test case 5: Another random addition
    a = 12'd2048; b = 12'd1024; #10;
    if (sum !== 12'd3072) begin
      $display("FAIL: Test case 5 failed, expected 3072 but got %d", sum);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule