`timescale 1ns/1ps

module tb_mux;
  reg i7, i6, i5, i4, i3, i2, i1, i0;
  reg [2:0] s;
  wire y;

  // Instantiate the module under test (uut)
  mux uut (
    .i7(i7),
    .i6(i6),
    .i5(i5),
    .i4(i4),
    .i3(i3),
    .i2(i2),
    .i1(i1),
    .i0(i0),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select i0
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; s = 3'b000;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

    // Test case 2: Select i1
    i0 = 0; i1 = 1; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; s = 3'b001;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

    // Test case 3: Select i2
    i0 = 0; i1 = 0; i2 = 1; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0; s = 3'b010;
    #10;
    if (y !== 1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

    // Test case 4: Select i3
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; i4 = 0; i5 = 0; i6 = 0; i7 = 0; s = 3'b011;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

    // Test case 5: Select i4
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 1; i5 = 0; i6 = 0; i7 = 0; s = 3'b100;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

    // Test case 6: Select i5
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 1; i6 = 0; i7 = 0; s = 3'b101;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

    // Test case 7: Select i6
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 1; i7 = 0; s = 3'b110;
    #10;
    if (y !== 1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

    // Test case 8: Select i7
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 1; s = 3'b111;
    #10;
    if (y !== 1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule