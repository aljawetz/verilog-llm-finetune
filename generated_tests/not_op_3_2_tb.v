`timescale 1ns/1ps

module tb_not_op_3;
  reg [31:0] A;
  wire [31:0] Z;

  // Instantiate the module under test
  not_op_3 uut (
    .A(A),
    .Z(Z)
  );

  initial begin
    // Test case 1: All bits are 0
    A = 32'b00000000000000000000000000000000;
    #10;
    if (Z !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: All bits are 1
    A = 32'b11111111111111111111111111111111;
    #10;
    if (Z !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Alternating bits
    A = 32'b10101010101010101010101010101010;
    #10;
    if (Z !== 32'b01010101010101010101010101010101) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Random pattern
    A = 32'b11001100110011001100110011001100;
    #10;
    if (Z !== 32'b00110011001100110011001100110011) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Single bit set
    A = 32'b00000000000000000000000000000001;
    #10;
    if (Z !== 32'b11111111111111111111111111111110) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Single bit cleared
    A = 32'b00000000000000000000000000000010;
    #10;
    if (Z !== 32'b11111111111111111111111111111101) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule