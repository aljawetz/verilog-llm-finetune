`timescale 1ns/1ps

module tb_bin_2scomp;

  reg [7:0] a, b, c;
  wire [8:0] x, y, z;

  // Instantiate the module under test (uut)
  bin_2scomp uut (
    .a(a),
    .b(b),
    .c(c),
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    // Test case 1: a = 8'b00000000 (0), b = 8'b00000001 (1), c = 8'b00000010 (2)
    a = 8'b00000000; b = 8'b00000001; c = 8'b00000010;
    #10;
    if (x !== 9'b000000000 || y !== 9'b000000001 || z !== 9'b000000010) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 8'b11111111 (-1), b = 8'b11111110 (-2), c = 8'b11111101 (-3)
    a = 8'b11111111; b = 8'b11111110; c = 8'b11111101;
    #10;
    if (x !== 9'b000000001 || y !== 9'b000000010 || z !== 9'b000000011) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 8'b00001111 (15), b = 8'b00010000 (16), c = 8'b00111111 (63)
    a = 8'b00001111; b = 8'b00010000; c = 8'b00111111;
    #10;
    if (x !== 9'b00010001 || y !== 9'b000011111 || z !== 9'b11000001) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 8'b10101010 (-86), b = 8'b01010101 (85), c = 8'b00000000 (0)
    a = 8'b10101010; b = 8'b01010101; c = 8'b00000000;
    #10;
    if (x !== 9'b000101010 || y !== 9'b000001010 || z !== 9'b000000000) 
      $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule