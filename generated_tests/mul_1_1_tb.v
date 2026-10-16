`timescale 1ns/1ps

module tb_mul_1;

  reg [3:0] a;
  reg [3:0] b;
  wire [7:0] p;

  // Instantiate the module under test (uut)
  mul_1 uut (
    .a(a),
    .b(b),
    .p(p)
  );

  initial begin
    // Test case 1: 2 * 3 = 6
    a = 4'b0010; // 2
    b = 4'b0011; // 3
    #10;
    if (p !== 8'b00000110) $display("FAIL: Test case 1 failed, expected 6 but got %d", p);

    // Test case 2: 4 * 5 = 20
    a = 4'b0100; // 4
    b = 4'b0101; // 5
    #10;
    if (p !== 8'b00010100) $display("FAIL: Test case 2 failed, expected 20 but got %d", p);

    // Test case 3: 0 * 15 = 0
    a = 4'b0000; // 0
    b = 4'b1111; // 15
    #10;
    if (p !== 8'b00000000) $display("FAIL: Test case 3 failed, expected 0 but got %d", p);

    // Test case 4: 7 * 7 = 49
    a = 4'b0111; // 7
    b = 4'b0111; // 7
    #10;
    if (p !== 8'b00110001) $display("FAIL: Test case 4 failed, expected 49 but got %d", p);

    // Test case 5: 15 * 15 = 225
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    #10;
    if (p !== 8'b11100001) $display("FAIL: Test case 5 failed, expected 225 but got %d", p);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule