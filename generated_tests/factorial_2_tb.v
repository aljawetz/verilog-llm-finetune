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

    // Test case 6: Factorial of 5 (out of range, should not be tested)
    n = 4'b0101; #10;
    if (result !== 32'd120) begin
      $display("FAIL: Expected 120 for factorial(5), got %d", result);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule