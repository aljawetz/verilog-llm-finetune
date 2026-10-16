`timescale 1ns/1ps

module tb_nor1;

  reg a_in;
  reg b_in;
  wire y_out;

  // Instantiate the module under test (uut)
  nor1 uut (
    .a_in(a_in),
    .b_in(b_in),
    .y_out(y_out)
  );

  initial begin
    // Test case 1: both inputs are 0
    a_in = 0; b_in = 0;
    #10;
    if (y_out !== 1) $display("FAIL: Test case 1 failed (0, 0) => y_out = %b", y_out);

    // Test case 2: first input is 0, second input is 1
    a_in = 0; b_in = 1;
    #10;
    if (y_out !== 0) $display("FAIL: Test case 2 failed (0, 1) => y_out = %b", y_out);

    // Test case 3: first input is 1, second input is 0
    a_in = 1; b_in = 0;
    #10;
    if (y_out !== 0) $display("FAIL: Test case 3 failed (1, 0) => y_out = %b", y_out);

    // Test case 4: both inputs are 1
    a_in = 1; b_in = 1;
    #10;
    if (y_out !== 0) $display("FAIL: Test case 4 failed (1, 1) => y_out = %b", y_out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule