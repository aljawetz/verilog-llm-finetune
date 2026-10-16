`timescale 1ns/1ps

module tb_c7552;

  reg N1, N5, N9, N12, N15, N18, N23, N26, N29, N32, N35, N38;
  reg N41, N44, N47, N50, N53, N54, N55, N56, N57, N58, N59, N60;
  reg N61, N62, N63, N64, N65, N66, N69, N70, N73, N74, N75, N76;
  reg N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88;
  reg N89, N94, N97, N100, N103, N106, N109, N110, N111, N112;
  reg N113, N114, N115, N118, N121, N124, N127, N130, N133, N134;
  reg N135, N138, N141, N144, N147, N150, N151, N152, N153, N154;
  reg N155, N156, N157, N158, N159, N160, N161, N162, N163, N164;
  reg N165, N166, N167, N168, N169, N170, N171, N172, N173, N174;
  reg N175, N176, N177, N178, N179, N180, N181, N182, N183, N184;
  reg N185, N186, N187, N188, N189, N190, N191, N192, N193, N194;
  reg N195, N196, N197, N198, N199, N200, N201, N202, N203, N204;
  reg N205, N206, N207, N208, N209, N210, N211, N212, N213, N214;
  reg N215, N216, N217, N218, N219, N220, N221, N222, N223, N224;
  reg N225, N226, N227, N228, N229, N230, N231, N232, N233, N234;
  reg N235, N236, N237, N238, N239, N240, N242, N245, N248, N251;
  reg N254, N257, N260, N263, N267, N271, N274, N277, N280, N283;
  reg N286, N289, N293, N296, N299, N303, N307, N310, N313, N316;
  reg N319, N322, N325, N328, N331, N334, N337, N340, N343, N346;
  reg N349, N352, N355, N358, N361, N364, N367, N382, N241_I;

  wire N387, N388, N478, N482, N484, N486, N489, N492, N501, N505;
  wire N507, N509, N511, N513, N515, N517, N519, N535, N537, N539;
  wire N541, N543, N545, N547, N549, N551, N553, N556, N559, N561;
  wire N563, N565, N567, N569, N571, N573, N582, N643, N707, N813;
  wire N881, N882, N883, N884, N885, N889, N945, N1110, N1111, N1112;
  wire N1113, N1114, N1489, N1490, N1781, N10025, N10101, N10102;
  wire N10103, N10104, N10109, N10110, N10111, N10112, N10350, N10351;
  wire N10352, N10353, N10574, N10575, N10576, N10628, N10632, N10641;
  wire N10704, N10706, N10711, N10712, N10713, N10714, N10715, N10716;
  wire N10717, N10718, N10729, N10759, N10760, N10761, N10762, N10763;
  wire N10827, N10837, N10838, N10839, N10840, N10868, N10869, N10870;
  wire N10871, N10905, N10906, N10907, N10908, N11333, N11334, N11340;
  wire N11342, N241_O;

  c7552 uut (
    .N1(N1), .N5(N5), .N9(N9), .N12(N12), .N15(N15), .N18(N18),
    .N23(N23), .N26(N26), .N29(N29), .N32(N32), .N35(N35), .N38(N38),
    .N41(N41), .N44(N44), .N47(N47), .N50(N50), .N53(N53), .N54(N54),
    .N55(N55), .N56(N56), .N57(N57), .N58(N58), .N59(N59), .N60(N60),
    .N61(N61), .N62(N62), .N63(N63), .N64(N64), .N65(N65), .N66(N66),
    .N69(N69), .N70(N70), .N73(N73), .N74(N74), .N75(N75), .N76(N76),
    .N77(N77), .N78(N78), .N79(N79), .N80(N80), .N81(N81), .N82(N82),
    .N83(N83), .N84(N84), .N85(N85), .N86(N86), .N87(N87), .N88(N88),
    .N89(N89), .N94(N94), .N97(N97), .N100(N100), .N103(N103), .N106(N106),
    .N109(N109), .N110(N110), .N111(N111), .N112(N112), .N113(N113),
    .N114(N114), .N115(N115), .N118(N118), .N121(N121), .N124(N124),
    .N127(N127), .N130(N130), .N133(N133), .N134(N134), .N135(N135),
    .N138(N138), .N141(N141), .N144(N144), .N147(N147), .N150(N150),
    .N151(N151), .N152(N152), .N153(N153), .N154(N154), .N155(N155),
    .N156(N156), .N157(N157), .N158(N158), .N159(N159), .N160(N160),
    .N161(N161), .N162(N162), .N163(N163), .N164(N164), .N165(N165),
    .N166(N166), .N167(N167), .N168(N168), .N169(N169), .N170(N170),
    .N171(N171), .N172(N172), .N173(N173), .N174(N174), .N175(N175),
    .N176(N176), .N177(N177), .N178(N178), .N179(N179), .N180(N180),
    .N181(N181), .N182(N182), .N183(N183), .N184(N184), .N185(N185),
    .N186(N186), .N187(N187), .N188(N188), .N189(N189), .N190(N190),
    .N191(N191), .N192(N192), .N193(N193), .N194(N194), .N195(N195),
    .N196(N196), .N197(N197), .N198(N198), .N199(N199), .N200(N200),
    .N201(N201), .N202(N202), .N203(N203), .N204(N204), .N205(N205),
    .N206(N206), .N207(N207), .N208(N208), .N209(N209), .N210(N210),
    .N211(N211), .N212(N212), .N213(N213), .N214(N214), .N215(N215),
    .N216(N216), .N217(N217), .N218(N218), .N219(N219), .N220(N220),
    .N221(N221), .N222(N222), .N223(N223), .N224(N224), .N225(N225),
    .N226(N226), .N227(N227), .N228(N228), .N229(N229), .N230(N230),
    .N231(N231), .N232(N232), .N233(N233), .N234(N234), .N235(N235),
    .N236(N236), .N237(N237), .N238(N238), .N239(N239), .N240(N240),
    .N242(N242), .N245(N245), .N248(N248), .N251(N251), .N254(N254),
    .N257(N257), .N260(N260), .N263(N263), .N267(N267), .N271(N271),
    .N274(N274), .N277(N277), .N280(N280), .N283(N283), .N286(N286),
    .N289(N289), .N293(N293), .N296(N296), .N299(N299), .N303(N303),
    .N307(N307), .N310(N310), .N313(N313), .N316(N316), .N319(N319),
    .N322(N322), .N325(N325), .N328(N328), .N331(N331), .N334(N334),
    .N337(N337), .N340(N340), .N343(N343), .N346(N346), .N349(N349),
    .N352(N352), .N355(N355), .N358(N358), .N361(N361), .N364(N364),
    .N367(N367), .N382(N382), .N241_I(N241_I),
    .N387(N387), .N388(N388), .N478(N478), .N482(N482), .N484(N484),
    .N486(N486), .N489(N489), .N492(N492), .N501(N501), .N505(N505),
    .N507(N507), .N509(N509), .N511(N511), .N513(N513), .N515(N515),
    .N517(N517), .N519(N519), .N535(N535), .N537(N537), .N539(N539),
    .N541(N541), .N543(N543), .N545(N545), .N547(N547), .N549(N549),
    .N551(N551), .N553(N553), .N556(N556), .N559(N559), .N561(N561),
    .N563(N563), .N565(N565), .N567(N567), .N569(N569), .N571(N571),
    .N573(N573), .N582(N582), .N643(N643), .N707(N707), .N813(N813),
    .N881(N881), .N882(N882), .N883(N883), .N884(N884), .N885(N885),
    .N889(N889), .N945(N945), .N1110(N1110), .N1111(N1111), .N1112(N1112),
    .N1113(N1113), .N1114(N1114), .N1489(N1489), .N1490(N1490), .N1781(N1781),
    .N10025(N10025), .N10101(N10101), .N10102(N10102), .N10103(N10103),
    .N10104(N10104), .N10109(N10109), .N10110(N10110), .N10111(N10111),
    .N10112(N10112), .N10350(N10350), .N10351(N10351), .N10352(N10352),
    .N10353(N10353), .N10574(N10574), .N10575(N10575), .N10576(N10576),
    .N10628(N10628), .N10632(N10632), .N10641(N10641), .N10704(N10704),
    .N10706(N10706), .N10711(N10711), .N10712(N10712), .N10713(N10713),
    .N10714(N10714), .N10715(N10715), .N10716(N10716), .N10717(N10717),
    .N10718(N10718), .N10729(N10729), .N10759(N10759), .N10760(N10760),
    .N10761(N10761), .N10762(N10762), .N10763(N10763), .N10827(N10827),
    .N10837(N10837), .N10838(N10838), .N10839(N10839), .N10840(N10840),
    .N10868(N10868), .N10869(N10869), .N10870(N10870), .N10871(N10871),
    .N10905(N10905), .N10906(N10906), .N10907(N10907), .N10908(N10908),
    .N11333(N11333), .N11334(N11334), .N11340(N11340), .N11342(N11342),
    .N241_O(N241_O)
  );

  initial begin
    // Initialize inputs
    {N1, N5, N9, N12, N15, N18, N23, N26, N29, N32, N35, N38,
     N41, N44, N47, N50, N53, N54, N55, N56, N57, N58, N59, N60,
     N61, N62, N63, N64, N65, N66, N69, N70, N73, N74, N75, N76,
     N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88,
     N89, N94, N97, N100, N103, N106, N109, N110, N111, N112,
     N113, N114, N115, N118, N121, N124, N127, N130, N133, N134,
     N135, N138, N141, N144, N147, N150, N151, N152, N153, N154,
     N155, N156, N157, N158, N159, N160, N161, N162, N163, N164,
     N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
     N175, N176, N177, N178, N179, N180, N181, N182, N183, N184,
     N185, N186, N187, N188, N189, N190, N191, N192, N193, N194,
     N195, N196, N197, N198, N199, N200, N201, N202, N203, N204,
     N205, N206, N207, N208, N209, N210, N211, N212, N213, N214,
     N215, N216, N217, N218, N219, N220, N221, N222, N223, N224,
     N225, N226, N227, N228, N229, N230, N231, N232, N233, N234,
     N235, N236, N237, N238, N239, N240, N242, N245, N248, N251,
     N254, N257, N260, N263, N267, N271, N274, N277, N280, N283,
     N286, N289, N293, N296, N299, N303, N307, N310, N313, N316,
     N319, N322, N325, N328, N331, N334, N337, N340, N343, N346,
     N349, N352, N355, N358, N361, N364, N367, N382, N241_I} = 0;

    // Test sequence
    #10 N1 = 1; N5 = 1; N9 = 1; N12 = 1; N15 = 1; N18 = 1; N23 = 1; N26 = 1; N29 = 1; N32 = 1; N35 = 1; N38 = 1;
    #10 if (N387 !== 1) $display("FAIL: Output N387 is incorrect");
    #10 if (N388 !== 1) $display("FAIL: Output N388 is incorrect");
    #10 if (N478 !== 1) $display("FAIL: Output N478 is incorrect");
    #10 if (N482 !== 1) $display("FAIL: Output N482 is incorrect");
    #10 if (N484 !== 1) $display("FAIL: Output N484 is incorrect");
    #10 if (N486 !== 1) $display("FAIL: Output N486 is incorrect");
    #10 if (N489 !== 1) $display("FAIL: Output N489 is incorrect");
    #10 if (N492 !== 1) $display("FAIL: Output N492 is incorrect");
    #10 if (N501 !== 1) $display("FAIL: Output N501 is incorrect");
    #10 if (N505 !== 1) $display("FAIL: Output N505 is incorrect");
    #10 if (N507 !== 1) $display("FAIL: Output N507 is incorrect");
    #10 if (N509 !== 1) $display("FAIL: Output N509 is incorrect");
    #10 if (N511 !== 1) $display("FAIL: Output N511 is incorrect");
    #10 if (N513 !== 1) $display("FAIL: Output N513 is incorrect");
    #10 if (N515 !== 1) $display("FAIL: Output N515 is incorrect");
    #10 if (N517 !== 1) $display("FAIL: Output N517 is incorrect");
    #10 if (N519 !== 1) $display("FAIL: Output N519 is incorrect");
    #10 if (N535 !== 1) $display("FAIL: Output N535 is incorrect");
    #10 if (N537 !== 1) $display("FAIL: Output N537 is incorrect");
    #10 if (N539 !== 1) $display("FAIL: Output N539 is incorrect");
    #10 if (N541 !== 1) $display("FAIL: Output N541 is incorrect");
    #10 if (N543 !== 1) $display("FAIL: Output N543 is incorrect");
    #10 if (N545 !== 1) $display("FAIL: Output N545 is incorrect");
    #10 if (N547 !== 1) $display("FAIL: Output N547 is incorrect");
    #10 if (N549 !== 1) $display("FAIL: Output N549 is incorrect");
    #10 if (N551 !== 1) $display("FAIL: Output N551 is incorrect");
    #10 if (N553 !== 1) $display("FAIL: Output N553 is incorrect");
    #10 if (N556 !== 1) $display("FAIL: Output N556 is incorrect");
    #10 if (N559 !== 1) $display("FAIL: Output N559 is incorrect");
    #10 if (N561 !== 1) $display("FAIL: Output N561 is incorrect");
    #10 if (N563 !== 1) $display("FAIL: Output N563 is incorrect");
    #10 if (N565 !== 1) $display("FAIL: Output N565 is incorrect");
    #10 if (N567 !== 1) $display("FAIL: Output N567 is incorrect");
    #10 if (N569 !== 1) $display("FAIL: Output N569 is incorrect");
    #10 if (N571 !== 1) $display("FAIL: Output N571 is incorrect");
    #10 if (N573 !== 1) $display("FAIL: Output N573 is incorrect");
    #10 if (N582 !== 1) $display("FAIL: Output N582 is incorrect");
    #10 if (N643 !== 1) $display("FAIL: Output N643 is incorrect");
    #10 if (N707 !== 1) $display("FAIL: Output N707 is incorrect");
    #10 if (N813 !== 1) $display("FAIL: Output N813 is incorrect");
    #10 if (N881 !== 1) $display("FAIL: Output N881 is incorrect");
    #10 if (N882 !== 1) $display("FAIL: Output N882 is incorrect");
    #10 if (N883 !== 1) $display("FAIL: Output N883 is incorrect");
    #10 if (N884 !== 1) $display("FAIL: Output N884 is incorrect");
    #10 if (N885 !== 1) $display("FAIL: Output N885 is incorrect");
    #10 if (N889 !== 1) $display("FAIL: Output N889 is incorrect");
    #10 if (N945 !== 1) $display("FAIL: Output N945 is incorrect");
    #10 if (N1110 !== 1) $display("FAIL: Output N1110 is incorrect");
    #10 if (N1111 !== 1) $display("FAIL: Output N1111 is incorrect");
    #10 if (N1112 !== 1) $display("FAIL: Output N1112 is incorrect");
    #10 if (N1113 !== 1) $display("FAIL: Output N1113 is incorrect");
    #10 if (N1114 !== 1) $display("FAIL: Output N1114 is incorrect");
    #10 if (N1489 !== 1) $display("FAIL: Output N1489 is incorrect");
    #10 if (N1490 !== 1) $display("FAIL: Output N1490 is incorrect");
    #10 if (N1781 !== 1) $display("FAIL: Output N1781 is incorrect");
    #10 if (N10025 !== 1) $display("FAIL: Output N10025 is incorrect");
    #10 if (N10101 !== 1) $display("FAIL: Output N10101 is incorrect");
    #10 if (N10102 !== 1) $display("FAIL: Output N10102 is incorrect");
    #10 if (N10103 !== 1) $display("FAIL: Output N10103 is incorrect");
    #10 if (N10104 !== 1) $display("FAIL: Output N10104 is incorrect");
    #10 if (N10109 !== 1) $display("FAIL: Output N10109 is incorrect");
    #10 if (N10110 !== 1) $display("FAIL: Output N10110 is incorrect");
    #10 if (N10111 !== 1) $display("FAIL: Output N10111 is incorrect");
    #10 if (N10112 !== 1) $display("FAIL: Output N10112 is incorrect");
    #10 if (N10350 !== 1) $display("FAIL: Output N10350 is incorrect");
    #10 if (N10351 !== 1) $display("FAIL: Output N10351 is incorrect");
    #10 if (N10352 !== 1) $display("FAIL: Output N10352 is incorrect");
    #10 if (N10353 !== 1) $display("FAIL: Output N10353 is incorrect");
    #10 if (N10574 !== 1) $display("FAIL: Output N10574 is incorrect");
    #10 if (N10575 !== 1) $display("FAIL: Output N10575 is incorrect");
    #10 if (N10576 !== 1) $display("FAIL: Output N10576 is incorrect");
    #10 if (N10628 !== 1) $display("FAIL: Output N10628 is incorrect");
    #10 if (N10632 !== 1) $display("FAIL: Output N10632 is incorrect");
    #10 if (N10641 !== 1) $display("FAIL: Output N10641 is incorrect");
    #10 if (N10704 !== 1) $display("FAIL: Output N10704 is incorrect");
    #10 if (N10706 !== 1) $display("FAIL: Output N10706 is incorrect");
    #10 if (N10711 !== 1) $display("FAIL: Output N10711 is incorrect");
    #10 if (N10712 !== 1) $display("FAIL: Output N10712 is incorrect");
    #10 if (N10713 !== 1) $display("FAIL: Output N10713 is incorrect");
    #10 if (N10714 !== 1) $display("FAIL: Output N10714 is incorrect");
    #10 if (N10715 !== 1) $display("FAIL: Output N10715 is incorrect");
    #10 if (N10716 !== 1) $display("FAIL: Output N10716 is incorrect");
    #10 if (N10717 !== 1) $display("FAIL: Output N10717 is incorrect");
    #10 if (N10718 !== 1) $display("FAIL: Output N10718 is incorrect");
    #10 if (N10729 !== 1) $display("FAIL: Output N10729 is incorrect");
    #10 if (N10759 !== 1) $display("FAIL: Output N10759 is incorrect");
    #10 if (N10760 !== 1) $display("FAIL: Output N10760 is incorrect");
    #10 if (N10761 !== 1) $display("FAIL: Output N10761 is incorrect");
    #10 if (N10762 !== 1) $display("FAIL: Output N10762 is incorrect");
    #10 if (N10763 !== 1) $display("FAIL: Output N10763 is incorrect");
    #10 if (N10827 !== 1) $display("FAIL: Output N10827 is incorrect");
    #10 if (N10837 !== 1) $display("FAIL: Output N10837 is incorrect");
    #10 if (N10838 !== 1) $display("FAIL: Output N10838 is incorrect");
    #10 if (N10839 !== 1) $display("FAIL: Output N10839 is incorrect");
    #10 if (N10840 !== 1) $display("FAIL: Output N10840 is incorrect");
    #10 if (N10868 !== 1) $display("FAIL: Output N10868 is incorrect");
    #10 if (N10869 !== 1) $display("FAIL: Output N10869 is incorrect");
    #10 if (N10870 !== 1) $display("FAIL: Output N10870 is incorrect");
    #10 if (N10871 !== 1) $display("FAIL: Output N10871 is incorrect");
    #10 if (N10905 !== 1) $display("FAIL: Output N10905 is incorrect");
    #10 if (N10906 !== 1) $display("FAIL: Output N10906 is incorrect");
    #10 if (N10907 !== 1) $display("FAIL: Output N10907 is incorrect");
    #10 if (N10908 !== 1) $display("FAIL: Output N10908 is incorrect");
    #10 if (N11333 !== 1) $display("FAIL: Output N11333 is incorrect");
    #10 if (N11334 !== 1) $display("FAIL: Output N11334 is incorrect");
    #10 if (N11340 !== 1) $display("FAIL: Output N11340 is incorrect");
    #10 if (N11342 !== 1) $display("FAIL: Output N11342 is incorrect");
    #10 if (N241_O !== 1) $display("FAIL: Output N241_O is incorrect");

    $display("PASS");
    $finish;
  end

endmodule