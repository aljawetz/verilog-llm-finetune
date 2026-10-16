`timescale 1ns/1ps

module tb_Transpose;

  reg [3:0] m1;
  wire [3:0] m2;

  // Instantiate the module under test (uut)
  Transpose uut (
    .m1(m1),
    .m2(m2)
  );

  initial begin
    // Test case 1: Check if m1 = 4'b0000 results in m2 = 4'b0000
    m1 = 4'b0000;
    #10;
    if (m2 !== 4'b0000) begin
      $display("FAIL: Test case 1 failed. Expected m2 = 4'b0000, got m2 = %b", m2);
      $finish;
    end

    // Test case 2: Check if m1 = 4'b1111 results in m2 = 4'b1111
    m1 = 4'b1111;
    #10;
    if (m2 !== 4'b1111) begin
      $display("FAIL: Test case 2 failed. Expected m2 = 4'b1111, got m2 = %b", m2);
      $finish;
    end

    // Test case 3: Check if m1 = 4'b1010 results in m2 = 4'b1010
    m1 = 4'b1010;
    #10;
    if (m2 !== 4'b1010) begin
      $display("FAIL: Test case 3 failed. Expected m2 = 4'b1010, got m2 = %b", m2);
      $finish;
    end

    // Test case 4: Check if m1 = 4'b0101 results in m2 = 4'b0101
    m1 = 4'b0101;
    #10;
    if (m2 !== 4'b0101) begin
      $display("FAIL: Test case 4 failed. Expected m2 = 4'b0101, got m2 = %b", m2);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule