`timescale 1ns/1ps

module tb_alu;

  reg [7:0] a;
  reg [7:0] b;
  reg sub_bAdd;
  wire [7:0] result;
  wire carry_flag;
  wire zero_flag;

  alu uut (
    .a(a),
    .b(b),
    .sub_bAdd(sub_bAdd),
    .result(result),
    .carry_flag(carry_flag),
    .zero_flag(zero_flag)
  );

  initial begin
    // Test case 1: Addition without carry
    a = 8'd10; b = 8'd5; sub_bAdd = 1'b0; 
    #10;
    if (result !== 8'd15 || carry_flag !== 1'b0 || zero_flag !== 1'b0) 
      $display("FAIL: Test case 1 failed");

    // Test case 2: Addition with carry
    a = 8'd200; b = 8'd100; sub_bAdd = 1'b0; 
    #10;
    if (result !== 8'd44 || carry_flag !== 1'b1 || zero_flag !== 1'b0) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: Subtraction resulting in zero
    a = 8'd5; b = 8'd5; sub_bAdd = 1'b1; 
    #10;
    if (result !== 8'd0 || carry_flag !== 1'b0 || zero_flag !== 1'b1) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: Subtraction with borrow
    a = 8'd10; b = 8'd20; sub_bAdd = 1'b1; 
    #10;
    if (result !== 8'd246 || carry_flag !== 1'b1 || zero_flag !== 1'b0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: Simple addition
    a = 8'd1; b = 8'd1; sub_bAdd = 1'b0; 
    #10;
    if (result !== 8'd2 || carry_flag !== 1'b0 || zero_flag !== 1'b0) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: Subtraction resulting in negative
    a = 8'd1; b = 8'd2; sub_bAdd = 1'b1; 
    #10;
    if (result !== 8'd255 || carry_flag !== 1'b1 || zero_flag !== 1'b0) 
      $display("FAIL: Test case 6 failed");

    $display("PASS");
    $finish;
  end

endmodule