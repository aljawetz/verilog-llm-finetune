`timescale 1ns/1ps

module tb_not1;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  not1 uut (
    .s(s),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: Input is 0, expected output is 1
    s = 0;
    #10; // Wait for 10 time units
    if (y !== 1) begin
      $display("FAIL: Test case 1 failed, expected y = 1 but got y = %b", y);
      $finish;
    end

    // Test case 2: Input is 1, expected output is 0
    s = 1;
    #10; // Wait for 10 time units
    if (y !== 0) begin
      $display("FAIL: Test case 2 failed, expected y = 0 but got y = %b", y);
      $finish;
    end

    // Test case 3: Input is toggled rapidly
    s = 0;
    #5; // Wait for 5 time units
    if (y !== 1) begin
      $display("FAIL: Test case 3 failed, expected y = 1 but got y = %b", y);
      $finish;
    end

    s = 1;
    #5; // Wait for 5 time units
    if (y !== 0) begin
      $display("FAIL: Test case 3 failed, expected y = 0 but got y = %b", y);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule