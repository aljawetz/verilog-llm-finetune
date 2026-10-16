`timescale 1ns/1ps

module tb_tq_mod6_l;
  reg [5:0] qp_i;
  wire [2:0] mod_o;

  // Instantiate the module under test (uut)
  tq_mod6_l uut (
    .qp_i(qp_i),
    .mod_o(mod_o)
  );

  initial begin
    // Test cases
    qp_i = 6'b000000; #10; // 0 % 6 = 0
    if (mod_o !== 3'b000) $display("FAIL: Expected 000 for input 0, got %b", mod_o);

    qp_i = 6'b000001; #10; // 1 % 6 = 1
    if (mod_o !== 3'b001) $display("FAIL: Expected 001 for input 1, got %b", mod_o);

    qp_i = 6'b000010; #10; // 2 % 6 = 2
    if (mod_o !== 3'b010) $display("FAIL: Expected 010 for input 2, got %b", mod_o);

    qp_i = 6'b000011; #10; // 3 % 6 = 3
    if (mod_o !== 3'b011) $display("FAIL: Expected 011 for input 3, got %b", mod_o);

    qp_i = 6'b000100; #10; // 4 % 6 = 4
    if (mod_o !== 3'b100) $display("FAIL: Expected 100 for input 4, got %b", mod_o);

    qp_i = 6'b000101; #10; // 5 % 6 = 5
    if (mod_o !== 3'b101) $display("FAIL: Expected 101 for input 5, got %b", mod_o);

    qp_i = 6'b000110; #10; // 6 % 6 = 0
    if (mod_o !== 3'b000) $display("FAIL: Expected 000 for input 6, got %b", mod_o);

    qp_i = 6'b000111; #10; // 7 % 6 = 1
    if (mod_o !== 3'b001) $display("FAIL: Expected 001 for input 7, got %b", mod_o);

    qp_i = 6'b001000; #10; // 8 % 6 = 2
    if (mod_o !== 3'b010) $display("FAIL: Expected 010 for input 8, got %b", mod_o);

    qp_i = 6'b001001; #10; // 9 % 6 = 3
    if (mod_o !== 3'b011) $display("FAIL: Expected 011 for input 9, got %b", mod_o);

    qp_i = 6'b001010; #10; // 10 % 6 = 4
    if (mod_o !== 3'b100) $display("FAIL: Expected 100 for input 10, got %b", mod_o);

    qp_i = 6'b001011; #10; // 11 % 6 = 5
    if (mod_o !== 3'b101) $display("FAIL: Expected 101 for input 11, got %b", mod_o);

    qp_i = 6'b001100; #10; // 12 % 6 = 0
    if (mod_o !== 3'b000) $display("FAIL: Expected 000 for input 12, got %b", mod_o);

    // Additional checks for higher values
    qp_i = 6'b011111; #10; // 63 % 6 = 3
    if (mod_o !== 3'b011) $display("FAIL: Expected 011 for input 63, got %b", mod_o);

    qp_i = 6'b111111; #10; // 63 % 6 = 3
    if (mod_o !== 3'b011) $display("FAIL: Expected 011 for input 63, got %b", mod_o);

    $display("PASS");
    $finish;
  end
endmodule