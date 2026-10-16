`timescale 1ns/1ps

module tb_Transpose;

  // Inputs
  reg [3:0] m1;

  // Outputs
  wire [3:0] m2;

  // Instantiate the Unit Under Test (UUT)
  Transpose uut (
    .m1(m1),
    .m2(m2)
  );

  // Clock and reset generation
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    // Initialize inputs
    m1 = 4'b0000;

    // Wait for global reset
    #10;

    // Test case 1: Check if output matches input
    m1 = 4'b0000; #10;
    if (m2 !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", m2);
      $finish;
    end

    // Test case 2: Check if output matches input
    m1 = 4'b1111; #10;
    if (m2 !== 4'b1111) begin
      $display("FAIL: Test case 2 failed, expected 1111, got %b", m2);
      $finish;
    end

    // Test case 3: Check if output matches input
    m1 = 4'b1010; #10;
    if (m2 !== 4'b1010) begin
      $display("FAIL: Test case 3 failed, expected 1010, got %b", m2);
      $finish;
    end

    // Test case 4: Check if output matches input
    m1 = 4'b0101; #10;
    if (m2 !== 4'b0101) begin
      $display("FAIL: Test case 4 failed, expected 0101, got %b", m2);
      $finish;
    end

    // Test case 5: Check if output matches input
    m1 = 4'b0011; #10;
    if (m2 !== 4'b0011) begin
      $display("FAIL: Test case 5 failed, expected 0011, got %b", m2);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule