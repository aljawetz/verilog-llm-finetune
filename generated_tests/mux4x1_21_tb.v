`timescale 1ns/1ps

module tb_mux4x1;

  reg [3:0] n;
  reg [1:0] s;
  wire y;

  // Instantiate the module under test (uut)
  mux4x1 uut (
    .n(n),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select input 0
    n = 4'b1010; // Input values
    s = 2'b00;   // Selector for input 0
    #10;         // Wait for 10 time units
    if (y !== n[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", n[0], y);

    // Test case 2: Select input 1
    s = 2'b01;   // Selector for input 1
    #10;         // Wait for 10 time units
    if (y !== n[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", n[1], y);

    // Test case 3: Select input 2
    s = 2'b10;   // Selector for input 2
    #10;         // Wait for 10 time units
    if (y !== n[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", n[2], y);

    // Test case 4: Select input 3
    s = 2'b11;   // Selector for input 3
    #10;         // Wait for 10 time units
    if (y !== n[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", n[3], y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule