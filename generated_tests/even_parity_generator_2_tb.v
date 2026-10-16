`timescale 1ns/1ps

module tb_even_parity_generator;

  reg [1:0] A;
  wire P;

  // Instantiate the module under test (uut)
  even_parity_generator uut (
    .A(A),
    .P(P)
  );

  initial begin
    // Test case 1: A = 2'b00, expected P = 1'b0
    A = 2'b00;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 1 failed, A = %b, got P = %b", A, P);
      $finish;
    end

    // Test case 2: A = 2'b01, expected P = 1'b1
    A = 2'b01;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 2 failed, A = %b, got P = %b", A, P);
      $finish;
    end

    // Test case 3: A = 2'b10, expected P = 1'b1
    A = 2'b10;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 3 failed, A = %b, got P = %b", A, P);
      $finish;
    end

    // Test case 4: A = 2'b11, expected P = 1'b0
    A = 2'b11;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 4 failed, A = %b, got P = %b", A, P);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule