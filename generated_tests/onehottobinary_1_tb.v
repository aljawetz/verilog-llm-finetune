`timescale 1ns/1ps

module tb_onehottobinary;

  reg [3:0] binary_in;
  wire [15:0] onehot_out;

  // Instantiate the module under test (uut)
  onehottobinary uut (
    .binary_in(binary_in),
    .onehot_out(onehot_out)
  );

  initial begin
    // Test sequence
    // Test case 0: binary_in = 0
    binary_in = 4'b0000; #10;
    if (onehot_out !== 16'b0000000000000001) begin
      $display("FAIL: Test case 0 failed");
      $finish;
    end

    // Test case 1: binary_in = 1
    binary_in = 4'b0001; #10;
    if (onehot_out !== 16'b0000000000000010) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: binary_in = 2
    binary_in = 4'b0010; #10;
    if (onehot_out !== 16'b0000000000000100) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: binary_in = 3
    binary_in = 4'b0011; #10;
    if (onehot_out !== 16'b0000000000001000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: binary_in = 4
    binary_in = 4'b0100; #10;
    if (onehot_out !== 16'b0000000000010000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: binary_in = 5
    binary_in = 4'b0101; #10;
    if (onehot_out !== 16'b0000000000100000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: binary_in = 6
    binary_in = 4'b0110; #10;
    if (onehot_out !== 16'b0000000001000000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: binary_in = 7
    binary_in = 4'b0111; #10;
    if (onehot_out !== 16'b0000000010000000) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: binary_in = 8
    binary_in = 4'b1000; #10;
    if (onehot_out !== 16'b0000000100000000) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // Test case 9: binary_in = 9
    binary_in = 4'b1001; #10;
    if (onehot_out !== 16'b0000001000000000) begin
      $display("FAIL: Test case 9 failed");
      $finish;
    end

    // Test case 10: binary_in = 10
    binary_in = 4'b1010; #10;
    if (onehot_out !== 16'b0000010000000000) begin
      $display("FAIL: Test case 10 failed");
      $finish;
    end

    // Test case 11: binary_in = 11
    binary_in = 4'b1011; #10;
    if (onehot_out !== 16'b0000100000000000) begin
      $display("FAIL: Test case 11 failed");
      $finish;
    end

    // Test case 12: binary_in = 12
    binary_in = 4'b1100; #10;
    if (onehot_out !== 16'b0001000000000000) begin
      $display("FAIL: Test case 12 failed");
      $finish;
    end

    // Test case 13: binary_in = 13
    binary_in = 4'b1101; #10;
    if (onehot_out !== 16'b0010000000000000) begin
      $display("FAIL: Test case 13 failed");
      $finish;
    end

    // Test case 14: binary_in = 14
    binary_in = 4'b1110; #10;
    if (onehot_out !== 16'b0100000000000000) begin
      $display("FAIL: Test case 14 failed");
      $finish;
    end

    // Test case 15: binary_in = 15
    binary_in = 4'b1111; #10;
    if (onehot_out !== 16'b1000000000000000) begin
      $display("FAIL: Test case 15 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule