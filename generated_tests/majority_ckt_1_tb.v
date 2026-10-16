`timescale 1ns/1ps

module tb_majority_ckt;

  reg [4:0] x;
  wire z;

  // Instantiate the module under test (uut)
  majority_ckt uut (
    .x(x),
    .z(z)
  );

  initial begin
    // Test cases
    // Test case 1: 00000 -> z should be 0
    x = 5'b00000; #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 2: 00001 -> z should be 0
    x = 5'b00001; #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 3: 00011 -> z should be 0
    x = 5'b00011; #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 4: 00111 -> z should be 1
    x = 5'b00111; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 5: 01111 -> z should be 1
    x = 5'b01111; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 6: 11111 -> z should be 1
    x = 5'b11111; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 7: 11010 -> z should be 1
    x = 5'b11010; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 7 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 8: 10100 -> z should be 0
    x = 5'b10100; #10;
    if (z !== 1'b0) begin
      $display("FAIL: Test case 8 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 9: 11100 -> z should be 1
    x = 5'b11100; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 9 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 10: 10011 -> z should be 1
    x = 5'b10011; #10;
    if (z !== 1'b1) begin
      $display("FAIL: Test case 10 failed, expected z=1, got z=%b", z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule