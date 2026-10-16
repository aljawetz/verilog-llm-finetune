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
    s = 2'b00;   // Select input 0
    #10;
    if (y !== a[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", a[0], y);
      $finish;
    end

    // Test case 2: Select input 1
    s = 2'b01;   // Select input 1
    #10;
    if (y !== a[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", a[1], y);
      $finish;
    end

    // Test case 3: Select input 2
    s = 2'b10;   // Select input 2
    #10;
    if (y !== a[2]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", a[2], y);
      $finish;
    end

    // Test case 4: Select input 3
    s = 2'b11;   // Select input 3
    #10;
    if (y !== a[3]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", a[3], y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule