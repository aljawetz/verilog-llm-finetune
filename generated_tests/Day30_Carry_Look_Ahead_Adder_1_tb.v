`timescale 1ns/1ps

module tb_Day30_Carry_Look_Ahead_Adder;

  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  // Instantiate the Unit Under Test (UUT)
  Day30_Carry_Look_Ahead_Adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0
    A = 4'b0000; B = 4'b0000; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0
    A = 4'b0001; B = 4'b0001; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0010 || Cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 1 + 1 + 1
    A = 4'b0001; B = 4'b0001; Cin = 1'b1;
    #10;
    if (Sum !== 4'b0011 || Cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 3 + 3 + 1
    A = 4'b0011; B = 4'b0011; Cin = 1'b1;
    #10;
    if (Sum !== 4'b0111 || Cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 7 + 8 + 0
    A = 4'b0111; B = 4'b1000; Cin = 1'b0;
    #10;
    if (Sum !== 4'b1111 || Cout !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 15 + 1 + 0
    A = 4'b1111; B = 4'b0001; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 5 + 10 + 1
    A = 4'b0101; B = 4'b1010; Cin = 1'b1;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule