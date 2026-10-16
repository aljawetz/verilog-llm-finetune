`timescale 1ns/1ps

module tb_nand_nor_2;

  reg [3:0] in;
  wire out;

  // Instantiate the module under test (uut)
  nand_nor_2 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: All inputs are 0
    in = 4'b0000; #10;
    if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

    // Test case 2: One input is 1
    in = 4'b0001; #10;
    if (out !== 1'b1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

    // Test case 3: Two inputs are 1
    in = 4'b0011; #10;
    if (out !== 1'b0) $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);

    // Test case 4: Three inputs are 1
    in = 4'b0111; #10;
    if (out !== 1'b0) $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);

    // Test case 5: All inputs are 1
    in = 4'b1111; #10;
    if (out !== 1'b0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule