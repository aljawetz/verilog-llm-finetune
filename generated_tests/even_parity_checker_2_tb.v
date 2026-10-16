`timescale 1ns/1ps

module tb_even_parity_checker;

  reg [1:0] A;
  reg P;
  wire E;

  // Instantiate the module under test (uut)
  even_parity_checker uut (
    .A(A),
    .P(P),
    .E(E)
  );

  initial begin
    // Test case 1: A = 00, P = 0
    A = 2'b00; P = 1'b0; #10;
    if (E !== 1'b0) $display("FAIL: Test case 1 failed (A=00, P=0, E=%b)", E);

    // Test case 2: A = 00, P = 1
    A = 2'b00; P = 1'b1; #10;
    if (E !== 1'b1) $display("FAIL: Test case 2 failed (A=00, P=1, E=%b)", E);

    // Test case 3: A = 01, P = 0
    A = 2'b01; P = 1'b0; #10;
    if (E !== 1'b1) $display("FAIL: Test case 3 failed (A=01, P=0, E=%b)", E);

    // Test case 4: A = 01, P = 1
    A = 2'b01; P = 1'b1; #10;
    if (E !== 1'b0) $display("FAIL: Test case 4 failed (A=01, P=1, E=%b)", E);

    // Test case 5: A = 10, P = 0
    A = 2'b10; P = 1'b0; #10;
    if (E !== 1'b1) $display("FAIL: Test case 5 failed (A=10, P=0, E=%b)", E);

    // Test case 6: A = 10, P = 1
    A = 2'b10; P = 1'b1; #10;
    if (E !== 1'b0) $display("FAIL: Test case 6 failed (A=10, P=1, E=%b)", E);

    // Test case 7: A = 11, P = 0
    A = 2'b11; P = 1'b0; #10;
    if (E !== 1'b0) $display("FAIL: Test case 7 failed (A=11, P=0, E=%b)", E);

    // Test case 8: A = 11, P = 1
    A = 2'b11; P = 1'b1; #10;
    if (E !== 1'b1) $display("FAIL: Test case 8 failed (A=11, P=1, E=%b)", E);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule