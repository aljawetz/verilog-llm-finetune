`timescale 1ns/1ps

module tb_parity_logic;
  reg [3:0] A;
  wire P;

  // Instantiate the module under test (uut)
  parity_logic uut (
    .A(A),
    .P(P)
  );

  initial begin
    // Test case 1: A = 4'b0000, expected P = 0
    A = 4'b0000;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected P = 0, got P = %b", P);
      $finish;
    end

    // Test case 2: A = 4'b0001, expected P = 1
    A = 4'b0001;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected P = 1, got P = %b", P);
      $finish;
    end

    // Test case 3: A = 4'b0010, expected P = 1
    A = 4'b0010;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected P = 1, got P = %b", P);
      $finish;
    end

    // Test case 4: A = 4'b0011, expected P = 0
    A = 4'b0011;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected P = 0, got P = %b", P);
      $finish;
    end

    // Test case 5: A = 4'b0100, expected P = 1
    A = 4'b0100;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected P = 1, got P = %b", P);
      $finish;
    end

    // Test case 6: A = 4'b1111, expected P = 0
    A = 4'b1111;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected P = 0, got P = %b", P);
      $finish;
    end

    // Test case 7: A = 4'b1101, expected P = 1
    A = 4'b1101;
    #10;
    if (P !== 1'b1) begin
      $display("FAIL: Test case 7 failed, expected P = 1, got P = %b", P);
      $finish;
    end

    // Test case 8: A = 4'b1010, expected P = 0
    A = 4'b1010;
    #10;
    if (P !== 1'b0) begin
      $display("FAIL: Test case 8 failed, expected P = 0, got P = %b", P);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule