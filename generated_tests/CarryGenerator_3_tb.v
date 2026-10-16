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
    // Test case 1: Simple carry generation
    a = 4'b0001; b = 4'b0001; cin = 0; #10;
    if (c !== 4'b0000) $display("FAIL: Test case 1 failed, expected c=0000, got c=%b", c);

    // Test case 2: Propagate with carry in
    a = 4'b0011; b = 4'b0011; cin = 1; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 2 failed, expected c=1111, got c=%b", c);

    // Test case 3: Generate carry without carry in
    a = 4'b1100; b = 4'b1100; cin = 0; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 3 failed, expected c=1111, got c=%b", c);

    // Test case 4: Mixed inputs
    a = 4'b1010; b = 4'b0101; cin = 0; #10;
    if (c !== 4'b0000) $display("FAIL: Test case 4 failed, expected c=0000, got c=%b", c);

    // Test case 5: All ones with carry in
    a = 4'b1111; b = 4'b1111; cin = 1; #10;
    if (c !== 4'b1111) $display("FAIL: Test case 5 failed, expected c=1111, got c=%b", c);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule