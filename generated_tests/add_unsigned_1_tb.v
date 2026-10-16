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
    // Test case 1: 0 + 0 = 0
    A = 32'h00000000; B = 32'h00000000;
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 1 failed, expected 0, got %h", Z);
      $finish;
    end

    // Test case 2: 1 + 1 = 2
    A = 32'h00000001; B = 32'h00000001;
    #10;
    if (Z !== 32'h00000002) begin
      $display("FAIL: Test case 2 failed, expected 2, got %h", Z);
      $finish;
    end

    // Test case 3: 0xFFFFFFFF + 1 = 0
    A = 32'hFFFFFFFF; B = 32'h00000001;
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed, expected 0, got %h", Z);
      $finish;
    end

    // Test case 4: 0x7FFFFFFF + 0x7FFFFFFF = 0xFFFFFFFE
    A = 32'h7FFFFFFF; B = 32'h7FFFFFFF;
    #10;
    if (Z !== 32'hFFFFFFFE) begin
      $display("FAIL: Test case 4 failed, expected FFFFFFFE, got %h", Z);
      $finish;
    end

    // Test case 5: 0x12345678 + 0x87654321 = 0x99999999
    A = 32'h12345678; B = 32'h87654321;
    #10;
    if (Z !== 32'h99999999) begin
      $display("FAIL: Test case 5 failed, expected 99999999, got %h", Z);
      $finish;
    end

    // Test case 6: 0xFFFFFFFF + 0xFFFFFFFF = 0xFFFFFFFE
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF;
    #10;
    if (Z !== 32'hFFFFFFFE) begin
      $display("FAIL: Test case 6 failed, expected FFFFFFFE, got %h", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule