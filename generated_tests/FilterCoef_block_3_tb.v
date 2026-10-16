`timescale 1ns/1ps

module tb_FilterCoef_block;

  // Outputs
  wire signed [18:0] CoefOutS_0;
  wire signed [18:0] CoefOutS_1;
  wire signed [18:0] CoefOutS_2;
  wire signed [18:0] CoefOutS_3;
  wire signed [18:0] CoefOutS_4;
  wire signed [18:0] CoefOutS_5;
  wire signed [18:0] CoefOutS_6;
  wire signed [18:0] CoefOutS_7;
  wire signed [18:0] CoefOutS_8;
  wire signed [18:0] CoefOutS_9;
  wire signed [18:0] CoefOutS_10;
  wire signed [18:0] CoefOutS_11;
  wire signed [18:0] CoefOutS_12;
  wire signed [18:0] CoefOutS_13;
  wire signed [18:0] CoefOutS_14;
  wire signed [18:0] CoefOutS_15;
  wire signed [18:0] CoefOutS_16;
  wire signed [18:0] CoefOutS_17;
  wire signed [18:0] CoefOutS_18;
  wire signed [18:0] CoefOutS_19;
  wire signed [18:0] CoefOutS_20;
  wire signed [18:0] CoefOutS_21;
  wire signed [18:0] CoefOutS_22;
  wire signed [18:0] CoefOutS_23;
  wire signed [18:0] CoefOutS_24;
  wire signed [18:0] CoefOutS_25;
  wire signed [18:0] CoefOutS_26;
  wire signed [18:0] CoefOutS_27;
  wire signed [18:0] CoefOutS_28;
  wire signed [18:0] CoefOutS_29;
  wire signed [18:0] CoefOutS_30;
  wire signed [18:0] CoefOutS_31;
  wire signed [18:0] CoefOutS_32;
  wire signed [18:0] CoefOutS_33;
  wire signed [18:0] CoefOutS_34;
  wire signed [18:0] CoefOutS_35;
  wire signed [18:0] CoefOutS_36;
  wire signed [18:0] CoefOutS_37;
  wire signed [18:0] CoefOutS_38;
  wire signed [18:0] CoefOutS_39;
  wire signed [18:0] CoefOutS_40;
  wire signed [18:0] CoefOutS_41;
  wire signed [18:0] CoefOutS_42;
  wire signed [18:0] CoefOutS_43;
  wire signed [18:0] CoefOutS_44;
  wire signed [18:0] CoefOutS_45;
  wire signed [18:0] CoefOutS_46;
  wire signed [18:0] CoefOutS_47;
  wire signed [18:0] CoefOutS_48;
  wire signed [18:0] CoefOutS_49;
  wire signed [18:0] CoefOutS_50;
  wire signed [18:0] CoefOutS_51;
  wire signed [18:0] CoefOutS_52;
  wire signed [18:0] CoefOutS_53;
  wire signed [18:0] CoefOutS_54;
  wire signed [18:0] CoefOutS_55;
  wire signed [18:0] CoefOutS_56;
  wire signed [18:0] CoefOutS_57;
  wire signed [18:0] CoefOutS_58;
  wire signed [18:0] CoefOutS_59;
  wire signed [18:0] CoefOutS_60;
  wire signed [18:0] CoefOutS_61;
  wire signed [18:0] CoefOutS_62;
  wire signed [18:0] CoefOutS_63;

  // Instantiate the Unit Under Test (UUT)
  FilterCoef_block uut (
    .CoefOutS_0(CoefOutS_0),
    .CoefOutS_1(CoefOutS_1),
    .CoefOutS_2(CoefOutS_2),
    .CoefOutS_3(CoefOutS_3),
    .CoefOutS_4(CoefOutS_4),
    .CoefOutS_5(CoefOutS_5),
    .CoefOutS_6(CoefOutS_6),
    .CoefOutS_7(CoefOutS_7),
    .CoefOutS_8(CoefOutS_8),
    .CoefOutS_9(CoefOutS_9),
    .CoefOutS_10(CoefOutS_10),
    .CoefOutS_11(CoefOutS_11),
    .CoefOutS_12(CoefOutS_12),
    .CoefOutS_13(CoefOutS_13),
    .CoefOutS_14(CoefOutS_14),
    .CoefOutS_15(CoefOutS_15),
    .CoefOutS_16(CoefOutS_16),
    .CoefOutS_17(CoefOutS_17),
    .CoefOutS_18(CoefOutS_18),
    .CoefOutS_19(CoefOutS_19),
    .CoefOutS_20(CoefOutS_20),
    .CoefOutS_21(CoefOutS_21),
    .CoefOutS_22(CoefOutS_22),
    .CoefOutS_23(CoefOutS_23),
    .CoefOutS_24(CoefOutS_24),
    .CoefOutS_25(CoefOutS_25),
    .CoefOutS_26(CoefOutS_26),
    .CoefOutS_27(CoefOutS_27),
    .CoefOutS_28(CoefOutS_28),
    .CoefOutS_29(CoefOutS_29),
    .CoefOutS_30(CoefOutS_30),
    .CoefOutS_31(CoefOutS_31),
    .CoefOutS_32(CoefOutS_32),
    .CoefOutS_33(CoefOutS_33),
    .CoefOutS_34(CoefOutS_34),
    .CoefOutS_35(CoefOutS_35),
    .CoefOutS_36(CoefOutS_36),
    .CoefOutS_37(CoefOutS_37),
    .CoefOutS_38(CoefOutS_38),
    .CoefOutS_39(CoefOutS_39),
    .CoefOutS_40(CoefOutS_40),
    .CoefOutS_41(CoefOutS_41),
    .CoefOutS_42(CoefOutS_42),
    .CoefOutS_43(CoefOutS_43),
    .CoefOutS_44(CoefOutS_44),
    .CoefOutS_45(CoefOutS_45),
    .CoefOutS_46(CoefOutS_46),
    .CoefOutS_47(CoefOutS_47),
    .CoefOutS_48(CoefOutS_48),
    .CoefOutS_49(CoefOutS_49),
    .CoefOutS_50(CoefOutS_50),
    .CoefOutS_51(CoefOutS_51),
    .CoefOutS_52(CoefOutS_52),
    .CoefOutS_53(CoefOutS_53),
    .CoefOutS_54(CoefOutS_54),
    .CoefOutS_55(CoefOutS_55),
    .CoefOutS_56(CoefOutS_56),
    .CoefOutS_57(CoefOutS_57),
    .CoefOutS_58(CoefOutS_58),
    .CoefOutS_59(CoefOutS_59),
    .CoefOutS_60(CoefOutS_60),
    .CoefOutS_61(CoefOutS_61),
    .CoefOutS_62(CoefOutS_62),
    .CoefOutS_63(CoefOutS_63)
  );

  initial begin
    // Wait for a while to allow the module to stabilize
    #10;

    // Check coefficients
    if (CoefOutS_0 !== 19'sb1010111100011110010) begin
      $display("FAIL: CoefOutS_0 mismatch");
      $finish;
    end
    if (CoefOutS_1 !== 19'sb1011110110100110011) begin
      $display("FAIL: CoefOutS_1 mismatch");
      $finish;
    end
    if (CoefOutS_2 !== 19'sb0011110111101011010) begin
      $display("FAIL: CoefOutS_2 mismatch");
      $finish;
    end
    if (CoefOutS_3 !== 19'sb1100000010000010111) begin
      $display("FAIL: CoefOutS_3 mismatch");
      $finish;
    end
    if (CoefOutS_4 !== 19'sb0100100110011110100) begin
      $display("FAIL: CoefOutS_4 mismatch");
      $finish;
    end
    if (CoefOutS_5 !== 19'sb1010100001001011110) begin
      $display("FAIL: CoefOutS_5 mismatch");
      $finish;
    end
    if (CoefOutS_6 !== 19'sb0001001110000111101) begin
      $display("FAIL: CoefOutS_6 mismatch");
      $finish;
    end
    if (CoefOutS_7 !== 19'sb0010110111110010110) begin
      $display("FAIL: CoefOutS_7 mismatch");
      $finish;
    end
    if (CoefOutS_8 !== 19'sb1100000010101001010) begin
      $display("FAIL: CoefOutS_8 mismatch");
      $finish;
    end
    if (CoefOutS_9 !== 19'sb0101101001110010000) begin
      $display("FAIL: CoefOutS_9 mismatch");
      $finish;
    end
    if (CoefOutS_10 !== 19'sb0101011111111110011) begin
      $display("FAIL: CoefOutS_10 mismatch");
      $finish;
    end
    if (CoefOutS_11 !== 19'sb1010011100011010101) begin
      $display("FAIL: CoefOutS_11 mismatch");
      $finish;
    end
    if (CoefOutS_12 !== 19'sb1010101011001000110) begin
      $display("FAIL: CoefOutS_12 mismatch");
      $finish;
    end
    if (CoefOutS_13 !== 19'sb0011010010111010010) begin
      $display("FAIL: CoefOutS_13 mismatch");
      $finish;
    end
    if (CoefOutS_14 !== 19'sb1100000111101001100) begin
      $display("FAIL: CoefOutS_14 mismatch");
      $finish;
    end
    if (CoefOutS_15 !== 19'sb1011000111101001010) begin
      $display("FAIL: CoefOutS_15 mismatch");
      $finish;
    end
    if (CoefOutS_16 !== 19'sb1010011001001101000) begin
      $display("FAIL: CoefOutS_16 mismatch");
      $finish;
    end
    if (CoefOutS_17 !== 19'sb1101100100101001011) begin
      $display("FAIL: CoefOutS_17 mismatch");
      $finish;
    end
    if (CoefOutS_18 !== 19'sb1100010000111110111) begin
      $display("FAIL: CoefOutS_18 mismatch");
      $finish;
    end
    if (CoefOutS_19 !== 19'sb0101001111000001100) begin
      $display("FAIL: CoefOutS_19 mismatch");
      $finish;
    end
    if (CoefOutS_20 !== 19'sb1101010001111111000) begin
      $display("FAIL: CoefOutS_20 mismatch");
      $finish;
    end
    if (CoefOutS_21 !== 19'sb1100011010001000101) begin
      $display("FAIL: CoefOutS_21 mismatch");
      $finish;
    end
    if (CoefOutS_22 !== 19'sb1111110001000101100) begin
      $display("FAIL: CoefOutS_22 mismatch");
      $finish;
    end
    if (CoefOutS_23 !== 19'sb1101110010110110000) begin
      $display("FAIL: CoefOutS_23 mismatch");
      $finish;
    end
    if (CoefOutS_24 !== 19'sb0100110001000000001) begin
      $display("FAIL: CoefOutS_24 mismatch");
      $finish;
    end
    if (CoefOutS_25 !== 19'sb0010100100110011111) begin
      $display("FAIL: CoefOutS_25 mismatch");
      $finish;
    end
    if (CoefOutS_26 !== 19'sb0010000000110100110) begin
      $display("FAIL: CoefOutS_26 mismatch");
      $finish;
    end
    if (CoefOutS_27 !== 19'sb1010111000010000001) begin
      $display("FAIL: CoefOutS_27 mismatch");
      $finish;
    end
    if (CoefOutS_28 !== 19'sb1110001100110010110) begin
      $display("FAIL: CoefOutS_28 mismatch");
      $finish;
    end
    if (CoefOutS_29 !== 19'sb0101100100100000010) begin
      $display("FAIL: CoefOutS_29 mismatch");
      $finish;
    end
    if (CoefOutS_30 !== 19'sb0100111110100010000) begin
      $display("FAIL: CoefOutS_30 mismatch");
      $finish;
    end
    if (CoefOutS_31 !== 19'sb0011010001001111110) begin
      $display("FAIL: CoefOutS_31 mismatch");
      $finish;
    end
    if (CoefOutS_32 !== 19'sb0100101101110000100) begin
      $display("FAIL: CoefOutS_32 mismatch");
      $finish;
    end
    if (CoefOutS_33 !== 19'sb1011000011111001011) begin
      $display("FAIL: CoefOutS_33 mismatch");
      $finish;
    end
    if (CoefOutS_34 !== 19'sb0101011010111001101) begin
      $display("FAIL: CoefOutS_34 mismatch");
      $finish;
    end
    if (CoefOutS_35 !== 19'sb1010011100100101000) begin
      $display("FAIL: CoefOutS_35 mismatch");
      $finish;
    end
    if (CoefOutS_36 !== 19'sb1111011000111000111) begin
      $display("FAIL: CoefOutS_36 mismatch");
      $finish;
    end
    if (CoefOutS_37 !== 19'sb1011110101001100100) begin
      $display("FAIL: CoefOutS_37 mismatch");
      $finish;
    end
    if (CoefOutS_38 !== 19'sb1100001100101111111) begin
      $display("FAIL: CoefOutS_38 mismatch");
      $finish;
    end
    if (CoefOutS_39 !== 19'sb1010101010011001110) begin
      $display("FAIL: CoefOutS_39 mismatch");
      $finish;
    end
    if (CoefOutS_40 !== 19'sb0010000011001001001) begin
      $display("FAIL: CoefOutS_40 mismatch");
      $finish;
    end
    if (CoefOutS_41 !== 19'sb1111000101011010010) begin
      $display("FAIL: CoefOutS_41 mismatch");
      $finish;
    end
    if (CoefOutS_42 !== 19'sb0100110010100010110) begin
      $display("FAIL: CoefOutS_42 mismatch");
      $finish;
    end
    if (CoefOutS_43 !== 19'sb1010011100101100011) begin
      $display("FAIL: CoefOutS_43 mismatch");
      $finish;
    end
    if (CoefOutS_44 !== 19'sb0010110111010011001) begin
      $display("FAIL: CoefOutS_44 mismatch");
      $finish;
    end
    if (CoefOutS_45 !== 19'sb1101001100000011000) begin
      $display("FAIL: CoefOutS_45 mismatch");
      $finish;
    end
    if (CoefOutS_46 !== 19'sb0001011011101001111) begin
      $display("FAIL: CoefOutS_46 mismatch");
      $finish;
    end
    if (CoefOutS_47 !== 19'sb1110010111001001110) begin
      $display("FAIL: CoefOutS_47 mismatch");
      $finish;
    end
    if (CoefOutS_48 !== 19'sb0101101000000000010) begin
      $display("FAIL: CoefOutS_48 mismatch");
      $finish;
    end
    if (CoefOutS_49 !== 19'sb1101011100001101010) begin
      $display("FAIL: CoefOutS_49 mismatch");
      $finish;
    end
    if (CoefOutS_50 !== 19'sb1100011000100100100) begin
      $display("FAIL: CoefOutS_50 mismatch");
      $finish;
    end
    if (CoefOutS_51 !== 19'sb0010110010101101111) begin
      $display("FAIL: CoefOutS_51 mismatch");
      $finish;
    end
    if (CoefOutS_52 !== 19'sb0011001100100111000) begin
      $display("FAIL: CoefOutS_52 mismatch");
      $finish;
    end
    if (CoefOutS_53 !== 19'sb0101100010011101110) begin
      $display("FAIL: CoefOutS_53 mismatch");
      $finish;
    end
    if (CoefOutS_54 !== 19'sb0011000001110001101) begin
      $display("FAIL: CoefOutS_54 mismatch");
      $finish;
    end
    if (CoefOutS_55 !== 19'sb0010110011011000111) begin
      $display("FAIL: CoefOutS_55 mismatch");
      $finish;
    end
    if (CoefOutS_56 !== 19'sb1011000000101101000) begin
      $display("FAIL: CoefOutS_56 mismatch");
      $finish;
    end
    if (CoefOutS_57 !== 19'sb0011001110010100000) begin
      $display("FAIL: CoefOutS_57 mismatch");
      $finish;
    end
    if (CoefOutS_58 !== 19'sb0101100100101010011) begin
      $display("FAIL: CoefOutS_58 mismatch");
      $finish;
    end
    if (CoefOutS_59 !== 19'sb1010010110010110010) begin
      $display("FAIL: CoefOutS_59 mismatch");
      $finish;
    end
    if (CoefOutS_60 !== 19'sb0001010110011100111) begin
      $display("FAIL: CoefOutS_60 mismatch");
      $finish;
    end
    if (CoefOutS_61 !== 19'sb0101101010000000110) begin
      $display("FAIL: CoefOutS_61 mismatch");
      $finish;
    end
    if (CoefOutS_62 !== 19'sb0001000101100110111) begin
      $display("FAIL: CoefOutS_62 mismatch");
      $finish;
    end
    if (CoefOutS_63 !== 19'sb1101111010001001000) begin
      $display("FAIL: CoefOutS_63 mismatch");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule