`timescale 1ns/1ps

module tb_alu_adder;

  parameter ADDER_WIDTH = 8;

  reg [ADDER_WIDTH - 1 :0] x;
  reg [ADDER_WIDTH - 1 :0] y;
  reg carry_in;
  reg ORsel;
  reg XORsel;
  
  wire [ADDER_WIDTH - 1 :0] xor_result;
  wire [ADDER_WIDTH - 1 :0] or_result;
  wire [ADDER_WIDTH - 1 :0] and_result;
  wire [ADDER_WIDTH :0] carry_out;
  wire [ADDER_WIDTH - 1 :0] z;

  alu_adder uut (
    .x(x),
    .y(y),
    .carry_in(carry_in),
    .ORsel(ORsel),
    .XORsel(XORsel),
    .xor_result(xor_result),
    .or_result(or_result),
    .and_result(and_result),
    .carry_out(carry_out),
    .z(z)
  );

  initial begin
    // Test case 1: Basic addition without carry
    x = 8'b00001111; 
    y = 8'b00000001; 
    carry_in = 0; 
    ORsel = 0; 
    XORsel = 0;
    #10;
    if (z !== 8'b00010000 || carry_out !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: Addition with carry
    x = 8'b11111111; 
    y = 8'b00000001; 
    carry_in = 0; 
    ORsel = 0; 
    XORsel = 0;
    #10;
    if (z !== 8'b00000000 || carry_out !== 1'b1) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: XOR operation
    x = 8'b10101010; 
    y = 8'b01010101; 
    carry_in = 0; 
    ORsel = 0; 
    XORsel = 1;
    #10;
    if (xor_result !== 8'b11111111) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: OR operation
    x = 8'b10101010; 
    y = 8'b01010101; 
    carry_in = 0; 
    ORsel = 1; 
    XORsel = 0;
    #10;
    if (or_result !== 8'b11111111) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: AND operation
    x = 8'b10101010; 
    y = 8'b01010101; 
    carry_in = 0; 
    ORsel = 0; 
    XORsel = 0;
    #10;
    if (and_result !== 8'b00000000) 
      $display("FAIL: Test case 5 failed");

    $display("PASS");
    $finish;
  end

endmodule