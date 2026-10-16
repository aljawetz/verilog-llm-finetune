`timescale 1ns/1ps

module tb_day11;

  parameter WIDTH = 4;
  reg [WIDTH-1:0] bin_i;
  wire [WIDTH-1:0] gray_o;

  // Instantiate the module under test (uut)
  day11 #(.WIDTH(WIDTH)) uut (
    .bin_i(bin_i),
    .gray_o(gray_o)
  );

  initial begin
    // Test cases
    // Test case 1: bin_i = 0000
    bin_i = 4'b0000; #10;
    if (gray_o !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", gray_o);
      $finish;
    end

    // Test case 2: bin_i = 0001
    bin_i = 4'b0001; #10;
    if (gray_o !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", gray_o);
      $finish;
    end

    // Test case 3: bin_i = 0010
    bin_i = 4'b0010; #10;
    if (gray_o !== 4'b0011) begin
      $display("FAIL: Test case 3 failed, expected 0011, got %b", gray_o);
      $finish;
    end

    // Test case 4: bin_i = 0011
    bin_i = 4'b0011; #10;
    if (gray_o !== 4'b0010) begin
      $display("FAIL: Test case 4 failed, expected 0010, got %b", gray_o);
      $finish;
    end

    // Test case 5: bin_i = 0100
    bin_i = 4'b0100; #10;
    if (gray_o !== 4'b0110) begin
      $display("FAIL: Test case 5 failed, expected 0110, got %b", gray_o);
      $finish;
    end

    // Test case 6: bin_i = 0101
    bin_i = 4'b0101; #10;
    if (gray_o !== 4'b0111) begin
      $display("FAIL: Test case 6 failed, expected 0111, got %b", gray_o);
      $finish;
    end

    // Test case 7: bin_i = 0110
    bin_i = 4'b0110; #10;
    if (gray_o !== 4'b0101) begin
      $display("FAIL: Test case 7 failed, expected 0101, got %b", gray_o);
      $finish;
    end

    // Test case 8: bin_i = 0111
    bin_i = 4'b0111; #10;
    if (gray_o !== 4'b0100) begin
      $display("FAIL: Test case 8 failed, expected 0100, got %b", gray_o);
      $finish;
    end

    // Test case 9: bin_i = 1000
    bin_i = 4'b1000; #10;
    if (gray_o !== 4'b1100) begin
      $display("FAIL: Test case 9 failed, expected 1100, got %b", gray_o);
      $finish;
    end

    // Test case 10: bin_i = 1111
    bin_i = 4'b1111; #10;
    if (gray_o !== 4'b1000) begin
      $display("FAIL: Test case 10 failed, expected 1000, got %b", gray_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule