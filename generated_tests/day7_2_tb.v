`timescale 1ns/1ps

module tb_day7;

  reg [3:0] a_i;
  reg [3:0] b_i;
  reg [2:0] opcode;
  wire [7:0] ALU_O;

  // Instantiate the module under test (uut)
  day7 uut (
    .a_i(a_i),
    .b_i(b_i),
    .opcode(opcode),
    .ALU_O(ALU_O)
  );

  initial begin
    // Test addition
    a_i = 4'b0011; // 3
    b_i = 4'b0001; // 1
    opcode = 3'b000; // OP_ADD
    #10;
    if (ALU_O !== 8'b00000000) $display("FAIL: Addition failed");

    // Test subtraction
    a_i = 4'b0100; // 4
    b_i = 4'b0001; // 1
    opcode = 3'b001; // OP_SUB
    #10;
    if (ALU_O !== 8'b00000011) $display("FAIL: Subtraction failed");

    // Test AND
    a_i = 4'b1100; // 12
    b_i = 4'b1010; // 10
    opcode = 3'b010; // OP_AND
    #10;
    if (ALU_O !== 8'b00001000) $display("FAIL: AND operation failed");

    // Test OR
    a_i = 4'b1100; // 12
    b_i = 4'b1010; // 10
    opcode = 3'b011; // OP_OR
    #10;
    if (ALU_O !== 8'b00011010) $display("FAIL: OR operation failed");

    // Test XOR
    a_i = 4'b1100; // 12
    b_i = 4'b1010; // 10
    opcode = 3'b100; // OP_XOR
    #10;
    if (ALU_O !== 8'b00010010) $display("FAIL: XOR operation failed");

    // Test equality
    a_i = 4'b1010; // 10
    b_i = 4'b1010; // 10
    opcode = 3'b101; // OP_EQL
    #10;
    if (ALU_O !== 8'b00000001) $display("FAIL: Equality check failed");

    // Test shift left
    a_i = 4'b0001; // 1
    b_i = 4'b0001; // 1
    opcode = 3'b110; // OP_SL
    #10;
    if (ALU_O !== 8'b00000010) $display("FAIL: Shift left failed");

    // Test shift right
    a_i = 4'b0010; // 2
    b_i = 4'b0001; // 1
    opcode = 3'b111; // OP_SR
    #10;
    if (ALU_O !== 8'b00000001) $display("FAIL: Shift right failed");

    $display("PASS");
    $finish;
  end

endmodule