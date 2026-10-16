`timescale 1ns/1ps

module tb_mux8_1_df;

  // Inputs
  reg i0, i1, i2, i3, i4, i5, i6, i7;
  reg s2, s1, s0;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux8_1_df uut (
    .i0(i0), 
    .i1(i1), 
    .i2(i2), 
    .i3(i3), 
    .i4(i4), 
    .i5(i5), 
    .i6(i6), 
    .i7(i7), 
    .s2(s2), 
    .s1(s1), 
    .s0(s0), 
    .y(y)
  );

  initial begin
    // Initialize inputs
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;
    s2 = 0; s1 = 0; s0 = 0;

    // Test case 1: Select i0
    i0 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 000, got y=%b", y);

    // Test case 2: Select i1
    i0 = 0; i1 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 001, got y=%b", y);

    // Test case 3: Select i2
    i1 = 0; i2 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 010, got y=%b", y);

    // Test case 4: Select i3
    i2 = 0; i3 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 011, got y=%b", y);

    // Test case 5: Select i4
    i3 = 0; i4 = 1; s2 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 100, got y=%b", y);

    // Test case 6: Select i5
    i4 = 0; i5 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 101, got y=%b", y);

    // Test case 7: Select i6
    i5 = 0; i6 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 110, got y=%b", y);

    // Test case 8: Select i7
    i6 = 0; i7 = 1; #10;
    if (y !== 1) $display("FAIL: Expected y=1 for select 111, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule