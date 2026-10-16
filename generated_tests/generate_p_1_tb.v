`timescale 1ns/1ps

module tb_generate_p;

  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] p;
  wire bp;

  // Instantiate the module under test (uut)
  generate_p uut (
    .a(a),
    .b(b),
    .p(p),
    .bp(bp)
  );

  initial begin
    // Test case 1: a = 4'b0000, b = 4'b0000
    a = 4'b0000; b = 4'b0000;
    #10;
    if (p !== 4'b0000 || bp !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: a = 4'b1111, b = 4'b1111
    a = 4'b1111; b = 4'b1111;
    #10;
    if (p !== 4'b0000 || bp !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: a = 4'b1010, b = 4'b0101
    a = 4'b1010; b = 4'b0101;
    #10;
    if (p !== 4'b1111 || bp !== 1'b1) $display("FAIL: Test case 3 failed");

    // Test case 4: a = 4'b1100, b = 4'b0011
    a = 4'b1100; b = 4'b0011;
    #10;
    if (p !== 4'b1111 || bp !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: a = 4'b1001, b = 4'b0110
    a = 4'b1001; b = 4'b0110;
    #10;
    if (p !== 4'b1111 || bp !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: a = 4'b0001, b = 4'b0001
    a = 4'b0001; b = 4'b0001;
    #10;
    if (p !== 4'b0000 || bp !== 1'b0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule