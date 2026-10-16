`timescale 1ns/1ps

module tb_exple_dec;

  reg [3:0] expfunc;
  reg topsign, bele, aele, azle, bzle;
  wire le;

  // Instantiate the module under test (uut)
  exple_dec uut (
    .le(le),
    .topsign(topsign),
    .bele(bele),
    .aele(aele),
    .azle(azle),
    .bzle(bzle),
    .expfunc(expfunc)
  );

  initial begin
    // Test case 1: expfunc = 4'h2, topsign = 1
    expfunc = 4'h2; topsign = 1; bele = 0; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 0) $display("FAIL: Test case 1 failed, expected le = 0, got le = %b", le);

    // Test case 2: expfunc = 4'h2, topsign = 0
    expfunc = 4'h2; topsign = 0; bele = 0; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 2 failed, expected le = 1, got le = %b", le);

    // Test case 3: expfunc = 4'ha, aele = 1
    expfunc = 4'ha; topsign = 0; bele = 0; aele = 1; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 3 failed, expected le = 1, got le = %b", le);

    // Test case 4: expfunc = 4'hb, aele = 1, bele = 0
    expfunc = 4'hb; topsign = 0; bele = 0; aele = 1; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 4 failed, expected le = 1, got le = %b", le);

    // Test case 5: expfunc = 4'hb, aele = 0, bele = 1
    expfunc = 4'hb; topsign = 0; bele = 1; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 5 failed, expected le = 1, got le = %b", le);

    // Test case 6: expfunc = 4'hc, bele = 1
    expfunc = 4'hc; topsign = 0; bele = 1; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 6 failed, expected le = 1, got le = %b", le);

    // Test case 7: expfunc = 4'hd, all flags = 1
    expfunc = 4'hd; topsign = 0; bele = 1; aele = 1; azle = 1; bzle = 1;
    #10;
    if (le !== 1) $display("FAIL: Test case 7 failed, expected le = 1, got le = %b", le);

    // Test case 8: expfunc = 4'he, all flags = 0
    expfunc = 4'he; topsign = 0; bele = 0; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 0) $display("FAIL: Test case 8 failed, expected le = 0, got le = %b", le);

    // Test case 9: expfunc = 4'hf, topsign = 1
    expfunc = 4'hf; topsign = 1; bele = 0; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 0) $display("FAIL: Test case 9 failed, expected le = 0, got le = %b", le);

    // Test case 10: expfunc = 4'hf, topsign = 0
    expfunc = 4'hf; topsign = 0; bele = 0; aele = 0; azle = 0; bzle = 0;
    #10;
    if (le !== 1) $display("FAIL: Test case 10 failed, expected le = 1, got le = %b", le);

    $display("PASS");
    $finish;
  end

endmodule