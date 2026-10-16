`timescale 1ns/1ps

module tb_alu;
  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] s;
  wire [3:0] y;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
  );

  initial begin
    // Test addition
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    s = 4'b0001; // ALU operation: a + b
    #10;
    if (y !== 4'b0100) $display("FAIL: Addition test failed, expected 4'b0100, got %b", y);

    // Test subtraction
    a = 4'b0100; // 4
    b = 4'b0001; // 1
    s = 4'b0010; // ALU operation: a - b
    #10;
    if (y !== 4'b0011) $display("FAIL: Subtraction test failed, expected 4'b0011, got %b", y);

    // Test multiplication
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    s = 4'b0011; // ALU operation: a * b
    #10;
    if (y !== 4'b0110) $display("FAIL: Multiplication test failed, expected 4'b0110, got %b", y);

    // Test division
    a = 4'b0100; // 4
    b = 4'b0010; // 2
    s = 4'b0100; // ALU operation: a / b
    #10;
    if (y !== 4'b0010) $display("FAIL: Division test failed, expected 4'b0010, got %b", y);

    // Test bitwise AND
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    s = 4'b0101; // ALU operation: a & b
    #10;
    if (y !== 4'b1000) $display("FAIL: AND test failed, expected 4'b1000, got %b", y);

    // Test bitwise OR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    s = 4'b0110; // ALU operation: a | b
    #10;
    if (y !== 4'b1110) $display("FAIL: OR test failed, expected 4'b1110, got %b", y);

    // Test bitwise NOT
    a = 4'b1100; // 12
    s = 4'b0111; // ALU operation: ~a
    #10;
    if (y !== 4'b0011) $display("FAIL: NOT a test failed, expected 4'b0011, got %b", y);

    // Test bitwise NOT on b
    b = 4'b1010; // 10
    s = 4'b1000; // ALU operation: ~b
    #10;
    if (y !== 4'b0101) $display("FAIL: NOT b test failed, expected 4'b0101, got %b", y);

    // Test NOR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    s = 4'b1001; // ALU operation: ~(a & b)
    #10;
    if (y !== 4'b0111) $display("FAIL: NOR test failed, expected 4'b0111, got %b", y);

    // Test NAND
    s = 4'b1010; // ALU operation: ~(a | b)
    #10;
    if (y !== 4'b0001) $display("FAIL: NAND test failed, expected 4'b0001, got %b", y);

    // Test XNOR
    s = 4'b1011; // ALU operation: ~(a ^ b)
    #10;
    if (y !== 4'b0000) $display("FAIL: XNOR test failed, expected 4'b0000, got %b", y);

    // Test XOR
    s = 4'b1100; // ALU operation: a ^ b
    #10;
    if (y !== 4'b0110) $display("FAIL: XOR test failed, expected 4'b0110, got %b", y);

    // Test maximum
    a = 4'b0011; // 3
    b = 4'b0101; // 5
    s = 4'b1101; // ALU operation: max(a, b)
    #10;
    if (y !== 4'b0101) $display("FAIL: Max test failed, expected 4'b0101, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule