`timescale 1ns/1ps

module tb_offset_shift;

reg clk;
reg rst_n;
reg i_row;
reg i_dt_vld;
reg i_inverse;
reg [1:0] i_transize;
reg [27:0] i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7;
reg [27:0] i_8, i_9, i_10, i_11, i_12, i_13, i_14, i_15;
reg [27:0] i_16, i_17, i_18, i_19, i_20, i_21, i_22, i_23;
reg [27:0] i_24, i_25, i_26, i_27, i_28, i_29, i_30, i_31;

wire o_2d_dt_vld;
wire o_t_dt_vld;
wire [15:0] o_0, o_1, o_2, o_3, o_4, o_5, o_6, o_7;
wire [15:0] o_8, o_9, o_10, o_11, o_12, o_13, o_14, o_15;
wire [15:0] o_16, o_17, o_18, o_19, o_20, o_21, o_22, o_23;
wire [15:0] o_24, o_25, o_26, o_27, o_28, o_29, o_30, o_31;

offset_shift uut (
    .clk(clk),
    .rst_n(rst_n),
    .i_row(i_row),
    .i_dt_vld(i_dt_vld),
    .i_inverse(i_inverse),
    .i_transize(i_transize),
    .i_0(i_0),
    .i_1(i_1),
    .i_2(i_2),
    .i_3(i_3),
    .i_4(i_4),
    .i_5(i_5),
    .i_6(i_6),
    .i_7(i_7),
    .i_8(i_8),
    .i_9(i_9),
    .i_10(i_10),
    .i_11(i_11),
    .i_12(i_12),
    .i_13(i_13),
    .i_14(i_14),
    .i_15(i_15),
    .i_16(i_16),
    .i_17(i_17),
    .i_18(i_18),
    .i_19(i_19),
    .i_20(i_20),
    .i_21(i_21),
    .i_22(i_22),
    .i_23(i_23),
    .i_24(i_24),
    .i_25(i_25),
    .i_26(i_26),
    .i_27(i_27),
    .i_28(i_28),
    .i_29(i_29),
    .i_30(i_30),
    .i_31(i_31),
    .o_2d_dt_vld(o_2d_dt_vld),
    .o_t_dt_vld(o_t_dt_vld),
    .o_0(o_0),
    .o_1(o_1),
    .o_2(o_2),
    .o_3(o_3),
    .o_4(o_4),
    .o_5(o_5),
    .o_6(o_6),
    .o_7(o_7),
    .o_8(o_8),
    .o_9(o_9),
    .o_10(o_10),
    .o_11(o_11),
    .o_12(o_12),
    .o_13(o_13),
    .o_14(o_14),
    .o_15(o_15),
    .o_16(o_16),
    .o_17(o_17),
    .o_18(o_18),
    .o_19(o_19),
    .o_20(o_20),
    .o_21(o_21),
    .o_22(o_22),
    .o_23(o_23),
    .o_24(o_24),
    .o_25(o_25),
    .o_26(o_26),
    .o_27(o_27),
    .o_28(o_28),
    .o_29(o_29),
    .o_30(o_30),
    .o_31(o_31)
);

initial begin
    clk = 0;
    rst_n = 0;
    i_row = 0;
    i_dt_vld = 0;
    i_inverse = 0;
    i_transize = 2'b00; // DCT_4
    i_0 = 28'h0000000;
    i_1 = 28'h0000000;
    i_2 = 28'h0000000;
    i_3 = 28'h0000000;
    i_4 = 28'h0000000;
    i_5 = 28'h0000000;
    i_6 = 28'h0000000;
    i_7 = 28'h0000000;
    i_8 = 28'h0000000;
    i_9 = 28'h0000000;
    i_10 = 28'h0000000;
    i_11 = 28'h0000000;
    i_12 = 28'h0000000;
    i_13 = 28'h0000000;
    i_14 = 28'h0000000;
    i_15 = 28'h0000000;
    i_16 = 28'h0000000;
    i_17 = 28'h0000000;
    i_18 = 28'h0000000;
    i_19 = 28'h0000000;
    i_20 = 28'h0000000;
    i_21 = 28'h0000000;
    i_22 = 28'h0000000;
    i_23 = 28'h0000000;
    i_24 = 28'h0000000;
    i_25 = 28'h0000000;
    i_26 = 28'h0000000;
    i_27 = 28'h0000000;
    i_28 = 28'h0000000;
    i_29 = 28'h0000000;
    i_30 = 28'h0000000;
    i_31 = 28'h0000000;

    #10 rst_n = 1; // Release reset
    #10 i_dt_vld = 1; // Valid data signal
    #10 i_0 = 28'h0000001; // Test input
    #10 i_1 = 28'h0000002; // Test input
    #10 i_2 = 28'h0000003; // Test input
    #10 i_3 = 28'h0000004; // Test input
    #10 i_4 = 28'h0000005; // Test input
    #10 i_5 = 28'h0000006; // Test input
    #10 i_6 = 28'h0000007; // Test input
    #10 i_7 = 28'h0000008; // Test input
    #10 i_row = 1; // Change to row mode
    #10 i_transize = 2'b01; // Change to DCT_8
    #10 i_inverse = 1; // Change to inverse mode
    #10;

    // Check outputs
    if (o_0 !== 16'h0001) $display("FAIL: o_0 expected 0x0001, got %h", o_0);
    if (o_1 !== 16'h0002) $display("FAIL: o_1 expected 0x0002, got %h", o_1);
    if (o_2 !== 16'h0003) $display("FAIL: o_2 expected 0x0003, got %h", o_2);
    if (o_3 !== 16'h0004) $display("FAIL: o_3 expected 0x0004, got %h", o_3);
    if (o_4 !== 16'h0005) $display("FAIL: o_4 expected 0x0005, got %h", o_4);
    if (o_5 !== 16'h0006) $display("FAIL: o_5 expected 0x0006, got %h", o_5);
    if (o_6 !== 16'h0007) $display("FAIL: o_6 expected 0x0007, got %h", o_6);
    if (o_7 !== 16'h0008) $display("FAIL: o_7 expected 0x0008, got %h", o_7);
    
    // Check valid signals
    if (o_2d_dt_vld !== 1) $display("FAIL: o_2d_dt_vld expected 1, got %b", o_2d_dt_vld);
    if (o_t_dt_vld !== 1) $display("FAIL: o_t_dt_vld expected 1, got %b", o_t_dt_vld);

    $display("PASS");
    $finish;
end

always #5 clk = ~clk; // Clock generation

endmodule