`timescale 1ns/1ps

module tb_re_in_ctl;

  // Parameters
  reg i_valid;
  reg [1:0] i_transize;
  reg [1:0] tq_sel_i;
  reg [18:0] i [0:31];
  wire o_dt_vld_32;
  wire o_dt_vld_16;
  wire o_dt_vld_8;
  wire o_dt_vld_4;
  wire o_dt_vld_dst;
  wire [16:0] o [0:15];
  wire [17:0] o1 [0:7];
  wire [18:0] o2 [0:3];

  // Instantiate the Unit Under Test (UUT)
  re_in_ctl uut (
    .i_valid(i_valid),
    .i_transize(i_transize),
    .tq_sel_i(tq_sel_i),
    .i_0(i[0]), .i_1(i[1]), .i_2(i[2]), .i_3(i[3]),
    .i_4(i[4]), .i_5(i[5]), .i_6(i[6]), .i_7(i[7]),
    .i_8(i[8]), .i_9(i[9]), .i_10(i[10]), .i_11(i[11]),
    .i_12(i[12]), .i_13(i[13]), .i_14(i[14]), .i_15(i[15]),
    .i_16(i[16]), .i_17(i[17]), .i_18(i[18]), .i_19(i[19]),
    .i_20(i[20]), .i_21(i[21]), .i_22(i[22]), .i_23(i[23]),
    .i_24(i[24]), .i_25(i[25]), .i_26(i[26]), .i_27(i[27]),
    .i_28(i[28]), .i_29(i[29]), .i_30(i[30]), .i_31(i[31]),
    .o_dt_vld_32(o_dt_vld_32),
    .o_dt_vld_16(o_dt_vld_16),
    .o_dt_vld_8(o_dt_vld_8),
    .o_dt_vld_4(o_dt_vld_4),
    .o_dt_vld_dst(o_dt_vld_dst),
    .o_0(o[0]), .o_1(o[1]), .o_2(o[2]), .o_3(o[3]),
    .o_4(o[4]), .o_5(o[5]), .o_6(o[6]), .o_7(o[7]),
    .o_8(o[8]), .o_9(o[9]), .o_10(o[10]), .o_11(o[11]),
    .o_12(o[12]), .o_13(o[13]), .o_14(o[14]), .o_15(o[15]),
    .o_16(o1[0]), .o_17(o1[1]), .o_18(o1[2]), .o_19(o1[3]),
    .o_20(o1[4]), .o_21(o1[5]), .o_22(o1[6]), .o_23(o1[7]),
    .o_24(o2[0]), .o_25(o2[1]), .o_26(o2[2]), .o_27(o2[3])
  );

  initial begin
    // Initialize inputs
    i_valid = 0;
    i_transize = 0;
    tq_sel_i = 0;
    for (integer j = 0; j < 32; j = j + 1) begin
      i[j] = j; // Sample data
    end

    // Test case 1: Test with i_transize = 0
    i_valid = 1;
    i_transize = 2'd0;
    tq_sel_i = 2'd0;
    #10;

    if (o[0] !== 0 || o[1] !== 1 || o[2] !== 2 || o[3] !== 3) begin
      $display("FAIL: Test case 1 failed for o_0 to o_3");
      $finish;
    end

    // Test case 2: Test with i_transize = 1
    i_transize = 2'd1;
    #10;

    if (o[0] !== 4 || o[1] !== 5 || o[2] !== 6 || o[3] !== 7) begin
      $display("FAIL: Test case 2 failed for o_0 to o_3");
      $finish;
    end

    // Test case 3: Test with i_transize = 2
    i_transize = 2'd2;
    #10;

    if (o[0] !== 8 || o[1] !== 9 || o[2] !== 10 || o[3] !== 11) begin
      $display("FAIL: Test case 3 failed for o_0 to o_3");
      $finish;
    end

    // Test case 4: Test with i_transize = 3
    i_transize = 2'd3;
    #10;

    if (o[0] !== 16 || o[1] !== 17 || o[2] !== 18 || o[3] !== 19) begin
      $display("FAIL: Test case 4 failed for o_0 to o_3");
      $finish;
    end

    // Check validity signals
    if (o_dt_vld_32 !== 1 || o_dt_vld_16 !== 0 || o_dt_vld_8 !== 0 || o_dt_vld_4 !== 0 || o_dt_vld_dst !== 0) begin
      $display("FAIL: Validity signals are incorrect");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule