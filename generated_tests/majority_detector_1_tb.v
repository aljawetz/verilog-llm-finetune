`timescale 1ns/1ps

module tb_majority_detector;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire detected_output;

  // Instantiate the Unit Under Test (UUT)
  majority_detector uut (
    .a(a),
    .b(b),
    .c(c),
    .detected_output(detected_output)
  );

  initial begin
    // Test case 1: 0, 0, 0 -> detected_output should be 0
    a = 0; b = 0; c = 0;
    #10;
    if (detected_output !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1, 0, 0 -> detected_output should be 0
    a = 1; b = 0; c = 0;
    #10;
    if (detected_output !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0, 1, 0 -> detected_output should be 0
    a = 0; b = 1; c = 0;
    #10;
    if (detected_output !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0, 0, 1 -> detected_output should be 0
    a = 0; b = 0; c = 1;
    #10;
    if (detected_output !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 1, 1, 0 -> detected_output should be 1
    a = 1; b = 1; c = 0;
    #10;
    if (detected_output !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 1, 0, 1 -> detected_output should be 1
    a = 1; b = 0; c = 1;
    #10;
    if (detected_output !== 1'b1) $display("FAIL: Test case 6 failed");

    // Test case 7: 0, 1, 1 -> detected_output should be 1
    a = 0; b = 1; c = 1;
    #10;
    if (detected_output !== 1'b1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1, 1, 1 -> detected_output should be 1
    a = 1; b = 1; c = 1;
    #10;
    if (detected_output !== 1'b1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule