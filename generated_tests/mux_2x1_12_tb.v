`timescale 1ns/1ps

module tb_mux_2x1;

  // Inputs
  reg x;
  reg y;
  reg s;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  mux_2x1 uut (
    .x(x),
    .y(y),
    .s(s),
    .z(z)
  );

  initial begin
    // Test case 1: s = 0, expect z = x
    x = 1'b0; y = 1'b1; s = 1'b0; #10;
    if (z !== x) begin
      $display("FAIL: Test case 1 failed, expected z = %b, got z = %b", x, z);
      $finish;
    end

    // Test case 2: s = 1, expect z = y
    x = 1'b0; y = 1'b1; s = 1'b1; #10;
    if (z !== y) begin
      $display("FAIL: Test case 2 failed, expected z = %b, got z = %b", y, z);
      $finish;
    end

    // Test case 3: s = 0, expect z = x
    x = 1'b1; y = 1'b0; s = 1'b0; #10;
    if (z !== x) begin
      $display("FAIL: Test case 3 failed, expected z = %b, got z = %b", x, z);
      $finish;
    end

    // Test case 4: s = 1, expect z = y
    x = 1'b1; y = 1'b0; s = 1'b1; #10;
    if (z !== y) begin
      $display("FAIL: Test case 4 failed, expected z = %b, got z = %b", y, z);
      $finish;
    end

    // Test case 5: s = 0, expect z = x
    x = 1'b0; y = 1'b0; s = 1'b0; #10;
    if (z !== x) begin
      $display("FAIL: Test case 5 failed, expected z = %b, got z = %b", x, z);
      $finish;
    end

    // Test case 6: s = 1, expect z = y
    x = 1'b0; y = 1'b0; s = 1'b1; #10;
    if (z !== y) begin
      $display("FAIL: Test case 6 failed, expected z = %b, got z = %b", y, z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule