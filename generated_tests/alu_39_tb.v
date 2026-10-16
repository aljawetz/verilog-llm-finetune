`timescale 1ns/1ps

module tb_alu;

  reg [7:0] a;
  reg [7:0] b;
  reg [3:0] command;
  reg oe;
  wire [15:0] y;

  alu uut (
    .a(a),
    .b(b),
    .command(command),
    .oe(oe),
    .y(y)
  );

  initial begin
    // Test case 1: Addition
    a = 8'd10; b = 8'd20; command = 4'b0000; oe = 1;
    #10;
    if (y !== 16'd30) $display("FAIL: Addition failed");

    // Test case 2: Increment
    a = 8'd10; command = 4'b0001; oe = 1;
    #10;
    if (y !== 16'd11) $display("FAIL: Increment failed");

    // Test case 3: Subtraction
    a = 8'd20; b = 8'd10; command = 4'b0010; oe = 1;
    #10;
    if (y !== 16'd10) $display("FAIL: Subtraction failed");

    // Test case 4: Decrement
    a = 8'd10; command = 4'b0011; oe = 1;
    #10;
    if (y !== 16'd9) $display("FAIL: Decrement failed");

    // Test case 5: Multiplication
    a = 8'd5; b = 8'd6; command = 4'b0100; oe = 1;
    #10;
    if (y !== 16'd30) $display("FAIL: Multiplication failed");

    // Test case 6: Division
    a = 8'd20; b = 8'd4; command = 4'b0101; oe = 1;
    #10;
    if (y !== 16'd5) $display("FAIL: Division failed");

    // Test case 7: Logical AND
    a = 8'b11001100; b = 8'b10101010; command = 4'b1000; oe = 1;
    #10;
    if (y !== 16'b10001000) $display("FAIL: Logical AND failed");

    // Test case 8: Logical OR
    a = 8'b11001100; b = 8'b10101010; command = 4'b1001; oe = 1;
    #10;
    if (y !== 16'b11101110) $display("FAIL: Logical OR failed");

    // Test case 9: Logical XOR
    a = 8'b11001100; b = 8'b10101010; command = 4'b1101; oe = 1;
    #10;
    if (y !== 16'b01100110) $display("FAIL: Logical XOR failed");

    // Test case 10: Buffer
    a = 8'd15; command = 4'b1111; oe = 1;
    #10;
    if (y !== 16'd15) $display("FAIL: Buffer failed");

    // Test case 11: Output enable off
    a = 8'd10; b = 8'd20; command = 4'b0000; oe = 0;
    #10;
    if (y !== 16'hzzzz) $display("FAIL: Output enable failed");

    $display("PASS");
    $finish;
  end

endmodule