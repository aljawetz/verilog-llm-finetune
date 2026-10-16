`timescale 1ns/1ps

module tb_add_unsigned_1439;

  reg [31:0] A;
  reg B;
  wire [31:0] Z;

  // Instantiate the module under test
  add_unsigned_1439 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 32'h00000000; B = 1'b0;
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 1 failed. Expected Z = 0x00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 2: A = 1, B = 1
    A = 32'h00000001; B = 1'b1;
    #10;
    if (Z !== 32'h00000002) begin
      $display("FAIL: Test case 2 failed. Expected Z = 0x00000002, got Z = %h", Z);
      $finish;
    end

    // Test case 3: A = 0xFFFFFFFF, B = 1
    A = 32'hFFFFFFFF; B = 1'b1;
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed. Expected Z = 0x00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 4: A = 0x7FFFFFFF, B = 1
    A = 32'h7FFFFFFF; B = 1'b1;
    #10;
    if (Z !== 32'h80000000) begin
      $display("FAIL: Test case 4 failed. Expected Z = 0x80000000, got Z = %h", Z);
      $finish;
    end

    // Test case 5: A = 0x0000000A, B = 1
    A = 32'h0000000A; B = 1'b1;
    #10;
    if (Z !== 32'h0000000B) begin
      $display("FAIL: Test case 5 failed. Expected Z = 0x0000000B, got Z = %h", Z);
      $finish;
    end

    // Test case 6: A = 0xFFFFFFFF, B = 0
    A = 32'hFFFFFFFF; B = 1'b0;
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 6 failed. Expected Z = 0xFFFFFFFF, got Z = %h", Z);
      $finish;
    end

    // Test case 7: A = 0x00000000, B = 1
    A = 32'h00000000; B = 1'b1;
    #10;
    if (Z !== 32'h00000001) begin
      $display("FAIL: Test case 7 failed. Expected Z = 0x00000001, got Z = %h", Z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule