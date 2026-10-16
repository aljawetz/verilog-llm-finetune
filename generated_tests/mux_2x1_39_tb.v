`timescale 1ns/1ps

module tb_mux_2x1;

  // Inputs
  reg i0;
  reg i1;
  reg s;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux_2x1 uut (
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(y)
  );

  initial begin
    // Test Case 1: s = 0, expect y = i0
    i0 = 1'b0; i1 = 1'b1; s = 1'b0;
    #10;
    if (y !== i0) begin
      $display("FAIL: Test Case 1 failed, expected y = %b, got y = %b", i0, y);
      $finish;
    end

    // Test Case 2: s = 1, expect y = i1
    i0 = 1'b0; i1 = 1'b1; s = 1'b1;
    #10;
    if (y !== i1) begin
      $display("FAIL: Test Case 2 failed, expected y = %b, got y = %b", i1, y);
      $finish;
    end

    // Test Case 3: s = 0, expect y = i0
    i0 = 1'b1; i1 = 1'b0; s = 1'b0;
    #10;
    if (y !== i0) begin
      $display("FAIL: Test Case 3 failed, expected y = %b, got y = %b", i0, y);
      $finish;
    end

    // Test Case 4: s = 1, expect y = i1
    i0 = 1'b1; i1 = 1'b0; s = 1'b1;
    #10;
    if (y !== i1) begin
      $display("FAIL: Test Case 4 failed, expected y = %b, got y = %b", i1, y);
      $finish;
    end

    // Test Case 5: s = 0, expect y = i0
    i0 = 1'b0; i1 = 1'b0; s = 1'b0;
    #10;
    if (y !== i0) begin
      $display("FAIL: Test Case 5 failed, expected y = %b, got y = %b", i0, y);
      $finish;
    end

    // Test Case 6: s = 1, expect y = i1
    i0 = 1'b0; i1 = 1'b0; s = 1'b1;
    #10;
    if (y !== i1) begin
      $display("FAIL: Test Case 6 failed, expected y = %b, got y = %b", i1, y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule