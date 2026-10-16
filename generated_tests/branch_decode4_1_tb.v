`timescale 1ns/1ps

module tb_branch_decode4;

  reg [3:0] branch;
  reg morethree, fmulovf, rsge64, absign, addsub, manzero, rs32, eadd, amsb, rem_op, qmsb;
  reg [2:0] a2func;
  wire romselp_d;

  branch_decode4 uut (
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
    .romselp_d(romselp_d)
  );

  initial begin
    // Test case 1: branch = 4'h0, expect romselp_d = 1
    branch = 4'h0; morethree = 0; fmulovf = 0; rsge64 = 0; absign = 0; addsub = 0; manzero = 0; rs32 = 0; eadd = 0; amsb = 0; rem_op = 0; qmsb = 0; a2func = 3'b000;
    #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 1 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 2: branch = 4'h1, morethree = 1, expect romselp_d = 1
    branch = 4'h1; morethree = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 2 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 3: branch = 4'h3, fmulovf = 1, expect romselp_d = 1
    branch = 4'h3; fmulovf = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 3 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 4: branch = 4'h4, rsge64 = 1, expect romselp_d = 1
    branch = 4'h4; rsge64 = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 4 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 5: branch = 4'h5, absign = 1, expect romselp_d = 1
    branch = 4'h5; absign = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 5 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 6: branch = 4'h6, addsub = 1, expect romselp_d = 1
    branch = 4'h6; addsub = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 6 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 7: branch = 4'h7, manzero = 1, expect romselp_d = 1
    branch = 4'h7; manzero = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 7 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 8: branch = 4'h8, rs32 = 1, expect romselp_d = 1
    branch = 4'h8; rs32 = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 8 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 9: branch = 4'h9, eadd = 1, expect romselp_d = 1
    branch = 4'h9; eadd = 1; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 9 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 10: branch = 4'ha, rem_op = 1, a2func = 3'b110, expect romselp_d = 1
    branch = 4'ha; rem_op = 1; a2func = 3'b110; #10;
    if (romselp_d !== 1'b1) $display("FAIL: Test case 10 failed, expected romselp_d = 1, got %b", romselp_d);

    // Test case 11: branch = 4'ha, rem_op = 0, a2func = 3'b110, expect romselp_d = qmsb (0)
    rem_op = 0; a2func = 3'b110; #10;
    if (romselp_d !== 1'b0) $display("FAIL: Test case 11 failed, expected romselp_d = 0, got %b", romselp_d);

    // Test case 12: branch = 4'ha, rem_op = 0, a2func = 3'b000, expect romselp_d = amsb (0)
    a2func = 3'b000; #10;
    if (romselp_d !== 1'b0) $display("FAIL: Test case 12 failed, expected romselp_d = 0, got %b", romselp_d);

    // Test case 13: default case, branch = 4'hf, expect romselp_d = 0
    branch = 4'hf; #10;
    if (romselp_d !== 1'b0) $display("FAIL: Test case 13 failed, expected romselp_d = 0, got %b", romselp_d);

    $display("PASS");
    $finish;
  end

endmodule