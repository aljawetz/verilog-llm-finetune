`timescale 1ns/1ps

module tb_CarryLookAheadAdder;

  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;

  // Instantiate the CarryLookAheadAdder module
  CarryLookAheadAdder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0
    A = 4'b0000; B = 4'b0000; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 + 0 = 2
    A = 4'b0001; B = 4'b0001; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0010 || Cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 3 + 3 + 0 = 6
    A = 4'b0011; B = 4'b0011; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0110 || Cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 1 + 0 = 8
    A = 4'b0111; B = 4'b0001; Cin = 1'b0;
    #10;
    if (Sum !== 4'b1000 || Cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 7 + 1 + 1 = 9
    A = 4'b0111; B = 4'b0001; Cin = 1'b1;
    #10;
    if (Sum !== 4'b1001 || Cout !== 1'b0) $display("FAIL: Test case 5 failed");

    // Test case 6: 8 + 8 + 0 = 0 (overflow)
    A = 4'b1000; B = 4'b1000; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 15 + 1 + 0 = 0 (overflow)
    A = 4'b1111; B = 4'b0001; Cin = 1'b0;
    #10;
    if (Sum !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule