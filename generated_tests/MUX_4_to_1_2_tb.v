`timescale 1ns/1ps

module tb_MUX_4_to_1;

  reg [3:0] a;
  reg [1:0] s;
  wire y;

  // Instantiate the MUX_4_to_1 module
  MUX_4_to_1 uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select input 0
    a = 4'b1010; // a[0] = 0, a[1] = 1, a[2] = 0, a[3] = 1
    s = 2'b00;   // Select a[0]
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

    // Test case 2: Select input 1
    s = 2'b01;   // Select a[1]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select input 2
    s = 2'b10;   // Select a[2]
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

    // Test case 4: Select input 3
    s = 2'b11;   // Select a[3]
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule