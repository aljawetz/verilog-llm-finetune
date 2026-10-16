`timescale 1ns/1ps

module tb_alu;
  reg [1:0] a;
  reg [1:0] b;
  reg rst;
  reg [1:0] opcode;
  wire [3:0] r;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .rst(rst),
    .opcode(opcode),
    .r(r)
  );

  initial begin
    // Initialize inputs
    a = 2'b00;
    b = 2'b00;
    rst = 1;
    opcode = 2'b00;

    // Test addition
    rst = 0; opcode = 2'b00; a = 2'b01; b = 2'b01; #10;
    if (r !== 4'b0010) $display("FAIL: Addition test failed");

    // Test subtraction
    rst = 0; opcode = 2'b01; a = 2'b10; b = 2'b01; #10;
    if (r !== 4'b0001) $display("FAIL: Subtraction test failed");

    // Test bitwise AND
    rst = 0; opcode = 2'b10; a = 2'b11; b = 2'b01; #10;
    if (r !== 4'b0001) $display("FAIL: Bitwise AND test failed");

    // Test bitwise OR
    rst = 0; opcode = 2'b11; a = 2'b01; b = 2'b10; #10;
    if (r !== 4'b0011) $display("FAIL: Bitwise OR test failed");

    // Test reset condition
    rst = 1; #10;
    if (r !== 4'bxxxx) $display("FAIL: Reset test failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule