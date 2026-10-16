`timescale 1ns/1ps

module tb_mux_3to1;

  reg i0, i1, i2;
  reg s0, s1;
  wire out;

  // Instantiate the module under test
  mux_3to1 uut (
    .out(out),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .s0(s0),
    .s1(s1)
  );

  initial begin
    // Test case 1: Select i0
    i0 = 1'b1; i1 = 1'b0; i2 = 1'b0; s0 = 1'b0; s1 = 1'b0;
    #10;
    if (out !== i0) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", i0, out);
      $finish;
    end

    // Test case 2: Select i1
    i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; s0 = 1'b0; s1 = 1'b1;
    #10;
    if (out !== i0) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", i0, out);
      $finish;
    end

    // Test case 3: Select i1
    i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; s0 = 1'b1; s1 = 1'b0;
    #10;
    if (out !== i1) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", i1, out);
      $finish;
    end

    // Test case 4: Select i2
    i0 = 1'b0; i1 = 1'b0; i2 = 1'b1; s0 = 1'b1; s1 = 1'b1;
    #10;
    if (out !== i2) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", i2, out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule