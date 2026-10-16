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
    // Test case 1: r = 0, expect z = b0
    b0 = 1; b1 = 0; r = 0; #10;
    if (z !== 1) begin
      $display("FAIL: Test case 1 failed, expected z = 1, got z = %b", z);
      $finish;
    end

    // Test case 2: r = 0, expect z = b0
    b0 = 0; b1 = 1; r = 0; #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z = 0, got z = %b", z);
      $finish;
    end

    // Test case 3: r = 1, expect z = b1
    b0 = 1; b1 = 0; r = 1; #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed, expected z = 0, got z = %b", z);
      $finish;
    end

    // Test case 4: r = 1, expect z = b1
    b0 = 0; b1 = 1; r = 1; #10;
    if (z !== 1) begin
      $display("FAIL: Test case 4 failed, expected z = 1, got z = %b", z);
      $finish;
    end

    // Test case 5: r = 0, b0 = 1, b1 = 1, expect z = b0
    b0 = 1; b1 = 1; r = 0; #10;
    if (z !== 1) begin
      $display("FAIL: Test case 5 failed, expected z = 1, got z = %b", z);
      $finish;
    end

    // Test case 6: r = 1, b0 = 1, b1 = 1, expect z = b1
    b0 = 1; b1 = 1; r = 1; #10;
    if (z !== 1) begin
      $display("FAIL: Test case 6 failed, expected z = 1, got z = %b", z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule