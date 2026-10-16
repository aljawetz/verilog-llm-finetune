`timescale 1ns/1ps

module tb_FilterCoef;

  // Outputs
  wire signed [18:0] CoefOutP_0;
  wire signed [18:0] CoefOutP_1;
  wire signed [18:0] CoefOutP_2;
  wire signed [18:0] CoefOutP_3;
  wire signed [18:0] CoefOutP_4;
  wire signed [18:0] CoefOutP_5;
  wire signed [18:0] CoefOutP_6;
  wire signed [18:0] CoefOutP_7;
  wire signed [18:0] CoefOutP_8;
  wire signed [18:0] CoefOutP_9;
  wire signed [18:0] CoefOutP_10;
  wire signed [18:0] CoefOutP_11;
  wire signed [18:0] CoefOutP_12;
  wire signed [18:0] CoefOutP_13;
  wire signed [18:0] CoefOutP_14;
  wire signed [18:0] CoefOutP_15;
  wire signed [18:0] CoefOutP_16;
  wire signed [18:0] CoefOutP_17;
  wire signed [18:0] CoefOutP_18;
  wire signed [18:0] CoefOutP_19;
  wire signed [18:0] CoefOutP_20;
  wire signed [18:0] CoefOutP_21;
  wire signed [18:0] CoefOutP_22;
  wire signed [18:0] CoefOutP_23;
  wire signed [18:0] CoefOutP_24;
  wire signed [18:0] CoefOutP_25;
  wire signed [18:0] CoefOutP_26;
  wire signed [18:0] CoefOutP_27;
  wire signed [18:0] CoefOutP_28;
  wire signed [18:0] CoefOutP_29;
  wire signed [18:0] CoefOutP_30;
  wire signed [18:0] CoefOutP_31;
  wire signed [18:0] CoefOutP_32;
  wire signed [18:0] CoefOutP_33;
  wire signed [18:0] CoefOutP_34;
  wire signed [18:0] CoefOutP_35;
  wire signed [18:0] CoefOutP_36;
  wire signed [18:0] CoefOutP_37;
  wire signed [18:0] CoefOutP_38;
  wire signed [18:0] CoefOutP_39;
  wire signed [18:0] CoefOutP_40;
  wire signed [18:0] CoefOutP_41;
  wire signed [18:0] CoefOutP_42;
  wire signed [18:0] CoefOutP_43;
  wire signed [18:0] CoefOutP_44;
  wire signed [18:0] CoefOutP_45;
  wire signed [18:0] CoefOutP_46;
  wire signed [18:0] CoefOutP_47;
  wire signed [18:0] CoefOutP_48;
  wire signed [18:0] CoefOutP_49;
  wire signed [18:0] CoefOutP_50;
  wire signed [18:0] CoefOutP_51;
  wire signed [18:0] CoefOutP_52;
  wire signed [18:0] CoefOutP_53;
  wire signed [18:0] CoefOutP_54;
  wire signed [18:0] CoefOutP_55;
  wire signed [18:0] CoefOutP_56;
  wire signed [18:0] CoefOutP_57;
  wire signed [18:0] CoefOutP_58;
  wire signed [18:0] CoefOutP_59;
  wire signed [18:0] CoefOutP_60;
  wire signed [18:0] CoefOutP_61;
  wire signed [18:0] CoefOutP_62;
  wire signed [18:0] CoefOutP_63;

  // Instantiate the Unit Under Test (UUT)
  FilterCoef uut (
    .CoefOutP_0(CoefOutP_0),
    .CoefOutP_1(CoefOutP_1),
    .CoefOutP_2(CoefOutP_2),
    .CoefOutP_3(CoefOutP_3),
    .CoefOutP_4(CoefOutP_4),
    .CoefOutP_5(CoefOutP_5),
    .CoefOutP_6(CoefOutP_6),
    .CoefOutP_7(CoefOutP_7),
    .CoefOutP_8(CoefOutP_8),
    .CoefOutP_9(CoefOutP_9),
    .CoefOutP_10(CoefOutP_10),
    .CoefOutP_11(CoefOutP_11),
    .CoefOutP_12(CoefOutP_12),
    .CoefOutP_13(CoefOutP_13),
    .CoefOutP_14(CoefOutP_14),
    .CoefOutP_15(CoefOutP_15),
    .CoefOutP_16(CoefOutP_16),
    .CoefOutP_17(CoefOutP_17),
    .CoefOutP_18(CoefOutP_18),
    .CoefOutP_19(CoefOutP_19),
    .CoefOutP_20(CoefOutP_20),
    .CoefOutP_21(CoefOutP_21),
    .CoefOutP_22(CoefOutP_22),
    .CoefOutP_23(CoefOutP_23),
    .CoefOutP_24(CoefOutP_24),
    .CoefOutP_25(CoefOutP_25),
    .CoefOutP_26(CoefOutP_26),
    .CoefOutP_27(CoefOutP_27),
    .CoefOutP_28(CoefOutP_28),
    .CoefOutP_29(CoefOutP_29),
    .CoefOutP_30(CoefOutP_30),
    .CoefOutP_31(CoefOutP_31),
    .CoefOutP_32(CoefOutP_32),
    .CoefOutP_33(CoefOutP_33),
    .CoefOutP_34(CoefOutP_34),
    .CoefOutP_35(CoefOutP_35),
    .CoefOutP_36(CoefOutP_36),
    .CoefOutP_37(CoefOutP_37),
    .CoefOutP_38(CoefOutP_38),
    .CoefOutP_39(CoefOutP_39),
    .CoefOutP_40(CoefOutP_40),
    .CoefOutP_41(CoefOutP_41),
    .CoefOutP_42(CoefOutP_42),
    .CoefOutP_43(CoefOutP_43),
    .CoefOutP_44(CoefOutP_44),
    .CoefOutP_45(CoefOutP_45),
    .CoefOutP_46(CoefOutP_46),
    .CoefOutP_47(CoefOutP_47),
    .CoefOutP_48(CoefOutP_48),
    .CoefOutP_49(CoefOutP_49),
    .CoefOutP_50(CoefOutP_50),
    .CoefOutP_51(CoefOutP_51),
    .CoefOutP_52(CoefOutP_52),
    .CoefOutP_53(CoefOutP_53),
    .CoefOutP_54(CoefOutP_54),
    .CoefOutP_55(CoefOutP_55),
    .CoefOutP_56(CoefOutP_56),
    .CoefOutP_57(CoefOutP_57),
    .CoefOutP_58(CoefOutP_58),
    .CoefOutP_59(CoefOutP_59),
    .CoefOutP_60(CoefOutP_60),
    .CoefOutP_61(CoefOutP_61),
    .CoefOutP_62(CoefOutP_62),
    .CoefOutP_63(CoefOutP_63)
  );

  initial begin
    // Wait for the outputs to stabilize
    #10;

    // Check outputs
    if (CoefOutP_0 !== 19'sb0010100010011111010) begin
      $display("FAIL: CoefOutP_0 mismatch");
      $finish;
    end
    if (CoefOutP_1 !== 19'sb1100001001110000101) begin
      $display("FAIL: CoefOutP_1 mismatch");
      $finish;
    end
    if (CoefOutP_2 !== 19'sb1011110111111100000) begin
      $display("FAIL: CoefOutP_2 mismatch");
      $finish;
    end
    if (CoefOutP_3 !== 19'sb0100000010000001111) begin
      $display("FAIL: CoefOutP_3 mismatch");
      $finish;
    end
    if (CoefOutP_4 !== 19'sb1100101101011001000) begin
      $display("FAIL: CoefOutP_4 mismatch");
      $finish;
    end
    if (CoefOutP_5 !== 19'sb1110100110100011100) begin
      $display("FAIL: CoefOutP_5 mismatch");
      $finish;
    end
    if (CoefOutP_6 !== 19'sb1010011110011111011) begin
      $display("FAIL: CoefOutP_6 mismatch");
      $finish;
    end
    if (CoefOutP_7 !== 19'sb0100110111111010110) begin
      $display("FAIL: CoefOutP_7 mismatch");
      $finish;
    end
    if (CoefOutP_8 !== 19'sb1011111101011000100) begin
      $display("FAIL: CoefOutP_8 mismatch");
      $finish;
    end
    if (CoefOutP_9 !== 19'sb0000001101101001110) begin
      $display("FAIL: CoefOutP_9 mismatch");
      $finish;
    end
    if (CoefOutP_10 !== 19'sb1110101011001111001) begin
      $display("FAIL: CoefOutP_10 mismatch");
      $finish;
    end
    if (CoefOutP_11 !== 19'sb0001000100000011101) begin
      $display("FAIL: CoefOutP_11 mismatch");
      $finish;
    end
    if (CoefOutP_12 !== 19'sb0001111010000000000) begin
      $display("FAIL: CoefOutP_12 mismatch");
      $finish;
    end
    if (CoefOutP_13 !== 19'sb1011011001101111010) begin
      $display("FAIL: CoefOutP_13 mismatch");
      $finish;
    end
    if (CoefOutP_14 !== 19'sb0100000111011011010) begin
      $display("FAIL: CoefOutP_14 mismatch");
      $finish;
    end
    if (CoefOutP_15 !== 19'sb0010110111000011000) begin
      $display("FAIL: CoefOutP_15 mismatch");
      $finish;
    end
    if (CoefOutP_16 !== 19'sb0000110000010101100) begin
      $display("FAIL: CoefOutP_16 mismatch");
      $finish;
    end
    if (CoefOutP_17 !== 19'sb1010111000111111001) begin
      $display("FAIL: CoefOutP_17 mismatch");
      $finish;
    end
    if (CoefOutP_18 !== 19'sb1011110000000100111) begin
      $display("FAIL: CoefOutP_18 mismatch");
      $finish;
    end
    if (CoefOutP_19 !== 19'sb1101110110110001100) begin
      $display("FAIL: CoefOutP_19 mismatch");
      $finish;
    end
    if (CoefOutP_20 !== 19'sb0100111101011110100) begin
      $display("FAIL: CoefOutP_20 mismatch");
      $finish;
    end
    if (CoefOutP_21 !== 19'sb0100010111101101001) begin
      $display("FAIL: CoefOutP_21 mismatch");
      $finish;
    end
    if (CoefOutP_22 !== 19'sb1010010110010001010) begin
      $display("FAIL: CoefOutP_22 mismatch");
      $finish;
    end
    if (CoefOutP_23 !== 19'sb1010110010100111010) begin
      $display("FAIL: CoefOutP_23 mismatch");
      $finish;
    end
    if (CoefOutP_24 !== 19'sb0011000011000011011) begin
      $display("FAIL: CoefOutP_24 mismatch");
      $finish;
    end
    if (CoefOutP_25 !== 19'sb0101000010010110011) begin
      $display("FAIL: CoefOutP_25 mismatch");
      $finish;
    end
    if (CoefOutP_26 !== 19'sb1010101101101010000) begin
      $display("FAIL: CoefOutP_26 mismatch");
      $finish;
    end
    if (CoefOutP_27 !== 19'sb0010011001110010111) begin
      $display("FAIL: CoefOutP_27 mismatch");
      $finish;
    end
    if (CoefOutP_28 !== 19'sb0101010111001110000) begin
      $display("FAIL: CoefOutP_28 mismatch");
      $finish;
    end
    if (CoefOutP_29 !== 19'sb0000111111000100100) begin
      $display("FAIL: CoefOutP_29 mismatch");
      $finish;
    end
    if (CoefOutP_30 !== 19'sb0010101100000100110) begin
      $display("FAIL: CoefOutP_30 mismatch");
      $finish;
    end
    if (CoefOutP_31 !== 19'sb1011011000100011100) begin
      $display("FAIL: CoefOutP_31 mismatch");
      $finish;
    end
    if (CoefOutP_32 !== 19'sb0011001000000010010) begin
      $display("FAIL: CoefOutP_32 mismatch");
      $finish;
    end
    if (CoefOutP_33 !== 19'sb0010110000011111101) begin
      $display("FAIL: CoefOutP_33 mismatch");
      $finish;
    end
    if (CoefOutP_34 !== 19'sb1110011000011001111) begin
      $display("FAIL: CoefOutP_34 mismatch");
      $finish;
    end
    if (CoefOutP_35 !== 19'sb0001000100111010000) begin
      $display("FAIL: CoefOutP_35 mismatch");
      $finish;
    end
    if (CoefOutP_36 !== 19'sb1010011000000101001) begin
      $display("FAIL: CoefOutP_36 mismatch");
      $finish;
    end
    if (CoefOutP_37 !== 19'sb0011110100101110000) begin
      $display("FAIL: CoefOutP_37 mismatch");
      $finish;
    end
    if (CoefOutP_38 !== 19'sb0100001100001001001) begin
      $display("FAIL: CoefOutP_38 mismatch");
      $finish;
    end
    if (CoefOutP_39 !== 19'sb0001110111111011010) begin
      $display("FAIL: CoefOutP_39 mismatch");
      $finish;
    end
    if (CoefOutP_40 !== 19'sb0101010001011100111) begin
      $display("FAIL: CoefOutP_40 mismatch");
      $finish;
    end
    if (CoefOutP_41 !== 19'sb0101100101010001000) begin
      $display("FAIL: CoefOutP_41 mismatch");
      $finish;
    end
    if (CoefOutP_42 !== 19'sb0011000000100111110) begin
      $display("FAIL: CoefOutP_42 mismatch");
      $finish;
    end
    if (CoefOutP_43 !== 19'sb0001000101011111101) begin
      $display("FAIL: CoefOutP_43 mismatch");
      $finish;
    end
    if (CoefOutP_44 !== 19'sb0100111000001101011) begin
      $display("FAIL: CoefOutP_44 mismatch");
      $finish;
    end
    if (CoefOutP_45 !== 19'sb0100111010001001100) begin
      $display("FAIL: CoefOutP_45 mismatch");
      $finish;
    end
    if (CoefOutP_46 !== 19'sb0101011110001111101) begin
      $display("FAIL: CoefOutP_46 mismatch");
      $finish;
    end
    if (CoefOutP_47 !== 19'sb1010100101011110100) begin
      $display("FAIL: CoefOutP_47 mismatch");
      $finish;
    end
    if (CoefOutP_48 !== 19'sb1111011001101010010) begin
      $display("FAIL: CoefOutP_48 mismatch");
      $finish;
    end
    if (CoefOutP_49 !== 19'sb0101000010110111100) begin
      $display("FAIL: CoefOutP_49 mismatch");
      $finish;
    end
    if (CoefOutP_50 !== 19'sb1011101001100101110) begin
      $display("FAIL: CoefOutP_50 mismatch");
      $finish;
    end
    if (CoefOutP_51 !== 19'sb0100111010110110101) begin
      $display("FAIL: CoefOutP_51 mismatch");
      $finish;
    end
    if (CoefOutP_52 !== 19'sb0100101010101011010) begin
      $display("FAIL: CoefOutP_52 mismatch");
      $finish;
    end
    if (CoefOutP_53 !== 19'sb1110110110010101010) begin
      $display("FAIL: CoefOutP_53 mismatch");
      $finish;
    end
    if (CoefOutP_54 !== 19'sb0100110001110100001) begin
      $display("FAIL: CoefOutP_54 mismatch");
      $finish;
    end
    if (CoefOutP_55 !== 19'sb0100111010011110001) begin
      $display("FAIL: CoefOutP_55 mismatch");
      $finish;
    end
    if (CoefOutP_56 !== 19'sb1101010101010110010) begin
      $display("FAIL: CoefOutP_56 mismatch");
      $finish;
    end
    if (CoefOutP_57 !== 19'sb1011010110100000000) begin
      $display("FAIL: CoefOutP_57 mismatch");
      $finish;
    end
    if (CoefOutP_58 !== 19'sb0000111110001001111) begin
      $display("FAIL: CoefOutP_58 mismatch");
      $finish;
    end
    if (CoefOutP_59 !== 19'sb0000010000101111000) begin
      $display("FAIL: CoefOutP_59 mismatch");
      $finish;
    end
    if (CoefOutP_60 !== 19'sb0101011111100100001) begin
      $display("FAIL: CoefOutP_60 mismatch");
      $finish;
    end
    if (CoefOutP_61 !== 19'sb1111111011011110110) begin
      $display("FAIL: CoefOutP_61 mismatch");
      $finish;
    end
    if (CoefOutP_62 !== 19'sb0101100011010010001) begin
      $display("FAIL: CoefOutP_62 mismatch");
      $finish;
    end
    if (CoefOutP_63 !== 19'sb0101010000011000100) begin
      $display("FAIL: CoefOutP_63 mismatch");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule