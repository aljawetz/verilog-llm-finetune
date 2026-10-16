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
    // Test sequence
    // Test case 1: Check with all bits low
    m1 = 4'b0000; #10;
    if (m2 !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", m2);
      $finish;
    end

    // Test case 2: Check with all bits high
    m1 = 4'b1111; #10;
    if (m2 !== 4'b1111) begin
      $display("FAIL: Test case 2 failed, expected 1111, got %b", m2);
      $finish;
    end

    // Test case 3: Check with alternating bits
    m1 = 4'b1010; #10;
    if (m2 !== 4'b1010) begin
      $display("FAIL: Test case 3 failed, expected 1010, got %b", m2);
      $finish;
    end

    // Test case 4: Check with another pattern
    m1 = 4'b0101; #10;
    if (m2 !== 4'b0101) begin
      $display("FAIL: Test case 4 failed, expected 0101, got %b", m2);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule