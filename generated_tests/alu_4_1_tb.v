`timescale 1ns/1ps

module tb_alu_4;

  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] s;
  wire [3:0] res;
  wire ack;

  // Instantiate the ALU module
  alu_4 uut (
    .a(a),
    .b(b),
    .s(s),
    .res(res),
    .ack(ack)
  );

  initial begin
    // Test case 1: Addition
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    s = 4'b0000; // Operation: a + b
    #10;
    if (res !== 4'b0100 || ack !== 1) $display("FAIL: Addition test failed");

    // Test case 2: Subtraction
    a = 4'b0100; // 4
    b = 4'b0001; // 1
    s = 4'b0001; // Operation: a - b
    #10;
    if (res !== 4'b0011 || ack !== 1) $display("FAIL: Subtraction test failed");

    // Test case 3: Multiplication
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    s = 4'b0010; // Operation: a * b
    #10;
    if (res !== 4'b0110 || ack !== 1) $display("FAIL: Multiplication test failed");

    // Test case 4: Division
    a = 4'b0110; // 6
    b = 4'b0011; // 3
    s = 4'b0011; // Operation: a / b
    #10;
    if (res !== 4'b0010 || ack !== 1) $display("FAIL: Division test failed");

    // Test case 5: Bitwise AND
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    s = 4'b0101; // Operation: a & b
    #10;
    if (res !== 4'b1000 || ack !== 1) $display("FAIL: AND test failed");

    // Test case 6: Bitwise OR
    a = 4'b1100; // 12
    b = 4'b1010; // 10
    s = 4'b0110; // Operation: a | b
    #10;
    if (res !== 4'b1110 || ack !== 1) $display("FAIL: OR test failed");

    // Test case 7: Bitwise NOT
    a = 4'b0000; // 0
    s = 4'b0100; // Operation: ~a
    #10;
    if (res !== 4'b1111 || ack !== 1) $display("FAIL: NOT test failed");

    // Test case 8: Increment
    a = 4'b0011; // 3
    s = 4'b1100; // Operation: a + 1
    #10;
    if (res !== 4'b0100 || ack !== 1) $display("FAIL: Increment test failed");

    // Test case 9: Decrement
    a = 4'b0011; // 3
    s = 4'b1101; // Operation: a - 1
    #10;
    if (res !== 4'b0010 || ack !== 1) $display("FAIL: Decrement test failed");

    // Test case 10: Power
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    s = 4'b1111; // Operation: a ** b
    #10;
    if (res !== 4'b0000 || ack !== 1) $display("FAIL: Power test failed"); // 2^3 = 8 (4'b1000)

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule