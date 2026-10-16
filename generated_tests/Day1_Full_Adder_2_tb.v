`timescale 1ns/1ps

module tb_Day1_Full_Adder;

  reg [3:0] A;
  reg [3:0] B;
  wire [3:0] Sum;
  wire Cout;

  // Instantiate the module under test (uut)
  Day1_Full_Adder uut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Cout(Cout)
  );

  initial begin
    // Test cases
    // Test case 1: 0 + 0
    A = 4'b0000; B = 4'b0000; #10;
    if (Sum !== 4'b0000 || Cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1
    A = 4'b0001; B = 4'b0001; #10;
    if (Sum !== 4'b0010 || Cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 2 + 3
    A = 4'b0010; B = 4'b0011; #10;
    if (Sum !== 4'b0101 || Cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 8
    A = 4'b0111; B = 4'b1000; #10;
    if (Sum !== 4'b1111 || Cout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: 15 + 1
    A = 4'b1111; B = 4'b0001; #10;
    if (Sum !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 5 + 5
    A = 4'b0101; B = 4'b0101; #10;
    if (Sum !== 4'b1010 || Cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule