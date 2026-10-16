`timescale 1ns/1ps

module tb_barrel_shifter;

  reg [7:0] a;
  reg [2:0] amt;
  wire [7:0] y;

  // Instantiate the barrel shifter
  barrel_shifter uut (
    .a(a),
    .amt(amt),
    .y(y)
  );

  initial begin
    // Test case 1: No shift
    a = 8'b10101010; amt = 3'b000; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 1 failed, expected 10101010, got %b", y);

    // Test case 2: Rotate right by 1
    a = 8'b10101010; amt = 3'b001; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 2 failed, expected 01010101, got %b", y);

    // Test case 3: Rotate right by 2
    a = 8'b10101010; amt = 3'b010; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 3 failed, expected 10101010, got %b", y);

    // Test case 4: Rotate right by 3
    a = 8'b10101010; amt = 3'b011; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 4 failed, expected 01010101, got %b", y);

    // Test case 5: Rotate right by 4
    a = 8'b10101010; amt = 3'b100; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 5 failed, expected 10101010, got %b", y);

    // Test case 6: Rotate right by 5
    a = 8'b10101010; amt = 3'b101; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 6 failed, expected 01010101, got %b", y);

    // Test case 7: Rotate right by 6
    a = 8'b10101010; amt = 3'b110; #10;
    if (y !== 8'b10101010) $display("FAIL: Test case 7 failed, expected 10101010, got %b", y);

    // Test case 8: Rotate right by 7
    a = 8'b10101010; amt = 3'b111; #10;
    if (y !== 8'b01010101) $display("FAIL: Test case 8 failed, expected 01010101, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule