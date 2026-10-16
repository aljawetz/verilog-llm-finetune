`timescale 1ns/1ps

module tb_n_bit_magnitude_comparator;

  reg [3:0] A;
  reg [3:0] B;
  wire L_T, G_T, E;

  // Instantiate the module under test
  n_bit_magnitude_comparator #(4) uut (
    .A(A),
    .B(B),
    .L_T(L_T),
    .G_T(G_T),
    .E(E)
  );

  initial begin
    // Test case 1: A < B
    A = 4'b0010; // 2
    B = 4'b0100; // 4
    #10;
    if (L_T !== 1'b1 || G_T !== 1'b0 || E !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: A > B
    A = 4'b0110; // 6
    B = 4'b0011; // 3
    #10;
    if (L_T !== 1'b0 || G_T !== 1'b1 || E !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: A == B
    A = 4'b0101; // 5
    B = 4'b0101; // 5
    #10;
    if (L_T !== 1'b0 || G_T !== 1'b0 || E !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: A < B (boundary case)
    A = 4'b0000; // 0
    B = 4'b0001; // 1
    #10;
    if (L_T !== 1'b1 || G_T !== 1'b0 || E !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: A > B (boundary case)
    A = 4'b1111; // 15
    B = 4'b1110; // 14
    #10;
    if (L_T !== 1'b0 || G_T !== 1'b1 || E !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: A == B (boundary case)
    A = 4'b1000; // 8
    B = 4'b1000; // 8
    #10;
    if (L_T !== 1'b0 || G_T !== 1'b0 || E !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule