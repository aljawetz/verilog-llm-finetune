`timescale 1ns/1ps

module tb_FP17_ADD_leading_sign_23_0;

  // Inputs
  reg [22:0] mantissa;

  // Outputs
  wire [4:0] rtn;

  // Instantiate the Unit Under Test (UUT)
  FP17_ADD_leading_sign_23_0 uut (
    .mantissa(mantissa),
    .rtn(rtn)
  );

  initial begin
    // Test case 1: All zeros
    mantissa = 23'b00000000000000000000000;
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 1 failed, expected 00000, got %b", rtn);

    // Test case 2: Leading one
    mantissa = 23'b10000000000000000000000;
    #10;
    if (rtn !== 5'b10000) $display("FAIL: Test case 2 failed, expected 10000, got %b", rtn);

    // Test case 3: Leading zeros with a one at the end
    mantissa = 23'b00000000000000000000001;
    #10;
    if (rtn !== 5'b00001) $display("FAIL: Test case 3 failed, expected 00001, got %b", rtn);

    // Test case 4: Mixed leading zeros
    mantissa = 23'b00000001000000000000000;
    #10;
    if (rtn !== 5'b00010) $display("FAIL: Test case 4 failed, expected 00010, got %b", rtn);

    // Test case 5: All ones
    mantissa = 23'b11111111111111111111111;
    #10;
    if (rtn !== 5'b11111) $display("FAIL: Test case 5 failed, expected 11111, got %b", rtn);

    // Test case 6: Leading one with trailing zeros
    mantissa = 23'b10000000000000000000001;
    #10;
    if (rtn !== 5'b10000) $display("FAIL: Test case 6 failed, expected 10000, got %b", rtn);

    // Test case 7: Leading zeros with a one in the middle
    mantissa = 23'b00000000000000010000000;
    #10;
    if (rtn !== 5'b00010) $display("FAIL: Test case 7 failed, expected 00010, got %b", rtn);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule