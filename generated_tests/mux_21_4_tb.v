`timescale 1ns/1ps

module tb_mux_21;
  reg [1:0] a;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  mux_21 uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select a[0]
    a = 2'b01; // a[0] = 1, a[1] = 0
    s = 1'b0;  // Select a[0]
    #10;       // Wait for 10 time units
    if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: Select a[1]
    a = 2'b10; // a[0] = 0, a[1] = 1
    s = 1'b1;  // Select a[1]
    #10;       // Wait for 10 time units
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select a[0] again
    a = 2'b11; // a[0] = 1, a[1] = 1
    s = 1'b0;  // Select a[0]
    #10;       // Wait for 10 time units
    if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: Select a[1] again
    a = 2'b00; // a[0] = 0, a[1] = 0
    s = 1'b1;  // Select a[1]
    #10;       // Wait for 10 time units
    if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule