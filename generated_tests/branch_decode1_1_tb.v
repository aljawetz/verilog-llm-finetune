`timescale 1ns/1ps

module tb_branch_decode1;

  reg [3:0] branch;
  reg morethree, fmulovf, rsge64, absign, addsub, manzero, rs32, eadd, amsb, rem_op, qmsb;
  reg [2:0] a2func;
  wire romselp_a;

  // Instantiate the module under test
  branch_decode1 uut (
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
    .romselp_a(romselp_a)
  );

  initial begin
    // Test case 1: branch = 0
    branch = 4'h0; morethree = 1'b0; fmulovf = 1'b0; rsge64 = 1'b0; absign = 1'b0;
    addsub = 1'b0; manzero = 1'b0; rs32 = 1'b0; eadd = 1'b0; amsb = 1'b0;
    rem_op = 1'b0; qmsb = 1'b0; a2func = 3'b000;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 1 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 2: branch = 1
    branch = 4'h1; morethree = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 2 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 3: branch = 3
    branch = 4'h3; fmulovf = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 3 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 4: branch = 4
    branch = 4'h4; rsge64 = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 4 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 5: branch = 5
    branch = 4'h5; absign = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 5 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 6: branch = 6
    branch = 4'h6; addsub = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 6 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 7: branch = 7
    branch = 4'h7; manzero = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 7 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 8: branch = 8
    branch = 4'h8; rs32 = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 8 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 9: branch = 9
    branch = 4'h9; eadd = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 9 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 10: branch = A
    branch = 4'hA; rem_op = 1'b1; a2func = 3'b110; amsb = 1'b1;
    #10;
    if (romselp_a !== 1'b0) $display("FAIL: Test case 10 failed, expected romselp_a = 0, got %b", romselp_a);

    // Test case 11: branch = A
    branch = 4'hA; rem_op = 1'b0; a2func = 3'b110; amsb = 1'b1; qmsb = 1'b1;
    #10;
    if (romselp_a !== 1'b1) $display("FAIL: Test case 11 failed, expected romselp_a = 1, got %b", romselp_a);

    // Test case 12: default case
    branch = 4'hF;
    #10;
    if (romselp_a !== 1'b0) $display("FAIL: Test case 12 failed, expected romselp_a = 0, got %b", romselp_a);

    $display("PASS");
    $finish;
  end

endmodule