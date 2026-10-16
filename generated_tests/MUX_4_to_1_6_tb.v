`timescale 1ns/1ps

module tb_MUX_4_to_1;

  reg [3:0] a;
  reg [1:0] s;
  wire y;

  // Instantiate the module under test (uut)
  MUX_4_to_1 uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select input 0
    a = 4'b1010; // Inputs: 10, 10, 10, 10
    s = 2'b00;   // Select line for input 0
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: Select input 1
    s = 2'b01;   // Select line for input 1
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select input 2
    s = 2'b10;   // Select line for input 2
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

    // Test case 4: Select input 3
    s = 2'b11;   // Select line for input 3
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

    // Test case 5: Change inputs
    a = 4'b1111; // Inputs: 1, 1, 1, 1
    s = 2'b00;   // Select line for input 0
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // Test case 6: Select input 1
    s = 2'b01;   // Select line for input 1
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: Select input 2
    s = 2'b10;   // Select line for input 2
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

    // Test case 8: Select input 3
    s = 2'b11;   // Select line for input 3
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule