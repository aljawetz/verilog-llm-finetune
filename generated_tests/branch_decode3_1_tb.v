`timescale 1ns/1ps

module tb_branch_decode3;

  // Inputs
  reg [3:0] branch;
  reg morethree;
  reg fmulovf;
  reg rsge64;
  reg absign;
  reg addsub;
  reg manzero;
  reg rs32;
  reg eadd;
  reg amsb;
  reg rem_op;
  reg qmsb;
  reg [2:0] a2func;

  // Outputs
  wire romselp_c;

  // Instantiate the Unit Under Test (UUT)
  branch_decode3 uut (
    .branch(branch),
    .morethree(morethree),
    .fmulovf(fmulovf),
    .rsge64(rsge64),
    .absign(absign),
    .addsub(addsub),
    .manzero(manzero),
    .rs32(rs32),
    .eadd(eadd),
    .amsb(amsb),
    .rem_op(rem_op),
    .qmsb(qmsb),
    .a2func(a2func),
    .romselp_c(romselp_c)
  );

  initial begin
    // Initialize Inputs
    branch = 4'b0000; morethree = 0; fmulovf = 0; rsge64 = 0; absign = 0;
    addsub = 0; manzero = 0; rs32 = 0; eadd = 0; amsb = 0; rem_op = 0; qmsb = 0;
    a2func = 3'b000;

    // Test cases
    #10; // Wait for some time

    // Test case 1: branch = 4'h0
    branch = 4'h0;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 1 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 2: branch = 4'h1, morethree = 1
    morethree = 1;
    branch = 4'h1;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 2 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 3: branch = 4'h3, fmulovf = 1
    fmulovf = 1;
    branch = 4'h3;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 3 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 4: branch = 4'h4, rsge64 = 1
    rsge64 = 1;
    branch = 4'h4;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 4 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 5: branch = 4'h5, absign = 1
    absign = 1;
    branch = 4'h5;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 5 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 6: branch = 4'h6, addsub = 1
    addsub = 1;
    branch = 4'h6;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 6 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 7: branch = 4'h7, manzero = 1
    manzero = 1;
    branch = 4'h7;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 7 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 8: branch = 4'h8, rs32 = 1
    rs32 = 1;
    branch = 4'h8;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 8 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 9: branch = 4'h9, eadd = 1
    eadd = 1;
    branch = 4'h9;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 9 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 10: branch = 4'ha, rem_op = 1, a2func = 3'h6
    rem_op = 1; a2func = 3'h6;
    branch = 4'ha;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 10 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 11: branch = 4'ha, rem_op = 1, a2func = 3'h0
    a2func = 3'h0;
    #10;
    if (romselp_c !== 1'b0) $display("FAIL: Test case 11 failed, expected romselp_c = 0, got %b", romselp_c);

    // Test case 12: branch = 4'ha, rem_op = 0, a2func = 3'h6
    rem_op = 0; a2func = 3'h6; qmsb = 1;
    #10;
    if (romselp_c !== 1'b1) $display("FAIL: Test case 12 failed, expected romselp_c = 1, got %b", romselp_c);

    // Test case 13: branch = 4'ha, rem_op = 0, a2func = 3'h0
    a2func = 3'h0; qmsb = 0;
    #10;
    if (romselp_c !== 1'b0) $display("FAIL: Test case 13 failed, expected romselp_c = 0, got %b", romselp_c);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule