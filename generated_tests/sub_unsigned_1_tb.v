`timescale 1ns/1ps

module tb_sub_unsigned;

  reg [31:0] A;
  reg [31:0] B;
  wire [31:0] Z;

  // Instantiate the module under test
  sub_unsigned uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 10, B = 5, expected Z = 5
    A = 32'd10; B = 32'd5;
    #10;
    if (Z !== 32'd5) begin
      $display("FAIL: Test case 1 failed. Expected Z = 5, got Z = %d", Z);
      $finish;
    end

    // Test case 2: A = 20, B = 15, expected Z = 5
    A = 32'd20; B = 32'd15;
    #10;
    if (Z !== 32'd5) begin
      $display("FAIL: Test case 2 failed. Expected Z = 5, got Z = %d", Z);
      $finish;
    end

    // Test case 3: A = 0, B = 0, expected Z = 0
    A = 32'd0; B = 32'd0;
    #10;
    if (Z !== 32'd0) begin
      $display("FAIL: Test case 3 failed. Expected Z = 0, got Z = %d", Z);
      $finish;
    end

    // Test case 4: A = 100, B = 50, expected Z = 50
    A = 32'd100; B = 32'd50;
    #10;
    if (Z !== 32'd50) begin
      $display("FAIL: Test case 4 failed. Expected Z = 50, got Z = %d", Z);
      $finish;
    end

    // Test case 5: A = 50, B = 100, expected Z = 4294967246 (underflow)
    A = 32'd50; B = 32'd100;
    #10;
    if (Z !== 32'd4294967246) begin
      $display("FAIL: Test case 5 failed. Expected Z = 4294967246, got Z = %d", Z);
      $finish;
    end

    // Test case 6: A = 1, B = 1, expected Z = 0
    A = 32'd1; B = 32'd1;
    #10;
    if (Z !== 32'd0) begin
      $display("FAIL: Test case 6 failed. Expected Z = 0, got Z = %d", Z);
      $finish;
    end

    // Test case 7: A = 4294967295, B = 1, expected Z = 4294967294
    A = 32'd4294967295; B = 32'd1;
    #10;
    if (Z !== 32'd4294967294) begin
      $display("FAIL: Test case 7 failed. Expected Z = 4294967294, got Z = %d", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule