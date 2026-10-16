`timescale 1ns/1ps

module tb_majority_ckt;
  reg [4:0] x;
  wire z;

  // Instantiate the Unit Under Test (UUT)
  majority_ckt uut (
    .x(x),
    .z(z)
  );

  initial begin
    // Test case 1: Majority is 1 (3 high inputs)
    x = 5'b11100; // 1, 1, 1, 0, 0 -> z should be 1
    #10;
    if (z !== 1'b1) $display("FAIL: Test case 1 failed, expected z=1, got z=%b", z);

    // Test case 2: Majority is 1 (4 high inputs)
    x = 5'b11110; // 1, 1, 1, 1, 0 -> z should be 1
    #10;
    if (z !== 1'b1) $display("FAIL: Test case 2 failed, expected z=1, got z=%b", z);

    // Test case 3: Majority is 0 (2 high inputs)
    x = 5'b11000; // 1, 1, 0, 0, 0 -> z should be 0
    #10;
    if (z !== 1'b0) $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);

    // Test case 4: Majority is 1 (3 high inputs)
    x = 5'b10101; // 1, 0, 1, 0, 1 -> z should be 1
    #10;
    if (z !== 1'b1) $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);

    // Test case 5: Majority is 0 (2 high inputs)
    x = 5'b10010; // 1, 0, 0, 1, 0 -> z should be 0
    #10;
    if (z !== 1'b0) $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);

    // Test case 6: All inputs low
    x = 5'b00000; // 0, 0, 0, 0, 0 -> z should be 0
    #10;
    if (z !== 1'b0) $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);

    // Test case 7: All inputs high
    x = 5'b11111; // 1, 1, 1, 1, 1 -> z should be 1
    #10;
    if (z !== 1'b1) $display("FAIL: Test case 7 failed, expected z=1, got z=%b", z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule