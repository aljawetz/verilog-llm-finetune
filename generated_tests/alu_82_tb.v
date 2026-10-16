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
    // Test case 1: ADD
    a_in = 8'd10; b_in = 8'd20; command_in = 4'b0000; oe = 1;
    #10;
    if (d_out !== 16'd30) $display("FAIL: ADD operation failed");
    
    // Test case 2: INC
    a_in = 8'd15; command_in = 4'b0001; oe = 1;
    #10;
    if (d_out !== 16'd16) $display("FAIL: INC operation failed");
    
    // Test case 3: SUB
    a_in = 8'd30; b_in = 8'd10; command_in = 4'b0010; oe = 1;
    #10;
    if (d_out !== 16'd20) $display("FAIL: SUB operation failed");
    
    // Test case 4: DEC
    a_in = 8'd25; command_in = 4'b0011; oe = 1;
    #10;
    if (d_out !== 16'd24) $display("FAIL: DEC operation failed");
    
    // Test case 5: MUL
    a_in = 8'd5; b_in = 8'd6; command_in = 4'b0100; oe = 1;
    #10;
    if (d_out !== 16'd30) $display("FAIL: MUL operation failed");
    
    // Test case 6: DIV
    a_in = 8'd40; b_in = 8'd5; command_in = 4'b0101; oe = 1;
    #10;
    if (d_out !== 16'd8) $display("FAIL: DIV operation failed");
    
    // Test case 7: SHL
    a_in = 8'd2; command_in = 4'b0110; oe = 1;
    #10;
    if (d_out !== 16'd4) $display("FAIL: SHL operation failed");
    
    // Test case 8: SHR
    a_in = 8'd4; command_in = 4'b0111; oe = 1;
    #10;
    if (d_out !== 16'd2) $display("FAIL: SHR operation failed");
    
    // Test case 9: AND
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1000; oe = 1;
    #10;
    if (d_out !== 16'b10001000) $display("FAIL: AND operation failed");
    
    // Test case 10: OR
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1001; oe = 1;
    #10;
    if (d_out !== 16'b11101110) $display("FAIL: OR operation failed");
    
    // Test case 11: INV
    a_in = 8'b00001111; command_in = 4'b1010; oe = 1;
    #10;
    if (d_out !== 16'b11110000) $display("FAIL: INV operation failed");
    
    // Test case 12: NAND
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1011; oe = 1;
    #10;
    if (d_out !== 16'b01110011) $display("FAIL: NAND operation failed");
    
    // Test case 13: NOR
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1100; oe = 1;
    #10;
    if (d_out !== 16'b00000000) $display("FAIL: NOR operation failed");
    
    // Test case 14: XOR
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1101; oe = 1;
    #10;
    if (d_out !== 16'b01100110) $display("FAIL: XOR operation failed");
    
    // Test case 15: XNOR
    a_in = 8'b11001100; b_in = 8'b10101010; command_in = 4'b1110; oe = 1;
    #10;
    if (d_out !== 16'b10011001) $display("FAIL: XNOR operation failed");
    
    // Test case 16: BUF
    a_in = 8'd100; command_in = 4'b1111; oe = 1;
    #10;
    if (d_out !== 16'd100) $display("FAIL: BUF operation failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule