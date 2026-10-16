`timescale 1ns/1ps

module tb_alu;

  reg [7:0] a;
  reg [7:0] b;
  reg [3:0] command;
  reg out_enable;
  wire [15:0] y;

  // Instantiate the ALU
  alu uut (
    .a(a),
    .b(b),
    .command(command),
    .out_enable(out_enable),
    .y(y)
  );

  initial begin
    // Test case 1: Addition
    a = 8'd15; b = 8'd10; command = 4'b0000; out_enable = 1;
    #10;
    if (y !== 16'd25) $display("FAIL: Addition failed");

    // Test case 2: Increment
    a = 8'd15; command = 4'b0001; out_enable = 1;
    #10;
    if (y !== 16'd16) $display("FAIL: Increment failed");

    // Test case 3: Subtraction
    a = 8'd20; b = 8'd5; command = 4'b0010; out_enable = 1;
    #10;
    if (y !== 16'd15) $display("FAIL: Subtraction failed");

    // Test case 4: Decrement
    a = 8'd10; command = 4'b0011; out_enable = 1;
    #10;
    if (y !== 16'd9) $display("FAIL: Decrement failed");

    // Test case 5: Multiplication
    a = 8'd3; b = 8'd4; command = 4'b0100; out_enable = 1;
    #10;
    if (y !== 16'd12) $display("FAIL: Multiplication failed");

    // Test case 6: Division
    a = 8'd20; b = 8'd4; command = 4'b0101; out_enable = 1;
    #10;
    if (y !== 16'd5) $display("FAIL: Division failed");

    // Test case 7: Logical AND
    a = 8'b11001100; b = 8'b10101010; command = 4'b1000; out_enable = 1;
    #10;
    if (y !== 16'b10001000) $display("FAIL: Logical AND failed");

    // Test case 8: Logical OR
    a = 8'b11001100; b = 8'b10101010; command = 4'b1001; out_enable = 1;
    #10;
    if (y !== 16'b11101110) $display("FAIL: Logical OR failed");

    // Test case 9: Logical XOR
    a = 8'b11001100; b = 8'b10101010; command = 4'b1101; out_enable = 1;
    #10;
    if (y !== 16'b01100110) $display("FAIL: Logical XOR failed");

    // Test case 10: Buffer
    a = 8'd42; command = 4'b1111; out_enable = 1;
    #10;
    if (y !== 16'd42) $display("FAIL: Buffer failed");

    // Test case 11: High impedance
    a = 8'd1; b = 8'd1; command = 4'b0000; out_enable = 0;
    #10;
    if (y !== 16'hzzzz) $display("FAIL: High impedance failed");

    $display("PASS");
    $finish;
  end

endmodule