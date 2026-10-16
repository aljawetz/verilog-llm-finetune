`timescale 1ns/1ps

module tb_branch_decode2;

  reg [3:0] branch;
  reg morethree, fmulovf, rsge64, absign, addsub, manzero, rs32, eadd, amsb, rem_op, qmsb;
  reg [2:0] a2func;
  wire romselp_b;

  // Instantiate the module under test (uut)
  branch_decode2 uut (
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
    .romselp_b(romselp_b)
  );

  initial begin
    // Initialize inputs
    branch = 4'b0000; morethree = 0; fmulovf = 0; rsge64 = 0; absign = 0;
    addsub = 0; manzero = 0; rs32 = 0; eadd = 0; amsb = 0; rem_op = 0; qmsb = 0;
    a2func = 3'b000;

    // Test case 1: branch = 4'h0
    branch = 4'h0; #10;
    if (romselp_b !== 1'b1) $display("FAIL: Test case 1 failed, expected romselp_b = 1, got %b", romselp_b);

    // Test case 2: branch = 4'h1, morethree = 1
    morethree = 1; branch = 4'h1; #10;
    if (romselp_b !== 1'b1) $display("FAIL: Test case 2 failed, expected romselp_b = 1, got %b", romselp_b);

    // Test case 3: branch = 4'h1, morethree = 0
    morethree = 0; branch = 4'h1; #10;
    if (romselp_b !== 1'b0) $display("FAIL: Test case 3 failed, expected romselp_b = 0, got %b", romselp_b);

    // Test case 4: branch = 4'h3, fmulovf = 1
    fmulovf = 1; branch = 4'h3; #10;
    if (romselp_b !== 1'b1) $display("FAIL: Test case 4 failed, expected romselp_b = 1, got %b", romselp_b);

    // Test case 5: branch = 4'h4, rsge64 = 1
    rsge64 = 1; branch = 4'h4; #10;
    if (romselp_b !== 1'b1) $display("FAIL: Test case 5 failed, expected romselp_b = 1, got %b", romselp_b);

    // Test case 6: branch = 4'hA, rem_op = 0, a2func = 3'h6
    rem_op = 0; a2func = 3'h6; branch = 4'hA; #10;
    if (romselp_b !== 1'b1) $display("FAIL: Test case 6 failed, expected romselp_b = 1, got %b", romselp_b);

    // Test case 7: branch = 4'hA, rem_op = 0, a2func = 3'h5
    a2func = 3'h5; branch = 4'hA; #10;
    if (romselp_b !== amsb) $display("FAIL: Test case 7 failed, expected romselp_b = amsb, got %b", romselp_b);

    // Test case 8: branch = 4'hA, rem_op = 1, a2func = 3'h6
    rem_op = 1; a2func = 3'h6; branch = 4'hA; #10;
    if (romselp_b !== 1'b0) $display("FAIL: Test case 8 failed, expected romselp_b = 0, got %b", romselp_b);

    // Test case 9: branch = 4'hA, rem_op = 1, a2func = 3'h5
    a2func = 3'h5; branch = 4'hA; #10;
    if (romselp_b !== amsb) $display("FAIL: Test case 9 failed, expected romselp_b = amsb, got %b", romselp_b);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule