`timescale 1ns/1ps

module tb_mux_2_to_1;

  // Inputs
  reg b0;
  reg b1;
  reg r;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  mux_2_to_1 uut (
    .b0(b0),
    .b1(b1),
    .r(r),
    .z(z)
  );

  initial begin
    // Test Case 1: r = 0, expect z = b0
    b0 = 1; b1 = 0; r = 0;
    #10;
    if (z !== b0) begin
      $display("FAIL: Test Case 1 failed, expected z = %b, got z = %b", b0, z);
      $finish;
    end

    // Test Case 2: r = 0, expect z = b0
    b0 = 0; b1 = 1; r = 0;
    #10;
    if (z !== b0) begin
      $display("FAIL: Test Case 2 failed, expected z = %b, got z = %b", b0, z);
      $finish;
    end

    // Test Case 3: r = 1, expect z = b1
    b0 = 1; b1 = 0; r = 1;
    #10;
    if (z !== b1) begin
      $display("FAIL: Test Case 3 failed, expected z = %b, got z = %b", b1, z);
      $finish;
    end

    // Test Case 4: r = 1, expect z = b1
    b0 = 0; b1 = 1; r = 1;
    #10;
    if (z !== b1) begin
      $display("FAIL: Test Case 4 failed, expected z = %b, got z = %b", b1, z);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule