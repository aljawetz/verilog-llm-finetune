`timescale 1ns/1ps

module tb_alu;
  reg [7:0] a, b;
  reg [3:0] command;
  reg oe;
  wire [15:0] out;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .command(command),
    .oe(oe),
    .out(out)
  );

  initial begin
    // Test 1: Addition
    a = 8'd10; b = 8'd5; command = 4'b0000; oe = 1;
    #10;
    if (out !== 16'd15) $display("FAIL: Addition failed, expected 15 but got %d", out);

    // Test 2: Increment
    a = 8'd10; command = 4'b0001; oe = 1;
    #10;
    if (out !== 16'd11) $display("FAIL: Increment failed, expected 11 but got %d", out);

    // Test 3: Subtraction
    a = 8'd10; b = 8'd5; command = 4'b0010; oe = 1;
    #10;
    if (out !== 16'd5) $display("FAIL: Subtraction failed, expected 5 but got %d", out);

    // Test 4: Decrement
    a = 8'd10; command = 4'b0011; oe = 1;
    #10;
    if (out !== 16'd9) $display("FAIL: Decrement failed, expected 9 but got %d", out);

    // Test 5: Multiplication
    a = 8'd3; b = 8'd4; command = 4'b0100; oe = 1;
    #10;
    if (out !== 16'd12) $display("FAIL: Multiplication failed, expected 12 but got %d", out);

    // Test 6: Division
    a = 8'd8; b = 8'd2; command = 4'b0101; oe = 1;
    #10;
    if (out !== 16'd4) $display("FAIL: Division failed, expected 4 but got %d", out);

    // Test 7: Shift Left
    a = 8'd2; b = 8'd1; command = 4'b0110; oe = 1;
    #10;
    if (out !== 16'd4) $display("FAIL: Shift Left failed, expected 4 but got %d", out);

    // Test 8: Shift Right
    a = 8'd4; b = 8'd1; command = 4'b0111; oe = 1;
    #10;
    if (out !== 16'd2) $display("FAIL: Shift Right failed, expected 2 but got %d", out);

    // Test 9: Logical AND
    a = 8'd6; b = 8'd3; command = 4'b1000; oe = 1;
    #10;
    if (out !== 16'd2) $display("FAIL: AND failed, expected 2 but got %d", out);

    // Test 10: Logical OR
    a = 8'd6; b = 8'd3; command = 4'b1001; oe = 1;
    #10;
    if (out !== 16'd7) $display("FAIL: OR failed, expected 7 but got %d", out);

    // Test 11: Inversion
    a = 8'd5; command = 4'b1010; oe = 1;
    #10;
    if (out !== 16'd250) $display("FAIL: Inversion failed, expected 250 but got %d", out);

    // Test 12: NAND
    a = 8'd6; b = 8'd3; command = 4'b1011; oe = 1;
    #10;
    if (out !== 16'd5) $display("FAIL: NAND failed, expected 5 but got %d", out);

    // Test 13: NOR
    a = 8'd6; b = 8'd3; command = 4'b1100; oe = 1;
    #10;
    if (out !== 16'd248) $display("FAIL: NOR failed, expected 248 but got %d", out);

    // Test 14: XOR
    a = 8'd6; b = 8'd3; command = 4'b1101; oe = 1;
    #10;
    if (out !== 16'd5) $display("FAIL: XOR failed, expected 5 but got %d", out);

    // Test 15: XNOR
    a = 8'd6; b = 8'd3; command = 4'b1110; oe = 1;
    #10;
    if (out !== 16'd250) $display("FAIL: XNOR failed, expected 250 but got %d", out);

    // Test 16: Buffer
    a = 8'd15; command = 4'b1111; oe = 1;
    #10;
    if (out !== 16'd15) $display("FAIL: Buffer failed, expected 15 but got %d", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule