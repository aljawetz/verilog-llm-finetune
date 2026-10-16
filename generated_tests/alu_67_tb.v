`timescale 1ns/1ps

module tb_alu;

  reg [3:0] A;
  reg [3:0] B;
  reg [1:0] select;
  wire zero;
  wire carry;
  wire sign;
  wire parity;
  wire overflow;
  wire [3:0] out;

  alu uut (
    .A(A),
    .B(B),
    .select(select),
    .zero(zero),
    .carry(carry),
    .sign(sign),
    .parity(parity),
    .overflow(overflow),
    .out(out)
  );

  initial begin
    // Test Addition
    A = 4'b0011; // 3
    B = 4'b0001; // 1
    select = 2'b00; // Addition
    #10;
    if (out !== 4'b0100 || carry !== 1'b0 || zero !== 1'b0 || sign !== 1'b0 || parity !== 1'b0 || overflow !== 1'b0) 
      $display("FAIL: Addition test failed");

    // Test Subtraction
    A = 4'b0100; // 4
    B = 4'b0011; // 3
    select = 2'b01; // Subtraction
    #10;
    if (out !== 4'b0001 || carry !== 1'b0 || zero !== 1'b0 || sign !== 1'b0 || parity !== 1'b0 || overflow !== 1'b0) 
      $display("FAIL: Subtraction test failed");

    // Test Multiplication
    A = 4'b0010; // 2
    B = 4'b0011; // 3
    select = 2'b10; // Multiplication
    #10;
    if (out !== 4'b0110 || carry !== 1'b0 || zero !== 1'b0 || sign !== 1'b0 || parity !== 1'b0 || overflow !== 1'b0) 
      $display("FAIL: Multiplication test failed");

    // Test Division
    A = 4'b0110; // 6
    B = 4'b0011; // 3
    select = 2'b11; // Division
    #10;
    if (out !== 4'b0010 || carry !== 1'b0 || zero !== 1'b0 || sign !== 1'b0 || parity !== 1'b0 || overflow !== 1'b0) 
      $display("FAIL: Division test failed");

    // Test Division by Zero
    A = 4'b0110; // 6
    B = 4'b0000; // 0
    select = 2'b11; // Division
    #10;
    if (out !== 4'bxxxx || carry !== 1'bx || zero !== 1'bx || sign !== 1'bx || parity !== 1'bx || overflow !== 1'bx) 
      $display("FAIL: Division by zero test failed");

    $display("PASS");
    $finish;
  end

endmodule