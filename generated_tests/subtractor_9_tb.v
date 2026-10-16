`timescale 1ns/1ps

module tb_subtractor;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] diff_result;

  // Instantiate the module under test (uut)
  subtractor uut (
    .a(a),
    .b(b),
    .diff_result(diff_result)
  );

  initial begin
    // Test case 1: Simple subtraction
    a = 8'd10; b = 8'd5; #10;
    if (diff_result !== 8'd5) begin
      $display("FAIL: Test case 1 failed, expected 5 but got %d", diff_result);
      $finish;
    end

    // Test case 2: Subtracting zero
    a = 8'd20; b = 8'd0; #10;
    if (diff_result !== 8'd20) begin
      $display("FAIL: Test case 2 failed, expected 20 but got %d", diff_result);
      $finish;
    end

    // Test case 3: Subtracting equal values
    a = 8'd15; b = 8'd15; #10;
    if (diff_result !== 8'd0) begin
      $display("FAIL: Test case 3 failed, expected 0 but got %d", diff_result);
      $finish;
    end

    // Test case 4: Negative result (underflow)
    a = 8'd5; b = 8'd10; #10;
    if (diff_result !== 8'd251) begin // 8-bit underflow wraps around
      $display("FAIL: Test case 4 failed, expected 251 but got %d", diff_result);
      $finish;
    end

    // Test case 5: Maximum values
    a = 8'd255; b = 8'd1; #10;
    if (diff_result !== 8'd254) begin
      $display("FAIL: Test case 5 failed, expected 254 but got %d", diff_result);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule