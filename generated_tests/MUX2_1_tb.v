`timescale 1ns/1ps

module tb_MUX2;

  // Inputs
  reg [0:0] A;
  reg [0:0] B;
  reg [0:0] S0;

  // Output
  wire [0:0] Y;

  // Instantiate the Unit Under Test (UUT)
  MUX2 uut (
    .A(A),
    .B(B),
    .S0(S0),
    .Y(Y)
  );

  initial begin
    // Test Case 1: Select A when S0 = 0
    A = 1'b1; B = 1'b0; S0 = 1'b0;
    #10;
    if (Y !== A) $display("FAIL: Test Case 1 failed, expected Y = %b, got Y = %b", A, Y);

    // Test Case 2: Select B when S0 = 1
    A = 1'b0; B = 1'b1; S0 = 1'b1;
    #10;
    if (Y !== B) $display("FAIL: Test Case 2 failed, expected Y = %b, got Y = %b", B, Y);

    // Test Case 3: Select A when S0 = 0
    A = 1'b0; B = 1'b1; S0 = 1'b0;
    #10;
    if (Y !== A) $display("FAIL: Test Case 3 failed, expected Y = %b, got Y = %b", A, Y);

    // Test Case 4: Select B when S0 = 1
    A = 1'b1; B = 1'b0; S0 = 1'b1;
    #10;
    if (Y !== B) $display("FAIL: Test Case 4 failed, expected Y = %b, got Y = %b", B, Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule