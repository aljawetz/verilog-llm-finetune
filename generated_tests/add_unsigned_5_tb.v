`timescale 1ns/1ps

module tb_add_unsigned;

  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  add_unsigned uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: Simple addition
    A = 32'h00000001; // 1
    B = 32'h00000001; // 1
    #10;
    if (Z !== 32'h00000002) begin
      $display("FAIL: Test case 1 failed, expected 2 but got %h", Z);
      $finish;
    end

    // Test case 2: Addition with carry
    A = 32'hFFFFFFFF; // Max unsigned 32-bit value
    B = 32'h00000001; // 1
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed, expected 0 but got %h", Z);
      $finish;
    end

    // Test case 3: Adding two large numbers
    A = 32'h7FFFFFFF; // 2147483647
    B = 32'h7FFFFFFF; // 2147483647
    #10;
    if (Z !== 32'hFFFFFFFE) begin
      $display("FAIL: Test case 3 failed, expected FFFFFFFE but got %h", Z);
      $finish;
    end

    // Test case 4: Adding zero
    A = 32'h00000000; // 0
    B = 32'h00000000; // 0
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %h", Z);
      $finish;
    end

    // Test case 5: Random values
    A = 32'h12345678; // 305419896
    B = 32'h87654321; // 2271560481
    #10;
    if (Z !== 32'h99999999) begin
      $display("FAIL: Test case 5 failed, expected 99999999 but got %h", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule