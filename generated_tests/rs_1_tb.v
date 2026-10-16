`timescale 1ns/1ps

module tb_rs;
  reg a_in, b_in, c_in, d_in, e_in, f_in, s1_in, s2_in;
  wire c1_out, c2_out, y_out, z_out;

  // Instantiate the module under test (uut)
  rs uut (
    .a_in(a_in),
    .b_in(b_in),
    .c_in(c_in),
    .d_in(d_in),
    .e_in(e_in),
    .f_in(f_in),
    .s1_in(s1_in),
    .s2_in(s2_in),
    .c1_out(c1_out),
    .c2_out(c2_out),
    .y_out(y_out),
    .z_out(z_out)
  );

  initial begin
    // Test case 1
    a_in = 1; b_in = 1; c_in = 0; d_in = 0; e_in = 1; f_in = 0; s1_in = 1; s2_in = 0;
    #10;
    if (c1_out !== 0 || y_out !== 0) $display("FAIL: Test case 1 failed");
    if (c2_out !== 0 || z_out !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2
    a_in = 1; b_in = 0; c_in = 1; d_in = 1; e_in = 0; f_in = 1; s1_in = 0; s2_in = 1;
    #10;
    if (c1_out !== 0 || y_out !== 1) $display("FAIL: Test case 2 failed");
    if (c2_out !== 0 || z_out !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3
    a_in = 1; b_in = 1; c_in = 1; d_in = 1; e_in = 1; f_in = 1; s1_in = 1; s2_in = 1;
    #10;
    if (c1_out !== 1 || y_out !== 0) $display("FAIL: Test case 3 failed");
    if (c2_out !== 1 || z_out !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4
    a_in = 0; b_in = 0; c_in = 0; d_in = 0; e_in = 0; f_in = 0; s1_in = 0; s2_in = 0;
    #10;
    if (c1_out !== 0 || y_out !== 0) $display("FAIL: Test case 4 failed");
    if (c2_out !== 0 || z_out !== 0) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule