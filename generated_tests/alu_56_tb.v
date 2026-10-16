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
    // Test case 1: ADD
    a = 8'd15; b = 8'd10; command = 4'b0000; out_enable = 1;
    #10;
    if (y !== 16'd25) $display("FAIL: ADD operation failed");

    // Test case 2: INC
    a = 8'd15; command = 4'b0001; out_enable = 1;
    #10;
    if (y !== 16'd16) $display("FAIL: INC operation failed");

    // Test case 3: SUB
    a = 8'd15; b = 8'd10; command = 4'b0010; out_enable = 1;
    #10;
    if (y !== 16'd5) $display("FAIL: SUB operation failed");

    // Test case 4: DEC
    a = 8'd15; command = 4'b0011; out_enable = 1;
    #10;
    if (y !== 16'd14) $display("FAIL: DEC operation failed");

    // Test case 5: MUL
    a = 8'd3; b = 8'd4; command = 4'b0100; out_enable = 1;
    #10;
    if (y !== 16'd12) $display("FAIL: MUL operation failed");

    // Test case 6: DIV
    a = 8'd20; b = 8'd4; command = 4'b0101; out_enable = 1;
    #10;
    if (y !== 16'd5) $display("FAIL: DIV operation failed");

    // Test case 7: SHL
    a = 8'd2; b = 8'd1; command = 4'b0110; out_enable = 1;
    #10;
    if (y !== 16'd4) $display("FAIL: SHL operation failed");

    // Test case 8: SHR
    a = 8'd4; b = 8'd1; command = 4'b0111; out_enable = 1;
    #10;
    if (y !== 16'd2) $display("FAIL: SHR operation failed");

    // Test case 9: AND
    a = 8'd15; b = 8'd7; command = 4'b1000; out_enable = 1;
    #10;
    if (y !== 16'd7) $display("FAIL: AND operation failed");

    // Test case 10: OR
    a = 8'd15; b = 8'd7; command = 4'b1001; out_enable = 1;
    #10;
    if (y !== 16'd15) $display("FAIL: OR operation failed");

    // Test case 11: INV
    a = 8'd15; command = 4'b1010; out_enable = 1;
    #10;
    if (y !== 16'd240) $display("FAIL: INV operation failed");

    // Test case 12: NAND
    a = 8'd15; b = 8'd7; command = 4'b1011; out_enable = 1;
    #10;
    if (y !== 16'd8) $display("FAIL: NAND operation failed");

    // Test case 13: NOR
    a = 8'd15; b = 8'd7; command = 4'b1100; out_enable = 1;
    #10;
    if (y !== 16'd0) $display("FAIL: NOR operation failed");

    // Test case 14: XOR
    a = 8'd15; b = 8'd7; command = 4'b1101; out_enable = 1;
    #10;
    if (y !== 16'd8) $display("FAIL: XOR operation failed");

    // Test case 15: XNOR
    a = 8'd15; b = 8'd7; command = 4'b1110; out_enable = 1;
    #10;
    if (y !== 16'd7) $display("FAIL: XNOR operation failed");

    // Test case 16: BUF
    a = 8'd15; command = 4'b1111; out_enable = 1;
    #10;
    if (y !== 16'd15) $display("FAIL: BUF operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule