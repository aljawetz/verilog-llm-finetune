`timescale 1ns/1ps

module tb_shift_rotate;

  // Inputs
  reg [7:0] a;
  reg [2:0] opcode;

  // Outputs
  wire [7:0] result;

  // Instantiate the Unit Under Test (UUT)
  shift_rotate uut (
    .a(a),
    .opcode(opcode),
    .result(result)
  );

  initial begin
    // Test cases
    // Test SRA
    a = 8'b11001100; opcode = 3'b000; #10;
    if (result !== 8'b11110110) $display("FAIL: SRA failed for input %b", a);

    // Test SRL
    a = 8'b11001100; opcode = 3'b001; #10;
    if (result !== 8'b01100110) $display("FAIL: SRL failed for input %b", a);

    // Test SLA
    a = 8'b11001100; opcode = 3'b010; #10;
    if (result !== 8'b10011000) $display("FAIL: SLA failed for input %b", a);

    // Test SLL
    a = 8'b11001100; opcode = 3'b011; #10;
    if (result !== 8'b10011000) $display("FAIL: SLL failed for input %b", a);

    // Test ROR
    a = 8'b11001100; opcode = 3'b100; #10;
    if (result !== 8'b01100110) $display("FAIL: ROR failed for input %b", a);

    // Test ROL
    a = 8'b11001100; opcode = 3'b101; #10;
    if (result !== 8'b10011001) $display("FAIL: ROL failed for input %b", a);

    // Test default case
    a = 8'b11001100; opcode = 3'b111; #10;
    if (result !== 8'b00000000) $display("FAIL: Default case failed for input %b", a);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule