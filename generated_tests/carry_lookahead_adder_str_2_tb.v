`timescale 1ns/1ps

module tb_carry_lookahead_adder_str;
  reg [3:0] a, b;
  reg c;
  wire [3:0] s;
  wire co;

  // Instantiate the carry lookahead adder
  carry_lookahead_adder_str uut (
    .a(a),
    .b(b),
    .c(c),
    .s(s),
    .co(co)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, co = 0
    a = 4'b0000; b = 4'b0000; c = 1'b0;
    #10;
    if (s !== 4'b0000 || co !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 10, co = 1
    a = 4'b0001; b = 4'b0001; c = 1'b0;
    #10;
    if (s !== 4'b0010 || co !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 3 + 3 + 0 = 6, co = 0
    a = 4'b0011; b = 4'b0011; c = 1'b0;
    #10;
    if (s !== 4'b0110 || co !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 1 + 0 = 8, co = 0
    a = 4'b0111; b = 4'b0001; c = 1'b0;
    #10;
    if (s !== 4'b1000 || co !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 8 + 7 + 0 = 15, co = 0
    a = 4'b1000; b = 4'b0111; c = 1'b0;
    #10;
    if (s !== 4'b1111 || co !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 15 + 1 + 0 = 0, co = 1 (overflow)
    a = 4'b1111; b = 4'b0001; c = 1'b0;
    #10;
    if (s !== 4'b0000 || co !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 1 = 11, co = 1
    a = 4'b0001; b = 4'b0001; c = 1'b1;
    #10;
    if (s !== 4'b0011 || co !== 1'b0) $display("FAIL: Test case 7 failed");

    // Test case 8: 2 + 2 + 1 = 5, co = 0
    a = 4'b0010; b = 4'b0010; c = 1'b1;
    #10;
    if (s !== 4'b0101 || co !== 1'b0) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule