`timescale 1ns/1ps

module tb_tq_mod6_c;
  reg [5:0] qp_i;
  wire [2:0] mod_o;
  
  // Instantiate the module under test
  tq_mod6_c uut (
    .qp_i(qp_i),
    .mod_o(mod_o)
  );

  initial begin
    // Test cases
    qp_i = 6'b000000; #10; // Expect mod_o = 3'b000
    if (mod_o !== 3'b000) $display("FAIL: Expected 3'b000 for qp_i = 6'b000000, got %b", mod_o);

    qp_i = 6'b000001; #10; // Expect mod_o = 3'b001
    if (mod_o !== 3'b001) $display("FAIL: Expected 3'b001 for qp_i = 6'b000001, got %b", mod_o);

    qp_i = 6'b000010; #10; // Expect mod_o = 3'b010
    if (mod_o !== 3'b010) $display("FAIL: Expected 3'b010 for qp_i = 6'b000010, got %b", mod_o);

    qp_i = 6'b000011; #10; // Expect mod_o = 3'b011
    if (mod_o !== 3'b011) $display("FAIL: Expected 3'b011 for qp_i = 6'b000011, got %b", mod_o);

    qp_i = 6'b000100; #10; // Expect mod_o = 3'b100
    if (mod_o !== 3'b100) $display("FAIL: Expected 3'b100 for qp_i = 6'b000100, got %b", mod_o);

    qp_i = 6'b000101; #10; // Expect mod_o = 3'b101
    if (mod_o !== 3'b101) $display("FAIL: Expected 3'b101 for qp_i = 6'b000101, got %b", mod_o);

    qp_i = 6'b000110; #10; // Expect mod_o = 3'b000 (default case)
    if (mod_o !== 3'b000) $display("FAIL: Expected 3'b000 for qp_i = 6'b000110, got %b", mod_o);

    qp_i = 6'b001111; #10; // Expect mod_o = 3'b011
    if (mod_o !== 3'b011) $display("FAIL: Expected 3'b011 for qp_i = 6'b001111, got %b", mod_o);

    qp_i = 6'b001010; #10; // Expect mod_o = 3'b010
    if (mod_o !== 3'b010) $display("FAIL: Expected 3'b010 for qp_i = 6'b001010, got %b", mod_o);

    qp_i = 6'b111111; #10; // Expect mod_o = 3'b000 (default case)
    if (mod_o !== 3'b000) $display("FAIL: Expected 3'b000 for qp_i = 6'b111111, got %b", mod_o);

    $display("PASS");
    $finish;
  end
endmodule