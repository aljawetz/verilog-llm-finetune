`timescale 1ns/1ps

module tb_binary_to_gray;

  reg [3:0] binary;
  wire [3:0] gray;

  // Instantiate the module under test (uut)
  binary_to_gray uut (
    .binary(binary),
    .gray(gray)
  );

  initial begin
    // Test cases
    binary = 4'b0000; #10;
    if (gray !== 4'b0000) begin
      $display("FAIL: Test case binary=0000 failed, expected gray=0000, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0001; #10;
    if (gray !== 4'b0001) begin
      $display("FAIL: Test case binary=0001 failed, expected gray=0001, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0010; #10;
    if (gray !== 4'b0011) begin
      $display("FAIL: Test case binary=0010 failed, expected gray=0011, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0011; #10;
    if (gray !== 4'b0010) begin
      $display("FAIL: Test case binary=0011 failed, expected gray=0010, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0100; #10;
    if (gray !== 4'b0110) begin
      $display("FAIL: Test case binary=0100 failed, expected gray=0110, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0101; #10;
    if (gray !== 4'b0111) begin
      $display("FAIL: Test case binary=0101 failed, expected gray=0111, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0110; #10;
    if (gray !== 4'b0101) begin
      $display("FAIL: Test case binary=0110 failed, expected gray=0101, got gray=%b", gray);
      $finish;
    end

    binary = 4'b0111; #10;
    if (gray !== 4'b0100) begin
      $display("FAIL: Test case binary=0111 failed, expected gray=0100, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1000; #10;
    if (gray !== 4'b1100) begin
      $display("FAIL: Test case binary=1000 failed, expected gray=1100, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1001; #10;
    if (gray !== 4'b1101) begin
      $display("FAIL: Test case binary=1001 failed, expected gray=1101, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1010; #10;
    if (gray !== 4'b1111) begin
      $display("FAIL: Test case binary=1010 failed, expected gray=1111, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1011; #10;
    if (gray !== 4'b1110) begin
      $display("FAIL: Test case binary=1011 failed, expected gray=1110, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1100; #10;
    if (gray !== 4'b1010) begin
      $display("FAIL: Test case binary=1100 failed, expected gray=1010, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1101; #10;
    if (gray !== 4'b1011) begin
      $display("FAIL: Test case binary=1101 failed, expected gray=1011, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1110; #10;
    if (gray !== 4'b1001) begin
      $display("FAIL: Test case binary=1110 failed, expected gray=1001, got gray=%b", gray);
      $finish;
    end

    binary = 4'b1111; #10;
    if (gray !== 4'b1000) begin
      $display("FAIL: Test case binary=1111 failed, expected gray=1000, got gray=%b", gray);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule