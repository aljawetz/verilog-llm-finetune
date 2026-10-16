`timescale 1ns/1ps

module tb_b2g;

  reg b3, b2, b1, b0;
  wire g3, g2, g1, g0;

  // Instantiate the module under test (uut)
  b2g uut (
    .b3(b3),
    .b2(b2),
    .b1(b1),
    .b0(b0),
    .g3(g3),
    .g2(g2),
    .g1(g1),
    .g0(g0)
  );

  initial begin
    // Test all 16 combinations of 4-bit binary input
    {b3, b2, b1, b0} = 4'b0000; #10;
    if ({g3, g2, g1, g0} !== 4'b0000) $display("FAIL: Input 0000, expected 0000, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0001; #10;
    if ({g3, g2, g1, g0} !== 4'b0001) $display("FAIL: Input 0001, expected 0001, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0010; #10;
    if ({g3, g2, g1, g0} !== 4'b0011) $display("FAIL: Input 0010, expected 0011, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0011; #10;
    if ({g3, g2, g1, g0} !== 4'b0010) $display("FAIL: Input 0011, expected 0010, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0100; #10;
    if ({g3, g2, g1, g0} !== 4'b0110) $display("FAIL: Input 0100, expected 0110, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0101; #10;
    if ({g3, g2, g1, g0} !== 4'b0111) $display("FAIL: Input 0101, expected 0111, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0110; #10;
    if ({g3, g2, g1, g0} !== 4'b0101) $display("FAIL: Input 0110, expected 0101, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b0111; #10;
    if ({g3, g2, g1, g0} !== 4'b0100) $display("FAIL: Input 0111, expected 0100, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1000; #10;
    if ({g3, g2, g1, g0} !== 4'b1100) $display("FAIL: Input 1000, expected 1100, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1001; #10;
    if ({g3, g2, g1, g0} !== 4'b1101) $display("FAIL: Input 1001, expected 1101, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1010; #10;
    if ({g3, g2, g1, g0} !== 4'b1111) $display("FAIL: Input 1010, expected 1111, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1011; #10;
    if ({g3, g2, g1, g0} !== 4'b1110) $display("FAIL: Input 1011, expected 1110, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1100; #10;
    if ({g3, g2, g1, g0} !== 4'b1010) $display("FAIL: Input 1100, expected 1010, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1101; #10;
    if ({g3, g2, g1, g0} !== 4'b1011) $display("FAIL: Input 1101, expected 1011, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1110; #10;
    if ({g3, g2, g1, g0} !== 4'b1001) $display("FAIL: Input 1110, expected 1001, got %b", {g3, g2, g1, g0});
    
    {b3, b2, b1, b0} = 4'b1111; #10;
    if ({g3, g2, g1, g0} !== 4'b1000) $display("FAIL: Input 1111, expected 1000, got %b", {g3, g2, g1, g0});
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule