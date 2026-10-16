`timescale 1ns/1ps

module tb_decision_mux_Rounding;

  reg [15:0] IN;
  reg decision_bit;
  wire [16:0] IN_r;

  // Instantiate the module under test (uut)
  decision_mux_Rounding uut (
    .IN(IN),
    .decision_bit(decision_bit),
    .IN_r(IN_r)
  );

  initial begin
    // Test case 1: decision_bit = 1, IN = 16'h0001
    IN = 16'h0001; decision_bit = 1;
    #10;
    if (IN_r !== 17'h0002) $display("FAIL: Test case 1 failed, expected 2, got %h", IN_r);

    // Test case 2: decision_bit = 0, IN = 16'h0001
    IN = 16'h0001; decision_bit = 0;
    #10;
    if (IN_r !== 17'h0001) $display("FAIL: Test case 2 failed, expected 1, got %h", IN_r);

    // Test case 3: decision_bit = 1, IN = 16'h8000 (max positive value)
    IN = 16'h8000; decision_bit = 1;
    #10;
    if (IN_r !== 17'h10000) $display("FAIL: Test case 3 failed, expected 10000, got %h", IN_r);

    // Test case 4: decision_bit = 0, IN = 16'h8000
    IN = 16'h8000; decision_bit = 0;
    #10;
    if (IN_r !== 17'h8000) $display("FAIL: Test case 4 failed, expected 8000, got %h", IN_r);

    // Test case 5: decision_bit = 1, IN = 16'hFFFF (max value)
    IN = 16'hFFFF; decision_bit = 1;
    #10;
    if (IN_r !== 17'h1FFFF) $display("FAIL: Test case 5 failed, expected 1FFFF, got %h", IN_r);

    // Test case 6: decision_bit = 0, IN = 16'hFFFF
    IN = 16'hFFFF; decision_bit = 0;
    #10;
    if (IN_r !== 17'hFFFF) $display("FAIL: Test case 6 failed, expected FFFF, got %h", IN_r);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule