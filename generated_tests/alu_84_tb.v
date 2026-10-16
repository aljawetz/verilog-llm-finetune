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
    a = 8'd10; b = 8'd20; command = 4'b0000; out_enable = 1;
    #10;
    if (y !== 16'd30) $display("FAIL: ADD operation failed");

    // Test case 2: INC
    a = 8'd15; command = 4'b0001; out_enable = 1;
    #10;
    if (y !== 16'd16) $display("FAIL: INC operation failed");

    // Test case 3: SUB
    a = 8'd30; b = 8'd10; command = 4'b0010; out_enable = 1;
    #10;
    if (y !== 16'd20) $display("FAIL: SUB operation failed");

    // Test case 4: DEC
    a = 8'd25; command = 4'b0011; out_enable = 1;
    #10;
    if (y !== 16'd24) $display("FAIL: DEC operation failed");

    // Test case 5: MUL
    a = 8'd5; b = 8'd6; command = 4'b0100; out_enable = 1;
    #10;
    if (y !== 16'd30) $display("FAIL: MUL operation failed");

    // Test case 6: DIV
    a = 8'd40; b = 8'd5; command = 4'b0101; out_enable = 1;
    #10;
    if (y !== 16'd8) $display("FAIL: DIV operation failed");

    // Test case 7: SHL
    a = 8'd2; b = 8'd1; command = 4'b0110; out_enable = 1;
    #10;
    if (y !== 16'd4) $display("FAIL: SHL operation failed");

    // Test case 8: SHR
    a = 8'd4; b = 8'd1; command = 4'b0111; out_enable = 1;
    #10;
    if (y !== 16'd2) $display("FAIL: SHR operation failed");

    // Test case 9: AND
    a = 8'd12; b = 8'd5; command = 4'b1000; out_enable = 1;
    #10;
    if (y !== 16'd4) $display("FAIL: AND operation failed");

    // Test case 10: OR
    a = 8'd12; b = 8'd5; command = 4'b1001; out_enable = 1;
    #10;
    if (y !== 16'd13) $display("FAIL: OR operation failed");

    // Test case 11: INV
    a = 8'd255; command = 4'b1010; out_enable = 1;
    #10;
    if (y !== 16'd0) $display("FAIL: INV operation failed");

    // Test case 12: NAND
    a = 8'd12; b = 8'd5; command = 4'b1011; out_enable = 1;
    #10;
    if (y !== 16'd11) $display("FAIL: NAND operation failed");

    // Test case 13: NOR
    a = 8'd12; b = 8'd5; command = 4'b1100; out_enable = 1;
    #10;
    if (y !== 16'd0) $display("FAIL: NOR operation failed");

    // Test case 14: XOR
    a = 8'd12; b = 8'd5; command = 4'b1101; out_enable = 1;
    #10;
    if (y !== 16'd9) $display("FAIL: XOR operation failed");

    // Test case 15: XNOR
    a = 8'd12; b = 8'd5; command = 4'b1110; out_enable = 1;
    #10;
    if (y !== 16'd6) $display("FAIL: XNOR operation failed");

    // Test case 16: BUF
    a = 8'd100; command = 4'b1111; out_enable = 1;
    #10;
    if (y !== 16'd100) $display("FAIL: BUF operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule