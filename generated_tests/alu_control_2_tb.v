`timescale 1ns/1ps

module tb_alu_control;
  reg [1:0] ALUOp;
  reg [3:0] Opcode;
  wire [2:0] ALU_Cnt;

  alu_control uut (
    .ALU_Cnt(ALU_Cnt),
    .ALUOp(ALUOp),
    .Opcode(Opcode)
  );

  initial begin
    // Test case 1: ALUOp = 2'b10, Opcode = 4'bxxxx
    ALUOp = 2'b10; Opcode = 4'b0000; #10;
    if (ALU_Cnt !== 3'b000) $display("FAIL: Test case 1 failed");

    // Test case 2: ALUOp = 2'b01, Opcode = 4'bxxxx
    ALUOp = 2'b01; Opcode = 4'b0000; #10;
    if (ALU_Cnt !== 3'b001) $display("FAIL: Test case 2 failed");

    // Test case 3: ALUOp = 2'b00, Opcode = 4'b000010
    ALUOp = 2'b00; Opcode = 4'b0010; #10;
    if (ALU_Cnt !== 3'b000) $display("FAIL: Test case 3 failed");

    // Test case 4: ALUOp = 2'b00, Opcode = 4'b000011
    ALUOp = 2'b00; Opcode = 4'b0011; #10;
    if (ALU_Cnt !== 3'b001) $display("FAIL: Test case 4 failed");

    // Test case 5: ALUOp = 2'b00, Opcode = 4'b000100
    ALUOp = 2'b00; Opcode = 4'b0100; #10;
    if (ALU_Cnt !== 3'b010) $display("FAIL: Test case 5 failed");

    // Test case 6: ALUOp = 2'b00, Opcode = 4'b000101
    ALUOp = 2'b00; Opcode = 4'b0101; #10;
    if (ALU_Cnt !== 3'b011) $display("FAIL: Test case 6 failed");

    // Test case 7: ALUOp = 2'b00, Opcode = 4'b000110
    ALUOp = 2'b00; Opcode = 4'b0110; #10;
    if (ALU_Cnt !== 3'b100) $display("FAIL: Test case 7 failed");

    // Test case 8: ALUOp = 2'b00, Opcode = 4'b000111
    ALUOp = 2'b00; Opcode = 4'b0111; #10;
    if (ALU_Cnt !== 3'b101) $display("FAIL: Test case 8 failed");

    // Test case 9: ALUOp = 2'b00, Opcode = 4'b001000
    ALUOp = 2'b00; Opcode = 4'b1000; #10;
    if (ALU_Cnt !== 3'b110) $display("FAIL: Test case 9 failed");

    // Test case 10: ALUOp = 2'b00, Opcode = 4'b001001
    ALUOp = 2'b00; Opcode = 4'b1001; #10;
    if (ALU_Cnt !== 3'b111) $display("FAIL: Test case 10 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule