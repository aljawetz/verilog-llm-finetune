`timescale 1ns/1ps

module tb_day_8_binary_to_onehot;

  reg [3:0] bin_i;
  wire [15:0] one_hot_o;

  // Instantiate the module under test (uut)
  day_8_binary_to_onehot uut (
    .bin_i(bin_i),
    .one_hot_o(one_hot_o)
  );

  initial begin
    // Test cases
    bin_i = 4'b0000; #10;
    if (one_hot_o !== 16'b0000000000000001) begin
      $display("FAIL: Test case for bin_i = 0000 failed");
      $finish;
    end

    bin_i = 4'b0001; #10;
    if (one_hot_o !== 16'b0000000000000010) begin
      $display("FAIL: Test case for bin_i = 0001 failed");
      $finish;
    end

    bin_i = 4'b0010; #10;
    if (one_hot_o !== 16'b0000000000000100) begin
      $display("FAIL: Test case for bin_i = 0010 failed");
      $finish;
    end

    bin_i = 4'b0011; #10;
    if (one_hot_o !== 16'b0000000000001000) begin
      $display("FAIL: Test case for bin_i = 0011 failed");
      $finish;
    end

    bin_i = 4'b0100; #10;
    if (one_hot_o !== 16'b0000000000010000) begin
      $display("FAIL: Test case for bin_i = 0100 failed");
      $finish;
    end

    bin_i = 4'b0101; #10;
    if (one_hot_o !== 16'b0000000000100000) begin
      $display("FAIL: Test case for bin_i = 0101 failed");
      $finish;
    end

    bin_i = 4'b0110; #10;
    if (one_hot_o !== 16'b0000000001000000) begin
      $display("FAIL: Test case for bin_i = 0110 failed");
      $finish;
    end

    bin_i = 4'b0111; #10;
    if (one_hot_o !== 16'b0000000010000000) begin
      $display("FAIL: Test case for bin_i = 0111 failed");
      $finish;
    end

    bin_i = 4'b1000; #10;
    if (one_hot_o !== 16'b0000000100000000) begin
      $display("FAIL: Test case for bin_i = 1000 failed");
      $finish;
    end

    bin_i = 4'b1001; #10;
    if (one_hot_o !== 16'b0000001000000000) begin
      $display("FAIL: Test case for bin_i = 1001 failed");
      $finish;
    end

    bin_i = 4'b1010; #10;
    if (one_hot_o !== 16'b0000010000000000) begin
      $display("FAIL: Test case for bin_i = 1010 failed");
      $finish;
    end

    bin_i = 4'b1011; #10;
    if (one_hot_o !== 16'b0000100000000000) begin
      $display("FAIL: Test case for bin_i = 1011 failed");
      $finish;
    end

    bin_i = 4'b1100; #10;
    if (one_hot_o !== 16'b0001000000000000) begin
      $display("FAIL: Test case for bin_i = 1100 failed");
      $finish;
    end

    bin_i = 4'b1101; #10;
    if (one_hot_o !== 16'b0010000000000000) begin
      $display("FAIL: Test case for bin_i = 1101 failed");
      $finish;
    end

    bin_i = 4'b1110; #10;
    if (one_hot_o !== 16'b0100000000000000) begin
      $display("FAIL: Test case for bin_i = 1110 failed");
      $finish;
    end

    bin_i = 4'b1111; #10;
    if (one_hot_o !== 16'b1000000000000000) begin
      $display("FAIL: Test case for bin_i = 1111 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule