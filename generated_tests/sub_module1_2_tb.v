`timescale 1ns/1ps

module tb_sub_module1;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire y;

  // Instantiate the Unit Under Test (UUT)
  sub_module1 uut (
    .a(a), 
    .b(b), 
    .y(y)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule