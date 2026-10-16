`timescale 1ns/1ps

module tb_CDP_ICVT_leading_sign_10_0;

  // Inputs
  reg [9:0] mantissa;

  // Outputs
  wire [3:0] rtn;

  // Instantiate the Unit Under Test (UUT)
  CDP_ICVT_leading_sign_10_0 uut (
    .mantissa(mantissa),
    .rtn(rtn)
  );

  initial begin
    // Test case 1: All bits are zero
    mantissa = 10'b0000000000; #10;
    if (rtn !== 4'b0000) $display("FAIL: Test case 1 failed, expected rtn = 0000, got rtn = %b", rtn);

    // Test case 2: Leading one at the highest bit
    mantissa = 10'b1000000000; #10;
    if (rtn !== 4'b1000) $display("FAIL: Test case 2 failed, expected rtn = 1000, got rtn = %b", rtn);

    // Test case 3: Leading one at the second highest bit
    mantissa = 10'b0100000000; #10;
    if (rtn !== 4'b0100) $display("FAIL: Test case 3 failed, expected rtn = 0100, got rtn = %b", rtn);

    // Test case 4: Mixed bits with leading zeros
    mantissa = 10'b0011000000; #10;
    if (rtn !== 4'b0010) $display("FAIL: Test case 4 failed, expected rtn = 0010, got rtn = %b", rtn);

    // Test case 5: Non-zero bits in the middle
    mantissa = 10'b0000111100; #10;
    if (rtn !== 4'b0001) $display("FAIL: Test case 5 failed, expected rtn = 0001, got rtn = %b", rtn);

    // Test case 6: All bits are one
    mantissa = 10'b1111111111; #10;
    if (rtn !== 4'b1000) $display("FAIL: Test case 6 failed, expected rtn = 1000, got rtn = %b", rtn);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule