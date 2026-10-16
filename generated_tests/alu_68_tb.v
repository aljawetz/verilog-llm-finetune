`timescale 1ns/1ps

module tb_alu;

  reg [7:0] a_in;
  reg [7:0] b_in;
  reg [3:0] command_in;
  reg oe;
  wire [15:0] d_out;

  // Instantiate the ALU module
  alu uut (
    .a_in(a_in),
    .b_in(b_in),
    .command_in(command_in),
    .oe(oe),
    .d_out(d_out)
  );

  initial begin
    // Test case 1: Addition
    a_in = 8'd15; b_in = 8'd10; command_in = 4'b0000; oe = 1;
    #10;
    if (d_out !== 16'd25) $display("FAIL: Addition failed");

    // Test case 2: Increment
    a_in = 8'd15; command_in = 4'b0001; oe = 1;
    #10;
    if (d_out !== 16'd16) $display("FAIL: Increment failed");

    // Test case 3: Subtraction
    a_in = 8'd20; b_in = 8'd5; command_in = 4'b0010; oe = 1;
    #10;
    if (d_out !== 16'd15) $display("FAIL: Subtraction failed");

    // Test case 4: Decrement
    a_in = 8'd10; command_in = 4'b0011; oe = 1;
    #10;
    if (d_out !== 16'd9) $display("FAIL: Decrement failed");

    // Test case 5: Multiplication
    a_in = 8'd3; b_in = 8'd4; command_in = 4'b0100; oe = 1;
    #10;
    if (d_out !== 16'd12) $display("FAIL: Multiplication failed");

    // Test case 6: Division
    a_in = 8'd20; b_in = 8'd4; command_in = 4'b0101; oe = 1;
    #10;
    if (d_out !== 16'd5) $display("FAIL: Division failed");

    // Test case 7: Shift Left
    a_in = 8'd2; command_in = 4'b0110; oe = 1;
    #10;
    if (d_out !== 16'd4) $display("FAIL: Shift Left failed");

    // Test case 8: Shift Right
    a_in = 8'd4; command_in = 4'b0111; oe = 1;
    #10;
    if (d_out !== 16'd2) $display("FAIL: Shift Right failed");

    // Test case 9: Logical AND
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1000; oe = 1;
    #10;
    if (d_out !== 16'd2) $display("FAIL: AND failed");

    // Test case 10: Logical OR
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1001; oe = 1;
    #10;
    if (d_out !== 16'd7) $display("FAIL: OR failed");

    // Test case 11: Logical Negation
    a_in = 8'd0; command_in = 4'b1010; oe = 1;
    #10;
    if (d_out !== 16'd1) $display("FAIL: Negation failed");

    // Test case 12: Bitwise NAND
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1011; oe = 1;
    #10;
    if (d_out !== 16'd5) $display("FAIL: NAND failed");

    // Test case 13: Bitwise NOR
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1100; oe = 1;
    #10;
    if (d_out !== 16'd248) $display("FAIL: NOR failed");

    // Test case 14: Bitwise XOR
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1101; oe = 1;
    #10;
    if (d_out !== 16'd5) $display("FAIL: XOR failed");

    // Test case 15: Bitwise XNOR
    a_in = 8'd6; b_in = 8'd3; command_in = 4'b1110; oe = 1;
    #10;
    if (d_out !== 16'd250) $display("FAIL: XNOR failed");

    // Test case 16: Buffer
    a_in = 8'd42; command_in = 4'b1111; oe = 1;
    #10;
    if (d_out !== 16'd42) $display("FAIL: Buffer failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule