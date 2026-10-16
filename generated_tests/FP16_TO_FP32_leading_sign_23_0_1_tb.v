`timescale 1ns/1ps

module tb_FP16_TO_FP32_leading_sign_23_0;

  // Inputs
  reg [22:0] mantissa;

  // Outputs
  wire [4:0] rtn;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP32_leading_sign_23_0 uut (
    .mantissa(mantissa),
    .rtn(rtn)
  );

  initial begin
    // Test case 1: All bits are zero
    mantissa = 23'b00000000000000000000000; // Expected rtn = 5'b11111
    #10;
    if (rtn !== 5'b11111) $display("FAIL: Test case 1 failed, expected 5'b11111 but got %b", rtn);

    // Test case 2: Single leading one
    mantissa = 23'b00000000000000000000001; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 2 failed, expected 5'b00000 but got %b", rtn);

    // Test case 3: Leading zeros followed by ones
    mantissa = 23'b00000000000000000000010; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 3 failed, expected 5'b00000 but got %b", rtn);

    // Test case 4: Multiple leading zeros
    mantissa = 23'b00000000000000000000111; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 4 failed, expected 5'b00000 but got %b", rtn);

    // Test case 5: Mixed leading zeros and ones
    mantissa = 23'b00000000000000001111111; // Expected rtn = 5'b00001
    #10;
    if (rtn !== 5'b00001) $display("FAIL: Test case 5 failed, expected 5'b00001 but got %b", rtn);

    // Test case 6: All ones
    mantissa = 23'b11111111111111111111111; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 6 failed, expected 5'b00000 but got %b", rtn);

    // Test case 7: Leading zeros with a one in the middle
    mantissa = 23'b00000000000000010000000; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 7 failed, expected 5'b00000 but got %b", rtn);

    // Test case 8: Random pattern
    mantissa = 23'b00000000001010101010101; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 8 failed, expected 5'b00000 but got %b", rtn);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule