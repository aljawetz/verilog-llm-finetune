`timescale 1ns/1ps

module tb_complement_2s;
  reg [3:0] data;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  complement_2s uut (
    .data(data),
    .out(out)
  );

  initial begin
    // Test case 1: 0000 -> 0000 (2's complement of 0)
    data = 4'b0000;
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
      $finish;
    end

    // Test case 2: 0001 -> 1111 (2's complement of 1)
    data = 4'b0001;
    #10;
    if (out !== 4'b1111) begin
      $display("FAIL: Test case 2 failed, expected 1111, got %b", out);
      $finish;
    end

    // Test case 3: 0010 -> 1110 (2's complement of 2)
    data = 4'b0010;
    #10;
    if (out !== 4'b1110) begin
      $display("FAIL: Test case 3 failed, expected 1110, got %b", out);
      $finish;
    end

    // Test case 4: 0011 -> 1101 (2's complement of 3)
    data = 4'b0011;
    #10;
    if (out !== 4'b1101) begin
      $display("FAIL: Test case 4 failed, expected 1101, got %b", out);
      $finish;
    end

    // Test case 5: 0100 -> 1100 (2's complement of 4)
    data = 4'b0100;
    #10;
    if (out !== 4'b1100) begin
      $display("FAIL: Test case 5 failed, expected 1100, got %b", out);
      $finish;
    end

    // Test case 6: 0111 -> 1001 (2's complement of 7)
    data = 4'b0111;
    #10;
    if (out !== 4'b1001) begin
      $display("FAIL: Test case 6 failed, expected 1001, got %b", out);
      $finish;
    end

    // Test case 7: 1000 -> 1000 (2's complement of 8)
    data = 4'b1000;
    #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Test case 7 failed, expected 1000, got %b", out);
      $finish;
    end

    // Test case 8: 1111 -> 0001 (2's complement of -1)
    data = 4'b1111;
    #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Test case 8 failed, expected 0001, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule