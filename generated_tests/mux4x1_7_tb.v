`timescale 1ns/1ps

module tb_mux4x1;

  reg i0, i1, i2, i3;
  reg [1:0] sel;
  wire out;

  // Instantiate the module under test
  mux4x1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Initialize inputs
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;

    // Test case 1: Select i0
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; sel = 2'b00;
    #10;
    if (out !== i0) $display("FAIL: Test case 1 failed, expected %b but got %b", i0, out);

    // Test case 2: Select i1
    i0 = 0; i1 = 1; i2 = 0; i3 = 0; sel = 2'b01;
    #10;
    if (out !== i1) $display("FAIL: Test case 2 failed, expected %b but got %b", i1, out);

    // Test case 3: Select i2
    i0 = 0; i1 = 0; i2 = 1; i3 = 0; sel = 2'b10;
    #10;
    if (out !== i2) $display("FAIL: Test case 3 failed, expected %b but got %b", i2, out);

    // Test case 4: Select i3
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; sel = 2'b11;
    #10;
    if (out !== i3) $display("FAIL: Test case 4 failed, expected %b but got %b", i3, out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule