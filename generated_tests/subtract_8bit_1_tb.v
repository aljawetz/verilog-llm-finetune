`timescale 1ns/1ps

module tb_subtract_8bit;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] result;

  // Instantiate the module under test (uut)
  subtract_8bit uut (
    .a(a),
    .b(b),
    .result(result)
  );

  initial begin
    // Test case 1: 10 - 5 = 5
    a = 8'd10; b = 8'd5;
    #10;
    if (result !== 8'd5) begin
      $display("FAIL: Test case 1 failed, expected 5 but got %d", result);
      $finish;
    end

    // Test case 2: 20 - 15 = 5
    a = 8'd20; b = 8'd15;
    #10;
    if (result !== 8'd5) begin
      $display("FAIL: Test case 2 failed, expected 5 but got %d", result);
      $finish;
    end

    // Test case 3: 5 - 10 = -5 (in 8-bit two's complement, this is 251)
    a = 8'd5; b = 8'd10;
    #10;
    if (result !== 8'd251) begin
      $display("FAIL: Test case 3 failed, expected 251 but got %d", result);
      $finish;
    end

    // Test case 4: 0 - 1 = -1 (in 8-bit two's complement, this is 255)
    a = 8'd0; b = 8'd1;
    #10;
    if (result !== 8'd255) begin
      $display("FAIL: Test case 4 failed, expected 255 but got %d", result);
      $finish;
    end

    // Test case 5: 255 - 1 = 254
    a = 8'd255; b = 8'd1;
    #10;
    if (result !== 8'd254) begin
      $display("FAIL: Test case 5 failed, expected 254 but got %d", result);
      $finish;
    end

    // Test case 6: 128 - 128 = 0
    a = 8'd128; b = 8'd128;
    #10;
    if (result !== 8'd0) begin
      $display("FAIL: Test case 6 failed, expected 0 but got %d", result);
      $finish;
    end

    // Test case 7: 100 - 50 = 50
    a = 8'd100; b = 8'd50;
    #10;
    if (result !== 8'd50) begin
      $display("FAIL: Test case 7 failed, expected 50 but got %d", result);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule