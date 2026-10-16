`timescale 1ns/1ps

module tb_alu;

  reg [7:0] a;
  reg [7:0] b;
  reg [3:0] command;
  reg out_enable;
  wire [15:0] y;

  // Instantiate the ALU module
  alu uut (
    .a(a),
    .b(b),
    .command(command),
    .out_enable(out_enable),
    .y(y)
  );

  initial begin
    // Test case 1: Addition
    a = 8'd10; b = 8'd5; command = 4'b0000; out_enable = 1;
    #10;
    if (y !== 16'd15) $display("FAIL: Addition failed, expected 15 but got %d", y);

    // Test case 2: Increment
    a = 8'd10; command = 4'b0001; out_enable = 1;
    #10;
    if (y !== 16'd11) $display("FAIL: Increment failed, expected 11 but got %d", y);

    // Test case 3: Subtraction
    a = 8'd10; b = 8'd5; command = 4'b0010; out_enable = 1;
    #10;
    if (y !== 16'd5) $display("FAIL: Subtraction failed, expected 5 but got %d", y);

    // Test case 4: Decrement
    a = 8'd10; command = 4'b0011; out_enable = 1;
    #10;
    if (y !== 16'd9) $display("FAIL: Decrement failed, expected 9 but got %d", y);

    // Test case 5: Multiplication
    a = 8'd3; b = 8'd4; command = 4'b0100; out_enable = 1;
    #10;
    if (y !== 16'd12) $display("FAIL: Multiplication failed, expected 12 but got %d", y);

    // Test case 6: Division
    a = 8'd8; b = 8'd2; command = 4'b0101; out_enable = 1;
    #10;
    if (y !== 16'd4) $display("FAIL: Division failed, expected 4 but got %d", y);

    // Test case 7: Shift Left
    a = 8'd1; b = 8'd1; command = 4'b0110; out_enable = 1;
    #10;
    if (y !== 16'd2) $display("FAIL: Shift Left failed, expected 2 but got %d", y);

    // Test case 8: Shift Right
    a = 8'd2; b = 8'd1; command = 4'b0111; out_enable = 1;
    #10;
    if (y !== 16'd1) $display("FAIL: Shift Right failed, expected 1 but got %d", y);

    // Test case 9: Logical AND
    a = 8'd12; b = 8'd5; command = 4'b1000; out_enable = 1;
    #10;
    if (y !== 16'd4) $display("FAIL: Logical AND failed, expected 4 but got %d", y);

    // Test case 10: Logical OR
    a = 8'd12; b = 8'd5; command = 4'b1001; out_enable = 1;
    #10;
    if (y !== 16'd13) $display("FAIL: Logical OR failed, expected 13 but got %d", y);

    // Test case 11: Logical NOT
    a = 8'd12; command = 4'b1010; out_enable = 1;
    #10;
    if (y !== 16'd243) $display("FAIL: Logical NOT failed, expected 243 but got %d", y);

    // Test case 12: Logical NAND
    a = 8'd12; b = 8'd5; command = 4'b1011; out_enable = 1;
    #10;
    if (y !== 16'd11) $display("FAIL: Logical NAND failed, expected 11 but got %d", y);

    // Test case 13: Logical NOR
    a = 8'd12; b = 8'd5; command = 4'b1100; out_enable = 1;
    #10;
    if (y !== 16'd0) $display("FAIL: Logical NOR failed, expected 0 but got %d", y);

    // Test case 14: Logical XOR
    a = 8'd12; b = 8'd5; command = 4'b1101; out_enable = 1;
    #10;
    if (y !== 16'd9) $display("FAIL: Logical XOR failed, expected 9 but got %d", y);

    // Test case 15: Logical XNOR
    a = 8'd12; b = 8'd5; command = 4'b1110; out_enable = 1;
    #10;
    if (y !== 16'd6) $display("FAIL: Logical XNOR failed, expected 6 but got %d", y);

    // Test case 16: Buffer
    a = 8'd12; command = 4'b1111; out_enable = 1;
    #10;
    if (y !== 16'd12) $display("FAIL: Buffer failed, expected 12 but got %d", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule