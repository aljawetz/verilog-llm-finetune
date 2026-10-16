`timescale 1ns/1ps

module tb_EncodeChan;

  reg [8:0] E;
  reg [8:0] A;
  reg [8:0] B;
  reg [8:0] C;
  reg PA;
  reg PB;
  reg PC;
  wire [8:0] I;

  // Instantiate the module under test
  EncodeChan uut (
    .E(E),
    .A(A),
    .B(B),
    .C(C),
    .PA(PA),
    .PB(PB),
    .PC(PC),
    .I(I)
  );

  initial begin
    // Test case 1: All inputs zero, expect output zero
    E = 9'b000000000; A = 9'b000000000; B = 9'b000000000; C = 9'b000000000; 
    PA = 0; PB = 0; PC = 0;
    #10;
    if (I !== 9'b000000000) $display("FAIL: Test case 1 failed, expected 000000000, got %b", I);

    // Test case 2: All inputs one, expect output one
    E = 9'b111111111; A = 9'b111111111; B = 9'b111111111; C = 9'b111111111; 
    PA = 0; PB = 0; PC = 0;
    #10;
    if (I !== 9'b000000000) $display("FAIL: Test case 2 failed, expected 000000000, got %b", I);

    // Test case 3: Mask A, expect output to reflect B and C
    E = 9'b111111111; A = 9'b111111111; B = 9'b101010101; C = 9'b010101010; 
    PA = 1; PB = 0; PC = 0;
    #10;
    if (I !== 9'b010101010) $display("FAIL: Test case 3 failed, expected 010101010, got %b", I);

    // Test case 4: Mask B, expect output to reflect A and C
    E = 9'b111111111; A = 9'b101010101; B = 9'b111111111; C = 9'b010101010; 
    PA = 0; PB = 1; PC = 0;
    #10;
    if (I !== 9'b010101010) $display("FAIL: Test case 4 failed, expected 010101010, got %b", I);

    // Test case 5: Mask C, expect output to reflect A and B
    E = 9'b111111111; A = 9'b101010101; B = 9'b010101010; C = 9'b111111111; 
    PA = 0; PB = 0; PC = 1;
    #10;
    if (I !== 9'b101010101) $display("FAIL: Test case 5 failed, expected 101010101, got %b", I);

    // Test case 6: Mask all inputs, expect output to be all ones
    E = 9'b111111111; A = 9'b101010101; B = 9'b010101010; C = 9'b111111111; 
    PA = 1; PB = 1; PC = 1;
    #10;
    if (I !== 9'b000000000) $display("FAIL: Test case 6 failed, expected 000000000, got %b", I);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule