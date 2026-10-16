`timescale 1ns/1ps

module tb_binary_grey;

  reg [3:0] binary;
  wire [3:0] Grey;

  // Instantiate the module under test (uut)
  binary_grey uut (
    .binary(binary),
    .Grey(Grey)
  );

  initial begin
    // Test cases
    binary = 4'b0000; #10;
    if (Grey !== 4'b0000) begin
      $display("FAIL: Test case binary=0000 failed, expected Grey=0000, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0001; #10;
    if (Grey !== 4'b0001) begin
      $display("FAIL: Test case binary=0001 failed, expected Grey=0001, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0010; #10;
    if (Grey !== 4'b0011) begin
      $display("FAIL: Test case binary=0010 failed, expected Grey=0011, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0011; #10;
    if (Grey !== 4'b0010) begin
      $display("FAIL: Test case binary=0011 failed, expected Grey=0010, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0100; #10;
    if (Grey !== 4'b0110) begin
      $display("FAIL: Test case binary=0100 failed, expected Grey=0110, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0101; #10;
    if (Grey !== 4'b0111) begin
      $display("FAIL: Test case binary=0101 failed, expected Grey=0111, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0110; #10;
    if (Grey !== 4'b0101) begin
      $display("FAIL: Test case binary=0110 failed, expected Grey=0101, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b0111; #10;
    if (Grey !== 4'b0100) begin
      $display("FAIL: Test case binary=0111 failed, expected Grey=0100, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1000; #10;
    if (Grey !== 4'b1100) begin
      $display("FAIL: Test case binary=1000 failed, expected Grey=1100, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1001; #10;
    if (Grey !== 4'b1101) begin
      $display("FAIL: Test case binary=1001 failed, expected Grey=1101, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1010; #10;
    if (Grey !== 4'b1111) begin
      $display("FAIL: Test case binary=1010 failed, expected Grey=1111, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1011; #10;
    if (Grey !== 4'b1110) begin
      $display("FAIL: Test case binary=1011 failed, expected Grey=1110, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1100; #10;
    if (Grey !== 4'b1010) begin
      $display("FAIL: Test case binary=1100 failed, expected Grey=1010, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1101; #10;
    if (Grey !== 4'b1011) begin
      $display("FAIL: Test case binary=1101 failed, expected Grey=1011, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1110; #10;
    if (Grey !== 4'b1001) begin
      $display("FAIL: Test case binary=1110 failed, expected Grey=1001, got Grey=%b", Grey);
      $finish;
    end

    binary = 4'b1111; #10;
    if (Grey !== 4'b1000) begin
      $display("FAIL: Test case binary=1111 failed, expected Grey=1000, got Grey=%b", Grey);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule