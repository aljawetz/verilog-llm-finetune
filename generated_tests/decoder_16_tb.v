`timescale 1ns/1ps

module tb_decoder;

  // Inputs
  reg [1:0] A;
  reg E;

  // Outputs
  wire Y_0, Y_1, Y_2, Y_3;

  // Instantiate the Unit Under Test (UUT)
  decoder uut (
    .A(A),
    .E(E),
    .Y_0(Y_0),
    .Y_1(Y_1),
    .Y_2(Y_2),
    .Y_3(Y_3)
  );

  initial begin
    // Initialize Inputs
    A = 2'b00; 
    E = 0;

    // Wait for global reset
    #10;

    // Test case 1: E = 0, all outputs should be 0
    E = 0; A = 2'b00; #10;
    if (Y_0 !== 0 || Y_1 !== 0 || Y_2 !== 0 || Y_3 !== 0) 
      $display("FAIL: Test case 1 failed when E=0");
    
    // Test case 2: E = 1, A = 00, Y_0 should be 1
    E = 1; A = 2'b00; #10;
    if (Y_0 !== 1 || Y_1 !== 0 || Y_2 !== 0 || Y_3 !== 0) 
      $display("FAIL: Test case 2 failed for A=00");

    // Test case 3: E = 1, A = 01, Y_1 should be 1
    A = 2'b01; #10;
    if (Y_0 !== 0 || Y_1 !== 1 || Y_2 !== 0 || Y_3 !== 0) 
      $display("FAIL: Test case 3 failed for A=01");

    // Test case 4: E = 1, A = 10, Y_2 should be 1
    A = 2'b10; #10;
    if (Y_0 !== 0 || Y_1 !== 0 || Y_2 !== 1 || Y_3 !== 0) 
      $display("FAIL: Test case 4 failed for A=10");

    // Test case 5: E = 1, A = 11, Y_3 should be 1
    A = 2'b11; #10;
    if (Y_0 !== 0 || Y_1 !== 0 || Y_2 !== 0 || Y_3 !== 1) 
      $display("FAIL: Test case 5 failed for A=11");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule