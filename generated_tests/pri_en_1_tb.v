`timescale 1ns/1ps

module tb_pri_en;

  reg [7:0] d;
  reg en;
  wire [2:0] y;

  // Instantiate the unit under test (UUT)
  pri_en uut (
    .d(d),
    .en(en),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with the least significant bit active
    en = 1;
    d = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

    // Test case 2: Enable with the second least significant bit active
    d = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

    // Test case 3: Enable with the third least significant bit active
    d = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

    // Test case 4: Enable with the fourth least significant bit active
    d = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

    // Test case 5: Enable with the fifth least significant bit active
    d = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

    // Test case 6: Enable with the sixth least significant bit active
    d = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

    // Test case 7: Enable with the seventh least significant bit active
    d = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

    // Test case 8: Enable with the most significant bit active
    d = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

    // Test case 9: Disable the encoder
    en = 0; d = 8'b11111111; #10;
    if (y !== 3'bxxx) $display("FAIL: Test case 9 failed, expected xxx, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule