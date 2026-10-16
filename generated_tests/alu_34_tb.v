`timescale 1ns/1ps

module tb_alu;

  reg [7:0] A;
  reg [7:0] B;
  reg [3:0] ALU_Control;
  wire [7:0] Result;

  alu uut (
    .A(A),
    .B(B),
    .ALU_Control(ALU_Control),
    .Result(Result)
  );

  initial begin
    // Test addition
    A = 8'd10; B = 8'd5; ALU_Control = 4'b0000; #10;
    if (Result !== 8'd15) $display("FAIL: Addition failed");

    // Test subtraction
    A = 8'd10; B = 8'd5; ALU_Control = 4'b0001; #10;
    if (Result !== 8'd5) $display("FAIL: Subtraction failed");

    // Test multiplication
    A = 8'd2; B = 8'd3; ALU_Control = 4'b0010; #10;
    if (Result !== 8'd6) $display("FAIL: Multiplication failed");

    // Test division
    A = 8'd10; B = 8'd2; ALU_Control = 4'b0011; #10;
    if (Result !== 8'd5) $display("FAIL: Division failed");

    // Test left shift
    A = 8'b00001111; ALU_Control = 4'b0100; #10;
    if (Result !== 8'b00011110) $display("FAIL: Left shift failed");

    // Test right shift
    A = 8'b00001111; ALU_Control = 4'b0101; #10;
    if (Result !== 8'b00000111) $display("FAIL: Right shift failed");

    // Test rotate left
    A = 8'b00001111; ALU_Control = 4'b0110; #10;
    if (Result !== 8'b00011110) $display("FAIL: Rotate left failed");

    // Test rotate right
    A = 8'b00001111; ALU_Control = 4'b0111; #10;
    if (Result !== 8'b10000111) $display("FAIL: Rotate right failed");

    // Test bitwise AND
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1000; #10;
    if (Result !== 8'b10001000) $display("FAIL: Bitwise AND failed");

    // Test bitwise OR
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1001; #10;
    if (Result !== 8'b11101110) $display("FAIL: Bitwise OR failed");

    // Test bitwise XOR
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1010; #10;
    if (Result !== 8'b01100110) $display("FAIL: Bitwise XOR failed");

    // Test NOR
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1011; #10;
    if (Result !== 8'b00110001) $display("FAIL: NOR failed");

    // Test NAND
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1100; #10;
    if (Result !== 8'b01110001) $display("FAIL: NAND failed");

    // Test XNOR
    A = 8'b10101010; B = 8'b11001100; ALU_Control = 4'b1101; #10;
    if (Result !== 8'b00110010) $display("FAIL: XNOR failed");

    // Test greater than
    A = 8'd10; B = 8'd5; ALU_Control = 4'b1110; #10;
    if (Result !== 8'd1) $display("FAIL: Greater than comparison failed");

    // Test equality
    A = 8'd10; B = 8'd10; ALU_Control = 4'b1111; #10;
    if (Result !== 8'd1) $display("FAIL: Equality comparison failed");

    $display("PASS");
    $finish;
  end

endmodule