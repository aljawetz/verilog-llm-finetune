`timescale 1ns/1ps

module tb_Mux8by1D;

  reg [7:0] i;
  reg [2:0] s;
  wire y;

  // Instantiate the module under test (uut)
  Mux8by1D uut (
    .i(i),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select input 0
    i = 8'b00000001; // Input 0
    s = 3'b000;     // Select 0
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: Select input 1
    i = 8'b00000010; // Input 1
    s = 3'b001;     // Select 1
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select input 2
    i = 8'b00000100; // Input 2
    s = 3'b010;     // Select 2
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: Select input 3
    i = 8'b00001000; // Input 3
    s = 3'b011;     // Select 3
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: Select input 4
    i = 8'b00010000; // Input 4
    s = 3'b100;     // Select 4
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // Test case 6: Select input 5
    i = 8'b00100000; // Input 5
    s = 3'b101;     // Select 5
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: Select input 6
    i = 8'b01000000; // Input 6
    s = 3'b110;     // Select 6
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

    // Test case 8: Select input 7
    i = 8'b10000000; // Input 7
    s = 3'b111;     // Select 7
    #10;
    if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // Test case 9: All inputs low
    i = 8'b00000000; // All inputs low
    s = 3'b000;     // Select 0
    #10;
    if (y !== 1'b0) $display("FAIL: Test case 9 failed, expected y=0, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule