`timescale 1ns/1ps

module tb_FP16_TO_FP17_leading_sign_10_0;

  // Inputs
  reg [9:0] mantissa;

  // Outputs
  wire [3:0] rtn;

  // Instantiate the Unit Under Test (UUT)
  FP16_TO_FP17_leading_sign_10_0 uut (
    .mantissa(mantissa),
    .rtn(rtn)
  );

  initial begin
    // Test case 1: All zeros
    mantissa = 10'b0000000000; 
    #10;
    if (rtn !== 4'b0000) $display("FAIL: Test case 1 failed, expected rtn = 0000, got rtn = %b", rtn);

    // Test case 2: Leading one at position 0
    mantissa = 10'b0000000001; 
    #10;
    if (rtn !== 4'b0001) $display("FAIL: Test case 2 failed, expected rtn = 0001, got rtn = %b", rtn);

    // Test case 3: Leading one at position 1
    mantissa = 10'b0000000010; 
    #10;
    if (rtn !== 4'b0010) $display("FAIL: Test case 3 failed, expected rtn = 0010, got rtn = %b", rtn);

    // Test case 4: Leading one at position 2
    mantissa = 10'b0000000100; 
    #10;
    if (rtn !== 4'b0011) $display("FAIL: Test case 4 failed, expected rtn = 0011, got rtn = %b", rtn);

    // Test case 5: Leading one at position 3
    mantissa = 10'b0000001000; 
    #10;
    if (rtn !== 4'b0100) $display("FAIL: Test case 5 failed, expected rtn = 0100, got rtn = %b", rtn);

    // Test case 6: Leading one at position 4
    mantissa = 10'b0000010000; 
    #10;
    if (rtn !== 4'b0101) $display("FAIL: Test case 6 failed, expected rtn = 0101, got rtn = %b", rtn);

    // Test case 7: Leading one at position 5
    mantissa = 10'b0000100000; 
    #10;
    if (rtn !== 4'b0110) $display("FAIL: Test case 7 failed, expected rtn = 0110, got rtn = %b", rtn);

    // Test case 8: Leading one at position 6
    mantissa = 10'b0001000000; 
    #10;
    if (rtn !== 4'b0111) $display("FAIL: Test case 8 failed, expected rtn = 0111, got rtn = %b", rtn);

    // Test case 9: Leading one at position 7
    mantissa = 10'b0010000000; 
    #10;
    if (rtn !== 4'b1000) $display("FAIL: Test case 9 failed, expected rtn = 1000, got rtn = %b", rtn);

    // Test case 10: Leading one at position 8
    mantissa = 10'b0100000000; 
    #10;
    if (rtn !== 4'b1001) $display("FAIL: Test case 10 failed, expected rtn = 1001, got rtn = %b", rtn);

    // Test case 11: Leading one at position 9
    mantissa = 10'b1000000000; 
    #10;
    if (rtn !== 4'b1010) $display("FAIL: Test case 11 failed, expected rtn = 1010, got rtn = %b", rtn);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule