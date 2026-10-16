`timescale 1ns/1ps

module tb_and2;

  // Inputs
  reg [5:0] a;
  reg [5:0] b;
  reg [5:0] c;

  // Outputs
  wire [5:0] d;

  // Instantiate the Unit Under Test (UUT)
  and2 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 6'b000000; b = 6'b000000; c = 6'b000000;
    #10;
    if (d !== 6'b000000) $display("FAIL: Test case 1 failed, expected 000000, got %b", d);

    // Test case 2: All inputs are 1
    a = 6'b111111; b = 6'b111111; c = 6'b111111;
    #10;
    if (d !== 6'b111111) $display("FAIL: Test case 2 failed, expected 111111, got %b", d);

    // Test case 3: Mixed inputs
    a = 6'b101010; b = 6'b110011; c = 6'b111100;
    #10;
    if (d !== 6'b100010) $display("FAIL: Test case 3 failed, expected 100010, got %b", d);

    // Test case 4: One input is zero
    a = 6'b111111; b = 6'b000000; c = 6'b111111;
    #10;
    if (d !== 6'b000000) $display("FAIL: Test case 4 failed, expected 000000, got %b", d);

    // Test case 5: One input is all ones, others are zeros
    a = 6'b111111; b = 6'b000000; c = 6'b000000;
    #10;
    if (d !== 6'b000000) $display("FAIL: Test case 5 failed, expected 000000, got %b", d);

    // Test case 6: Random values
    a = 6'b101101; b = 6'b011011; c = 6'b110101;
    #10;
    if (d !== 6'b001001) $display("FAIL: Test case 6 failed, expected 001001, got %b", d);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule