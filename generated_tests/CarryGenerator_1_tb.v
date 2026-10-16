`timescale 1ns/1ps

module tb_CarryGenerator;

  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] c;

  // Instantiate the CarryGenerator module
  CarryGenerator uut (
    .a(a),
    .b(b),
    .cin(cin),
    .c(c)
  );

  initial begin
    // Test case 1: Simple carry
    a = 4'b0001; b = 4'b0001; cin = 0; #10;
    if (c !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", c);

    // Test case 2: Carry with cin
    a = 4'b0001; b = 4'b0001; cin = 1; #10;
    if (c !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", c);

    // Test case 3: Multiple carries
    a = 4'b1111; b = 4'b1111; cin = 0; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 3 failed, expected 1111, got %b", c);

    // Test case 4: Carry propagation
    a = 4'b1010; b = 4'b0101; cin = 0; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 4 failed, expected 1111, got %b", c);

    // Test case 5: No carry
    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    if (c !== 4'b0000) $display("FAIL: Test case 5 failed, expected 0000, got %b", c);

    // Test case 6: Carry with different inputs
    a = 4'b0110; b = 4'b1001; cin = 1; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 6 failed, expected 1111, got %b", c);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule