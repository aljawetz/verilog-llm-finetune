`timescale 1ns/1ps

module tb_factorial;

  reg [3:0] n;
  wire [7:0] result;
  
  // Instantiate the module under test (uut)
  factorial uut (
    .n(n),
    .result(result)
  );

  initial begin
    // Test cases
    n = 4'b0000; // 0! = 1
    #10;
    if (result !== 8'd1) begin
      $display("FAIL: Expected 1 for n=0, got %d", result);
      $finish;
    end

    n = 4'b0001; // 1! = 1
    #10;
    if (result !== 8'd1) begin
      $display("FAIL: Expected 1 for n=1, got %d", result);
      $finish;
    end

    n = 4'b0010; // 2! = 2
    #10;
    if (result !== 8'd2) begin
      $display("FAIL: Expected 2 for n=2, got %d", result);
      $finish;
    end

    n = 4'b0011; // 3! = 6
    #10;
    if (result !== 8'd6) begin
      $display("FAIL: Expected 6 for n=3, got %d", result);
      $finish;
    end

    n = 4'b0100; // 4! = 24
    #10;
    if (result !== 8'd24) begin
      $display("FAIL: Expected 24 for n=4, got %d", result);
      $finish;
    end

    // Additional test case for maximum input
    n = 4'b0101; // 5! = 120
    #10;
    if (result !== 8'd120) begin
      $display("FAIL: Expected 120 for n=5, got %d", result);
      $finish;
    end

    // Test case for input greater than 4 (should not be used in this module)
    n = 4'b1111; // 15! is out of range for 8 bits, but we won't check it
    #10;

    $display("PASS");
    $finish;
  end

endmodule