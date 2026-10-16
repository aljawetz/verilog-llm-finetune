`timescale 1ns/1ps

module tb_priorityen;
  reg [7:0] din;
  reg en;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  priorityen uut (
    .din(din),
    .y(y),
    .en(en)
  );

  initial begin
    // Test case 1: Enable and input with only the least significant bit active
    en = 1;
    din = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);

    // Test case 2: Enable and input with the second least significant bit active
    din = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);

    // Test case 3: Enable and input with the third least significant bit active
    din = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);

    // Test case 4: Enable and input with the fourth least significant bit active
    din = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);

    // Test case 5: Enable and input with the fifth least significant bit active
    din = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);

    // Test case 6: Enable and input with the sixth least significant bit active
    din = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);

    // Test case 7: Enable and input with the seventh least significant bit active
    din = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);

    // Test case 8: Enable and input with the most significant bit active
    din = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);

    // Test case 9: Disable the encoder
    en = 0; din = 8'b11111111; #10;
    if (y !== 3'bzzz) $display("FAIL: Test case 9 failed, expected high impedance, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule