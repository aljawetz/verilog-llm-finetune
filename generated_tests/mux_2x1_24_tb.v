`timescale 1ns/1ps

module tb_mux_2x1;

  parameter N = 4;
  reg [N-1:0] a0;
  reg [N-1:0] a1;
  reg s;
  wire [N-1:0] y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .a0(a0),
    .a1(a1),
    .s(s),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: Select a0
    a0 = 4'b0001; a1 = 4'b0010; s = 1'b0; #10;
    if (y !== a0) $display("FAIL: Test case 1 failed, expected %b, got %b", a0, y);

    // Test case 2: Select a1
    a0 = 4'b0001; a1 = 4'b0010; s = 1'b1; #10;
    if (y !== a1) $display("FAIL: Test case 2 failed, expected %b, got %b", a1, y);

    // Test case 3: Select a0 with different values
    a0 = 4'b1111; a1 = 4'b0000; s = 1'b0; #10;
    if (y !== a0) $display("FAIL: Test case 3 failed, expected %b, got %b", a0, y);

    // Test case 4: Select a1 with different values
    a0 = 4'b1111; a1 = 4'b0000; s = 1'b1; #10;
    if (y !== a1) $display("FAIL: Test case 4 failed, expected %b, got %b", a1, y);

    // Test case 5: Select a0 with zero values
    a0 = 4'b0000; a1 = 4'b0001; s = 1'b0; #10;
    if (y !== a0) $display("FAIL: Test case 5 failed, expected %b, got %b", a0, y);

    // Test case 6: Select a1 with zero values
    a0 = 4'b0000; a1 = 4'b0001; s = 1'b1; #10;
    if (y !== a1) $display("FAIL: Test case 6 failed, expected %b, got %b", a1, y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule