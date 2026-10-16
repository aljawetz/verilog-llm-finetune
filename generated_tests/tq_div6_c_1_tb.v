`timescale 1ns/1ps

module tb_tq_div6_c;
  reg [5:0] qp_i;
  wire [3:0] div_o;
  
  // Instantiate the module under test (uut)
  tq_div6_c uut (
    .qp_i(qp_i),
    .div_o(div_o)
  );

  initial begin
    // Test cases
    qp_i = 6'b000000; #10; // 0
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 0, got %b", div_o);
    
    qp_i = 6'b000011; #10; // 3
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 3, got %b", div_o);
    
    qp_i = 6'b000110; #10; // 6
    if (div_o !== 4'b0001) $display("FAIL: Expected 0001 for input 6, got %b", div_o);
    
    qp_i = 6'b001011; #10; // 11
    if (div_o !== 4'b0001) $display("FAIL: Expected 0001 for input 11, got %b", div_o);
    
    qp_i = 6'b001100; #10; // 12
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 12, got %b", div_o);
    
    qp_i = 6'b001111; #10; // 15
    if (div_o !== 4'b0010) $display("FAIL: Expected 0010 for input 15, got %b", div_o);
    
    qp_i = 6'b010010; #10; // 18
    if (div_o !== 4'b0011) $display("FAIL: Expected 0011 for input 18, got %b", div_o);
    
    qp_i = 6'b011000; #10; // 24
    if (div_o !== 4'b0100) $display("FAIL: Expected 0100 for input 24, got %b", div_o);
    
    qp_i = 6'b011111; #10; // 31
    if (div_o !== 4'b0101) $display("FAIL: Expected 0101 for input 31, got %b", div_o);
    
    qp_i = 6'b100100; #10; // 36
    if (div_o !== 4'b0101) $display("FAIL: Expected 0101 for input 36, got %b", div_o);
    
    qp_i = 6'b110000; #10; // 48
    if (div_o !== 4'b0110) $display("FAIL: Expected 0110 for input 48, got %b", div_o);
    
    qp_i = 6'b111111; #10; // 63 (default case)
    if (div_o !== 4'b0000) $display("FAIL: Expected 0000 for input 63, got %b", div_o);

    $display("PASS");
    $finish;
  end
endmodule