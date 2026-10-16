`timescale 1ns/1ps

module tb_stage0_withoutMAC;

  reg CLK;
  reg RST;
  reg signed [7:0] i_x0, i_x1, i_x2, i_x3, i_x4, i_x5, i_x6, i_x7;
  reg signed [7:0] i_x8, i_x9, i_x10, i_x11, i_x12, i_x13, i_x14, i_x15;
  reg signed [7:0] i_x16, i_x17, i_x18, i_x19, i_x20, i_x21, i_x22, i_x23;
  reg signed [7:0] i_x24, i_x25, i_x26, i_x27, i_x28, i_x29, i_x30, i_x31;
  wire signed [8:0] o_a0, o_a1, o_a2, o_a3, o_a4, o_a5, o_a6, o_a7;
  wire signed [8:0] o_a8, o_a9, o_a10, o_a11, o_a12, o_a13, o_a14, o_a15;
  wire signed [8:0] o_a16, o_a17, o_a18, o_a19, o_a20, o_a21, o_a22, o_a23;
  wire signed [8:0] o_a24, o_a25, o_a26, o_a27, o_a28, o_a29, o_a30, o_a31;

  stage0_withoutMAC uut (
    .CLK(CLK),
    .RST(RST),
    .i_x0(i_x0), .i_x1(i_x1), .i_x2(i_x2), .i_x3(i_x3),
    .i_x4(i_x4), .i_x5(i_x5), .i_x6(i_x6), .i_x7(i_x7),
    .i_x8(i_x8), .i_x9(i_x9), .i_x10(i_x10), .i_x11(i_x11),
    .i_x12(i_x12), .i_x13(i_x13), .i_x14(i_x14), .i_x15(i_x15),
    .i_x16(i_x16), .i_x17(i_x17), .i_x18(i_x18), .i_x19(i_x19),
    .i_x20(i_x20), .i_x21(i_x21), .i_x22(i_x22), .i_x23(i_x23),
    .i_x24(i_x24), .i_x25(i_x25), .i_x26(i_x26), .i_x27(i_x27),
    .i_x28(i_x28), .i_x29(i_x29), .i_x30(i_x30), .i_x31(i_x31),
    .o_a0(o_a0), .o_a1(o_a1), .o_a2(o_a2), .o_a3(o_a3),
    .o_a4(o_a4), .o_a5(o_a5), .o_a6(o_a6), .o_a7(o_a7),
    .o_a8(o_a8), .o_a9(o_a9), .o_a10(o_a10), .o_a11(o_a11),
    .o_a12(o_a12), .o_a13(o_a13), .o_a14(o_a14), .o_a15(o_a15),
    .o_a16(o_a16), .o_a17(o_a17), .o_a18(o_a18), .o_a19(o_a19),
    .o_a20(o_a20), .o_a21(o_a21), .o_a22(o_a22), .o_a23(o_a23),
    .o_a24(o_a24), .o_a25(o_a25), .o_a26(o_a26), .o_a27(o_a27),
    .o_a28(o_a28), .o_a29(o_a29), .o_a30(o_a30), .o_a31(o_a31)
  );

  initial begin
    CLK = 0;
    RST = 1;
    #5 RST = 0;

    // Test case 1
    i_x0 = 8'd10; i_x1 = 8'd5; i_x2 = 8'd20; i_x3 = 8'd15;
    i_x4 = 8'd30; i_x5 = 8'd10; i_x6 = 8'd40; i_x7 = 8'd20;
    i_x8 = 8'd50; i_x9 = 8'd25; i_x10 = 8'd60; i_x11 = 8'd30;
    i_x12 = 8'd70; i_x13 = 8'd35; i_x14 = 8'd80; i_x15 = 8'd40;
    i_x16 = 8'd90; i_x17 = 8'd45; i_x18 = 8'd100; i_x19 = 8'd50;
    i_x20 = 8'd110; i_x21 = 8'd55; i_x22 = 8'd120; i_x23 = 8'd60;
    i_x24 = 8'd130; i_x25 = 8'd65; i_x26 = 8'd140; i_x27 = 8'd70;
    i_x28 = 8'd150; i_x29 = 8'd75; i_x30 = 8'd160; i_x31 = 8'd80;

    #10;
    
    if (o_a0 !== 8'd15 || o_a1 !== 8'd5) $display("FAIL: Test case 1, outputs o_a0 or o_a1 incorrect");
    if (o_a2 !== 8'd35 || o_a3 !== 8'd5) $display("FAIL: Test case 1, outputs o_a2 or o_a3 incorrect");
    if (o_a4 !== 8'd40 || o_a5 !== 8'd20) $display("FAIL: Test case 1, outputs o_a4 or o_a5 incorrect");
    if (o_a6 !== 8'd60 || o_a7 !== 8'd20) $display("FAIL: Test case 1, outputs o_a6 or o_a7 incorrect");
    if (o_a8 !== 8'd75 || o_a9 !== 8'd25) $display("FAIL: Test case 1, outputs o_a8 or o_a9 incorrect");
    if (o_a10 !== 8'd90 || o_a11 !== 8'd30) $display("FAIL: Test case 1, outputs o_a10 or o_a11 incorrect");
    if (o_a12 !== 8'd105 || o_a13 !== 8'd35) $display("FAIL: Test case 1, outputs o_a12 or o_a13 incorrect");
    if (o_a14 !== 8'd120 || o_a15 !== 8'd40) $display("FAIL: Test case 1, outputs o_a14 or o_a15 incorrect");
    if (o_a16 !== 8'd135 || o_a17 !== 8'd45) $display("FAIL: Test case 1, outputs o_a16 or o_a17 incorrect");
    if (o_a18 !== 8'd150 || o_a19 !== 8'd50) $display("FAIL: Test case 1, outputs o_a18 or o_a19 incorrect");
    if (o_a20 !== 8'd165 || o_a21 !== 8'd55) $display("FAIL: Test case 1, outputs o_a20 or o_a21 incorrect");
    if (o_a22 !== 8'd180 || o_a23 !== 8'd60) $display("FAIL: Test case 1, outputs o_a22 or o_a23 incorrect");
    if (o_a24 !== 8'd195 || o_a25 !== 8'd65) $display("FAIL: Test case 1, outputs o_a24 or o_a25 incorrect");
    if (o_a26 !== 8'd210 || o_a27 !== 8'd70) $display("FAIL: Test case 1, outputs o_a26 or o_a27 incorrect");
    if (o_a28 !== 8'd225 || o_a29 !== 8'd75) $display("FAIL: Test case 1, outputs o_a28 or o_a29 incorrect");
    if (o_a30 !== 8'd240 || o_a31 !== 8'd80) $display("FAIL: Test case 1, outputs o_a30 or o_a31 incorrect");

    $display("PASS");
    $finish;
  end

  always #5 CLK = ~CLK;

endmodule