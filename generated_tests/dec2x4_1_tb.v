`timescale 1ns/1ps

module tb_dec2x4;

  reg [1:0] a;
  reg En;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  dec2x4 uut (
    .y(y),
    .a(a),
    .En(En)
  );

  initial begin
    // Test case 1: Enable is low, output should be 0000
    En = 0; a = 2'b00; #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", y);
      $finish;
    end

    // Test case 2: Enable is high, a = 00, output should be 0001
    En = 1; a = 2'b00; #10;
    if (y !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", y);
      $finish;
    end

    // Test case 3: Enable is high, a = 01, output should be 0010
    a = 2'b01; #10;
    if (y !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 0010, got %b", y);
      $finish;
    end

    // Test case 4: Enable is high, a = 10, output should be 0100
    a = 2'b10; #10;
    if (y !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected 0100, got %b", y);
      $finish;
    end

    // Test case 5: Enable is high, a = 11, output should be 1000
    a = 2'b11; #10;
    if (y !== 4'b1000) begin
      $display("FAIL: Test case 5 failed, expected 1000, got %b", y);
      $finish;
    end

    // Test case 6: Enable is low again, output should be 0000
    En = 0; #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 0000, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule