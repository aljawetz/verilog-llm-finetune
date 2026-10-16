`timescale 1ns/1ps

module tb_FP17_SUB_leading_sign_23_0;

  // Inputs
  reg [22:0] mantissa;

  // Outputs
  wire [4:0] rtn;

  // Instantiate the Unit Under Test (UUT)
  FP17_SUB_leading_sign_23_0 uut (
    .mantissa(mantissa),
    .rtn(rtn)
  );

  initial begin
    // Test case 1: Leading sign at the start
    mantissa = 23'b11000000000000000000000; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 1 failed, expected rtn = 5'b00000, got rtn = %b", rtn);

    // Test case 2: Leading sign after some zeros
    mantissa = 23'b00011000000000000000000; // Expected rtn = 5'b00001
    #10;
    if (rtn !== 5'b00001) $display("FAIL: Test case 2 failed, expected rtn = 5'b00001, got rtn = %b", rtn);

    // Test case 3: Leading sign further down
    mantissa = 23'b00000000110000000000000; // Expected rtn = 5'b00010
    #10;
    if (rtn !== 5'b00010) $display("FAIL: Test case 3 failed, expected rtn = 5'b00010, got rtn = %b", rtn);

    // Test case 4: All zeros
    mantissa = 23'b00000000000000000000000; // Expected rtn = 5'b11111 (indicating no significant digit)
    #10;
    if (rtn !== 5'b11111) $display("FAIL: Test case 4 failed, expected rtn = 5'b11111, got rtn = %b", rtn);

    // Test case 5: Leading sign with a negative
    mantissa = 23'b11100000000000000000000; // Expected rtn = 5'b00000
    #10;
    if (rtn !== 5'b00000) $display("FAIL: Test case 5 failed, expected rtn = 5'b00000, got rtn = %b", rtn);

    // Test case 6: Leading sign with a different pattern
    mantissa = 23'b00000000000000000000001; // Expected rtn = 5'b11111 (indicating no significant digit)
    #10;
    if (rtn !== 5'b11111) $display("FAIL: Test case 6 failed, expected rtn = 5'b11111, got rtn = %b", rtn);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule