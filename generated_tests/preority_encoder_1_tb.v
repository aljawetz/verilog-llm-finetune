`timescale 1ns/1ps

module tb_priority_encoder;
  reg en;
  reg [7:0] in;
  wire [2:0] op;

  // Instantiate the module under test
  preority_encoder uut (
    .en(en),
    .in(in),
    .op(op)
  );

  initial begin
    // Test case 1: Enable with the least significant bit set
    en = 1;
    in = 8'b00000001; 
    #10;
    if (op !== 3'b000) $display("FAIL: Test case 1 failed, expected op=000, got op=%b", op);

    // Test case 2: Enable with the second least significant bit set
    in = 8'b00000010; 
    #10;
    if (op !== 3'b001) $display("FAIL: Test case 2 failed, expected op=001, got op=%b", op);

    // Test case 3: Enable with the third least significant bit set
    in = 8'b00000100; 
    #10;
    if (op !== 3'b010) $display("FAIL: Test case 3 failed, expected op=010, got op=%b", op);

    // Test case 4: Enable with the fourth least significant bit set
    in = 8'b00001000; 
    #10;
    if (op !== 3'b011) $display("FAIL: Test case 4 failed, expected op=011, got op=%b", op);

    // Test case 5: Enable with the fifth least significant bit set
    in = 8'b00010000; 
    #10;
    if (op !== 3'b100) $display("FAIL: Test case 5 failed, expected op=100, got op=%b", op);

    // Test case 6: Enable with the sixth least significant bit set
    in = 8'b00100000; 
    #10;
    if (op !== 3'b101) $display("FAIL: Test case 6 failed, expected op=101, got op=%b", op);

    // Test case 7: Enable with the seventh least significant bit set
    in = 8'b01000000; 
    #10;
    if (op !== 3'b110) $display("FAIL: Test case 7 failed, expected op=110, got op=%b", op);

    // Test case 8: Enable with the most significant bit set
    in = 8'b10000000; 
    #10;
    if (op !== 3'b111) $display("FAIL: Test case 8 failed, expected op=111, got op=%b", op);

    // Test case 9: Disable the encoder
    en = 0;
    in = 8'b11111111; 
    #10;
    if (op !== 3'b000) $display("FAIL: Test case 9 failed, expected op=000, got op=%b", op);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule