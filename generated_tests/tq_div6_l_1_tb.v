`timescale 1ns/1ps

module tb_tq_div6_l;
  reg [5:0] qp_i;
  wire [3:0] div_o;

  // Instantiate the module under test (uut)
  tq_div6_l uut (
    .qp_i(qp_i),
    .div_o(div_o)
  );

  initial begin
    // Test cases
    qp_i = 6'b000000; #10; // 0
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000000, got %b", div_o);
    
    qp_i = 6'b000001; #10; // 1
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000001, got %b", div_o);
    
    qp_i = 6'b000010; #10; // 2
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000010, got %b", div_o);
    
    qp_i = 6'b000011; #10; // 3
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000011, got %b", div_o);
    
    qp_i = 6'b000100; #10; // 4
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000100, got %b", div_o);
    
    qp_i = 6'b000101; #10; // 5
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 000101, got %b", div_o);
    
    qp_i = 6'b000110; #10; // 6
    if (div_o !== 4'b0001) $display("FAIL: Expected 0001 for input 000110, got %b", div_o);
    
    qp_i = 6'b001011; #10; // 11
    if (div_o !== 4'b0001) $display("FAIL: Expected 0001 for input 001011, got %b", div_o);
    
    qp_i = 6'b001100; #10; // 12
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 001100, got %b", div_o);
    
    qp_i = 6'b001111; #10; // 15
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 001111, got %b", div_o);
    
    qp_i = 6'b010000; #10; // 16
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 010000, got %b", div_o);
    
    qp_i = 6'b010001; #10; // 17
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 010001, got %b", div_o);
    
    qp_i = 6'b010010; #10; // 18
    if (div_o !== 4'b0011) $display("FAIL: Expected 0011 for input 010010, got %b", div_o);
    
    qp_i = 6'b011011; #10; // 27
    if (div_o !== 4'b0100) $display("FAIL: Expected 0100 for input 011011, got %b", div_o);
    
    qp_i = 6'b011111; #10; // 31
    if (div_o !== 4'b0101) $display("FAIL: Expected 0101 for input 011111, got %b", div_o);
    
    qp_i = 6'b100000; #10; // 32
    if (div_o !== 4'b0101) $display("FAIL: Expected 0101 for input 100000, got %b", div_o);
    
    qp_i = 6'b100101; #10; // 37
    if (div_o !== 4'b0110) $display("FAIL: Expected 0110 for input 100101, got %b", div_o);
    
    qp_i = 6'b101011; #10; // 43
    if (div_o !== 4'b0111) $display("FAIL: Expected 0111 for input 101011, got %b", div_o);
    
    qp_i = 6'b110000; #10; // 48
    if (div_o !== 4'b1000) $display("FAIL: Expected 1000 for input 110000, got %b", div_o);
    
    qp_i = 6'b111111; #10; // 63
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 111111, got %b", div_o);
    
    $display("PASS");
    $finish;
  end
endmodule