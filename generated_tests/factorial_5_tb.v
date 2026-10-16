`timescale 1ns/1ps

module tb_factorial;

  reg [3:0] n;
  wire [31:0] result;
  
  // Instantiate the module under test (uut)
  factorial uut (
    .n(n),
    .result(result)
  );

  initial begin
    // Test case 1: Factorial of 0
    n = 4'b0000; #10;
    if (result !== 32'd1) begin
      $display("FAIL: Expected 1 for factorial(0), got %d", result);
      $finish;
    end

    // Test case 2: Factorial of 1
    n = 4'b0001; #10;
    if (result !== 32'd1) begin
      $display("FAIL: Expected 1 for factorial(1), got %d", result);
      $finish;
    end

    // Test case 3: Factorial of 2
    n = 4'b0010; #10;
    if (result !== 32'd2) begin
      $display("FAIL: Expected 2 for factorial(2), got %d", result);
      $finish;
    end

    // Test case 4: Factorial of 3
    n = 4'b0011; #10;
    if (result !== 32'd6) begin
      $display("FAIL: Expected 6 for factorial(3), got %d", result);
      $finish;
    end

    // Test case 5: Factorial of 4
    n = 4'b0100; #10;
    if (result !== 32'd24) begin
      $display("FAIL: Expected 24 for factorial(4), got %d", result);
      $finish;
    end

    // Test case 6: Factorial of 5
    n = 4'b0101; #10;
    if (result !== 32'd120) begin
      $display("FAIL: Expected 120 for factorial(5), got %d", result);
      $finish;
    end

    // Test case 7: Factorial of 6
    n = 4'b0110; #10;
    if (result !== 32'd720) begin
      $display("FAIL: Expected 720 for factorial(6), got %d", result);
      $finish;
    end

    // Test case 8: Factorial of 7
    n = 4'b0111; #10;
    if (result !== 32'd5040) begin
      $display("FAIL: Expected 5040 for factorial(7), got %d", result);
      $finish;
    end

    // Test case 9: Factorial of 8
    n = 4'b1000; #10;
    if (result !== 32'd40320) begin
      $display("FAIL: Expected 40320 for factorial(8), got %d", result);
      $finish;
    end

    // Test case 10: Factorial of 9
    n = 4'b1001; #10;
    if (result !== 32'd362880) begin
      $display("FAIL: Expected 362880 for factorial(9), got %d", result);
      $finish;
    end

    // Test case 11: Factorial of 10
    n = 4'b1010; #10;
    if (result !== 32'd3628800) begin
      $display("FAIL: Expected 3628800 for factorial(10), got %d", result);
      $finish;
    end

    // Test case 12: Factorial of 11
    n = 4'b1011; #10;
    if (result !== 32'd39916800) begin
      $display("FAIL: Expected 39916800 for factorial(11), got %d", result);
      $finish;
    end

    // Test case 13: Factorial of 12
    n = 4'b1100; #10;
    if (result !== 32'd479001600) begin
      $display("FAIL: Expected 479001600 for factorial(12), got %d", result);
      $finish;
    end

    // Test case 14: Factorial of 13
    n = 4'b1101; #10;
    if (result !== 32'd6227020800) begin
      $display("FAIL: Expected 6227020800 for factorial(13), got %d", result);
      $finish;
    end

    // Test case 15: Factorial of 14
    n = 4'b1110; #10;
    if (result !== 32'd87178291200) begin
      $display("FAIL: Expected 87178291200 for factorial(14), got %d", result);
      $finish;
    end

    // Test case 16: Factorial of 15
    n = 4'b1111; #10;
    if (result !== 32'd1307674368000) begin
      $display("FAIL: Expected 1307674368000 for factorial(15), got %d", result);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule