`timescale 1ns/1ps

module tb_dpath_ctrl;

  // Inputs
  reg sum32;
  reg rbb1;
  reg mul_cmp;
  reg div_cmp;
  reg rem_cmp;
  reg clr_ra2;
  reg sel_sum_a;

  // Outputs
  wire sel_swap;
  wire rem_sum32;
  wire extreme_1;
  wire cur_rbb1;
  wire sum_32;
  wire clr_ra;
  wire sel_sum_a_buf;

  // Instantiate the Unit Under Test (UUT)
  dpath_ctrl uut (
    .sum32(sum32),
    .rbb1(rbb1),
    .mul_cmp(mul_cmp),
    .div_cmp(div_cmp),
    .rem_cmp(rem_cmp),
    .clr_ra2(clr_ra2),
    .sel_sum_a(sel_sum_a),
    .sel_swap(sel_swap),
    .rem_sum32(rem_sum32),
    .extreme_1(extreme_1),
    .cur_rbb1(cur_rbb1),
    .sum_32(sum_32),
    .clr_ra(clr_ra),
    .sel_sum_a_buf(sel_sum_a_buf)
  );

  initial begin
    // Initialize Inputs
    sum32 = 0;
    rbb1 = 0;
    mul_cmp = 0;
    div_cmp = 0;
    rem_cmp = 0;
    clr_ra2 = 0;
    sel_sum_a = 0;

    // Wait for global reset
    #10;

    // Test case 1: Check sel_swap when sum32=0 and mul_cmp=1
    sum32 = 0; mul_cmp = 1;
    #10;
    if (sel_swap !== 1) $display("FAIL: Test case 1 failed, sel_swap expected 1, got %b", sel_swap);

    // Test case 2: Check rem_sum32 when sum32=1 and rem_cmp=1
    sum32 = 1; rem_cmp = 1;
    #10;
    if (rem_sum32 !== 1) $display("FAIL: Test case 2 failed, rem_sum32 expected 1, got %b", rem_sum32);

    // Test case 3: Check extreme_1 when sum32=0 and mul_cmp=0
    sum32 = 0; mul_cmp = 0;
    #10;
    if (extreme_1 !== 1) $display("FAIL: Test case 3 failed, extreme_1 expected 1, got %b", extreme_1);

    // Test case 4: Check cur_rbb1 output
    rbb1 = 1;
    #10;
    if (cur_rbb1 !== 1) $display("FAIL: Test case 4 failed, cur_rbb1 expected 1, got %b", cur_rbb1);

    // Test case 5: Check sum_32 output
    sum32 = 1;
    #10;
    if (sum_32 !== 1) $display("FAIL: Test case 5 failed, sum_32 expected 1, got %b", sum_32);

    // Test case 6: Check clr_ra output when sum32=0, div_cmp=1, clr_ra2=0
    sum32 = 0; div_cmp = 1; clr_ra2 = 0;
    #10;
    if (clr_ra !== 1) $display("FAIL: Test case 6 failed, clr_ra expected 1, got %b", clr_ra);

    // Test case 7: Check clr_ra output when sum32=0, div_cmp=0, clr_ra2=1
    clr_ra2 = 1;
    #10;
    if (clr_ra !== 0) $display("FAIL: Test case 7 failed, clr_ra expected 0, got %b", clr_ra);

    // Test case 8: Check sel_sum_a_buf output
    sel_sum_a = 1;
    #10;
    if (sel_sum_a_buf !== 1) $display("FAIL: Test case 8 failed, sel_sum_a_buf expected 1, got %b", sel_sum_a_buf);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule