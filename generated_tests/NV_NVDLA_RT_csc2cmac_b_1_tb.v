`timescale 1ns/1ps

module tb_NV_NVDLA_RT_csc2cmac_b;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg sc2mac_wt_src_pvld;
  reg [127:0] sc2mac_wt_src_mask;
  reg [7:0] sc2mac_wt_src_data0;
  reg [7:0] sc2mac_wt_src_data1;
  reg [7:0] sc2mac_wt_src_data2;
  reg [7:0] sc2mac_wt_src_data3;
  reg [7:0] sc2mac_wt_src_data4;
  reg [7:0] sc2mac_wt_src_data5;
  reg [7:0] sc2mac_wt_src_data6;
  reg [7:0] sc2mac_wt_src_data7;
  reg [7:0] sc2mac_wt_src_data8;
  reg [7:0] sc2mac_wt_src_data9;
  reg [7:0] sc2mac_wt_src_data10;
  reg [7:0] sc2mac_wt_src_data11;
  reg [7:0] sc2mac_wt_src_data12;
  reg [7:0] sc2mac_wt_src_data13;
  reg [7:0] sc2mac_wt_src_data14;
  reg [7:0] sc2mac_wt_src_data15;
  reg [7:0] sc2mac_wt_src_data16;
  reg [7:0] sc2mac_wt_src_data17;
  reg [7:0] sc2mac_wt_src_data18;
  reg [7:0] sc2mac_wt_src_data19;
  reg [7:0] sc2mac_wt_src_data20;
  reg [7:0] sc2mac_wt_src_data21;
  reg [7:0] sc2mac_wt_src_data22;
  reg [7:0] sc2mac_wt_src_data23;
  reg [7:0] sc2mac_wt_src_data24;
  reg [7:0] sc2mac_wt_src_data25;
  reg [7:0] sc2mac_wt_src_data26;
  reg [7:0] sc2mac_wt_src_data27;
  reg [7:0] sc2mac_wt_src_data28;
  reg [7:0] sc2mac_wt_src_data29;
  reg [7:0] sc2mac_wt_src_data30;
  reg [7:0] sc2mac_wt_src_data31;
  reg [7:0] sc2mac_wt_src_sel;
  reg sc2mac_dat_src_pvld;
  reg [127:0] sc2mac_dat_src_mask;
  reg [7:0] sc2mac_dat_src_data0;
  reg [7:0] sc2mac_dat_src_data1;
  reg [7:0] sc2mac_dat_src_data2;
  reg [7:0] sc2mac_dat_src_data3;
  reg [7:0] sc2mac_dat_src_data4;
  reg [7:0] sc2mac_dat_src_data5;
  reg [7:0] sc2mac_dat_src_data6;
  reg [7:0] sc2mac_dat_src_data7;
  reg [7:0] sc2mac_dat_src_data8;
  reg [7:0] sc2mac_dat_src_data9;
  reg [7:0] sc2mac_dat_src_data10;
  reg [7:0] sc2mac_dat_src_data11;
  reg [7:0] sc2mac_dat_src_data12;
  reg [7:0] sc2mac_dat_src_data13;
  reg [7:0] sc2mac_dat_src_data14;
  reg [7:0] sc2mac_dat_src_data15;
  reg [7:0] sc2mac_dat_src_data16;
  reg [7:0] sc2mac_dat_src_data17;
  reg [7:0] sc2mac_dat_src_data18;
  reg [7:0] sc2mac_dat_src_data19;
  reg [7:0] sc2mac_dat_src_data20;
  reg [7:0] sc2mac_dat_src_data21;
  reg [7:0] sc2mac_dat_src_data22;
  reg [7:0] sc2mac_dat_src_data23;
  reg [7:0] sc2mac_dat_src_data24;
  reg [7:0] sc2mac_dat_src_data25;
  reg [7:0] sc2mac_dat_src_data26;
  reg [7:0] sc2mac_dat_src_data27;
  reg [7:0] sc2mac_dat_src_data28;
  reg [7:0] sc2mac_dat_src_data29;
  reg [7:0] sc2mac_dat_src_data30;
  reg [7:0] sc2mac_dat_src_data31;
  reg [7:0] sc2mac_dat_src_data32;
  reg [7:0] sc2mac_dat_src_data33;
  reg [7:0] sc2mac_dat_src_data34;
  reg [7:0] sc2mac_dat_src_data35;
  reg [7:0] sc2mac_dat_src_data36;
  reg [7:0] sc2mac_dat_src_data37;
  reg [7:0] sc2mac_dat_src_data38;
  reg [7:0] sc2mac_dat_src_data39;
  reg [7:0] sc2mac_dat_src_data40;
  reg [7:0] sc2mac_dat_src_data41;
  reg [7:0] sc2mac_dat_src_data42;
  reg [7:0] sc2mac_dat_src_data43;
  reg [7:0] sc2mac_dat_src_data44;
  reg [7:0] sc2mac_dat_src_data45;
  reg [7:0] sc2mac_dat_src_data46;
  reg [7:0] sc2mac_dat_src_data47;
  reg [7:0] sc2mac_dat_src_data48;
  reg [7:0] sc2mac_dat_src_data49;
  reg [7:0] sc2mac_dat_src_data50;
  reg [7:0] sc2mac_dat_src_data51;
  reg [7:0] sc2mac_dat_src_data52;
  reg [7:0] sc2mac_dat_src_data53;
  reg [7:0] sc2mac_dat_src_data54;
  reg [7:0] sc2mac_dat_src_data55;
  reg [7:0] sc2mac_dat_src_data56;
  reg [7:0] sc2mac_dat_src_data57;
  reg [7:0] sc2mac_dat_src_data58;
  reg [7:0] sc2mac_dat_src_data59;
  reg [7:0] sc2mac_dat_src_data60;
  reg [7:0] sc2mac_dat_src_data61;
  reg [7:0] sc2mac_dat_src_data62;
  reg [7:0] sc2mac_dat_src_data63;
  reg [8:0] sc2mac_dat_src_pd;

  wire sc2mac_wt_dst_pvld;
  wire [127:0] sc2mac_wt_dst_mask;
  wire [7:0] sc2mac_wt_dst_data0;
  wire [7:0] sc2mac_wt_dst_data1;
  wire [7:0] sc2mac_wt_dst_data2;
  wire [7:0] sc2mac_wt_dst_data3;
  wire [7:0] sc2mac_wt_dst_data4;
  wire [7:0] sc2mac_wt_dst_data5;
  wire [7:0] sc2mac_wt_dst_data6;
  wire [7:0] sc2mac_wt_dst_data7;
  wire [7:0] sc2mac_wt_dst_data8;
  wire [7:0] sc2mac_wt_dst_data9;
  wire [7:0] sc2mac_wt_dst_data10;
  wire [7:0] sc2mac_wt_dst_data11;
  wire [7:0] sc2mac_wt_dst_data12;
  wire [7:0] sc2mac_wt_dst_data13;
  wire [7:0] sc2mac_wt_dst_data14;
  wire [7:0] sc2mac_wt_dst_data15;
  wire [7:0] sc2mac_wt_dst_data16;
  wire [7:0] sc2mac_wt_dst_data17;
  wire [7:0] sc2mac_wt_dst_data18;
  wire [7:0] sc2mac_wt_dst_data19;
  wire [7:0] sc2mac_wt_dst_data20;
  wire [7:0] sc2mac_wt_dst_data21;
  wire [7:0] sc2mac_wt_dst_data22;
  wire [7:0] sc2mac_wt_dst_data23;
  wire [7:0] sc2mac_wt_dst_data24;
  wire [7:0] sc2mac_wt_dst_data25;
  wire [7:0] sc2mac_wt_dst_data26;
  wire [7:0] sc2mac_wt_dst_data27;
  wire [7:0] sc2mac_wt_dst_data28;
  wire [7:0] sc2mac_wt_dst_data29;
  wire [7:0] sc2mac_wt_dst_data30;
  wire [7:0] sc2mac_wt_dst_data31;
  wire [7:0] sc2mac_wt_dst_data32;
  wire [7:0] sc2mac_wt_dst_data33;
  wire [7:0] sc2mac_wt_dst_data34;
  wire [7:0] sc2mac_wt_dst_data35;
  wire [7:0] sc2mac_wt_dst_data36;
  wire [7:0] sc2mac_wt_dst_data37;
  wire [7:0] sc2mac_wt_dst_data38;
  wire [7:0] sc2mac_wt_dst_data39;
  wire [7:0] sc2mac_wt_dst_data40;
  wire [7:0] sc2mac_wt_dst_data41;
  wire [7:0] sc2mac_wt_dst_data42;
  wire [7:0] sc2mac_wt_dst_data43;
  wire [7:0] sc2mac_wt_dst_data44;
  wire [7:0] sc2mac_wt_dst_data45;
  wire [7:0] sc2mac_wt_dst_data46;
  wire [7:0] sc2mac_wt_dst_data47;
  wire [7:0] sc2mac_wt_dst_data48;
  wire [7:0] sc2mac_wt_dst_data49;
  wire [7:0] sc2mac_wt_dst_data50;
  wire [7:0] sc2mac_wt_dst_data51;
  wire [7:0] sc2mac_wt_dst_data52;
  wire [7:0] sc2mac_wt_dst_data53;
  wire [7:0] sc2mac_wt_dst_data54;
  wire [7:0] sc2mac_wt_dst_data55;
  wire [7:0] sc2mac_wt_dst_data56;
  wire [7:0] sc2mac_wt_dst_data57;
  wire [7:0] sc2mac_wt_dst_data58;
  wire [7:0] sc2mac_wt_dst_data59;
  wire [7:0] sc2mac_wt_dst_data60;
  wire [7:0] sc2mac_wt_dst_data61;
  wire [7:0] sc2mac_wt_dst_data62;
  wire [7:0] sc2mac_wt_dst_data63;
  wire [7:0] sc2mac_wt_dst_data64;
  wire [7:0] sc2mac_wt_dst_data65;
  wire [7:0] sc2mac_wt_dst_data66;
  wire [7:0] sc2mac_wt_dst_data67;
  wire [7:0] sc2mac_wt_dst_data68;
  wire [7:0] sc2mac_wt_dst_data69;
  wire [7:0] sc2mac_wt_dst_data70;
  wire [7:0] sc2mac_wt_dst_data71;
  wire [7:0] sc2mac_wt_dst_data72;
  wire [7:0] sc2mac_wt_dst_data73;
  wire [7:0] sc2mac_wt_dst_data74;
  wire [7:0] sc2mac_wt_dst_data75;
  wire [7:0] sc2mac_wt_dst_data76;
  wire [7:0] sc2mac_wt_dst_data77;
  wire [7:0] sc2mac_wt_dst_data78;
  wire [7:0] sc2mac_wt_dst_data79;
  wire [7:0] sc2mac_wt_dst_data80;
  wire [7:0] sc2mac_wt_dst_data81;
  wire [7:0] sc2mac_wt_dst_data82;
  wire [7:0] sc2mac_wt_dst_data83;
  wire [7:0] sc2mac_wt_dst_data84;
  wire [7:0] sc2mac_wt_dst_data85;
  wire [7:0] sc2mac_wt_dst_data86;
  wire [7:0] sc2mac_wt_dst_data87;
  wire [7:0] sc2mac_wt_dst_data88;
  wire [7:0] sc2mac_wt_dst_data89;
  wire [7:0] sc2mac_wt_dst_data90;
  wire [7:0] sc2mac_wt_dst_data91;
  wire [7:0] sc2mac_wt_dst_data92;
  wire [7:0] sc2mac_wt_dst_data93;
  wire [7:0] sc2mac_wt_dst_data94;
  wire [7:0] sc2mac_wt_dst_data95;
  wire [7:0] sc2mac_wt_dst_data96;
  wire [7:0] sc2mac_wt_dst_data97;
  wire [7:0] sc2mac_wt_dst_data98;
  wire [7:0] sc2mac_wt_dst_data99;
  wire [7:0] sc2mac_wt_dst_data100;
  wire [7:0] sc2mac_wt_dst_data101;
  wire [7:0] sc2mac_wt_dst_data102;
  wire [7:0] sc2mac_wt_dst_data103;
  wire [7:0] sc2mac_wt_dst_data104;
  wire [7:0] sc2mac_wt_dst_data105;
  wire [7:0] sc2mac_wt_dst_data106;
  wire [7:0] sc2mac_wt_dst_data107;
  wire [7:0] sc2mac_wt_dst_data108;
  wire [7:0] sc2mac_wt_dst_data109;
  wire [7:0] sc2mac_wt_dst_data110;
  wire [7:0] sc2mac_wt_dst_data111;
  wire [7:0] sc2mac_wt_dst_data112;
  wire [7:0] sc2mac_wt_dst_data113;
  wire [7:0] sc2mac_wt_dst_data114;
  wire [7:0] sc2mac_wt_dst_data115;
  wire [7:0] sc2mac_wt_dst_data116;
  wire [7:0] sc2mac_wt_dst_data117;
  wire [7:0] sc2mac_wt_dst_data118;
  wire [7:0] sc2mac_wt_dst_data119;
  wire [7:0] sc2mac_wt_dst_data120;
  wire [7:0] sc2mac_wt_dst_data121;
  wire [7:0] sc2mac_wt_dst_data122;
  wire [7:0] sc2mac_wt_dst_data123;
  wire [7:0] sc2mac_wt_dst_data124;
  wire [7:0] sc2mac_wt_dst_data125;
  wire [7:0] sc2mac_wt_dst_data126;
  wire [7:0] sc2mac_wt_dst_data127;
  wire [7:0] sc2mac_dat_dst_sel;
  wire sc2mac_dat_dst_pvld;
  wire [127:0] sc2mac_dat_dst_mask;
  wire [7:0] sc2mac_dat_dst_data0;
  wire [7:0] sc2mac_dat_dst_data1;
  wire [7:0] sc2mac_dat_dst_data2;
  wire [7:0] sc2mac_dat_dst_data3;
  wire [7:0] sc2mac_dat_dst_data4;
  wire [7:0] sc2mac_dat_dst_data5;
  wire [7:0] sc2mac_dat_dst_data6;
  wire [7:0] sc2mac_dat_dst_data7;
  wire [7:0] sc2mac_dat_dst_data8;
  wire [7:0] sc2mac_dat_dst_data9;
  wire [7:0] sc2mac_dat_dst_data10;
  wire [7:0] sc2mac_dat_dst_data11;
  wire [7:0] sc2mac_dat_dst_data12;
  wire [7:0] sc2mac_dat_dst_data13;
  wire [7:0] sc2mac_dat_dst_data14;
  wire [7:0] sc2mac_dat_dst_data15;
  wire [7:0] sc2mac_dat_dst_data16;
  wire [7:0] sc2mac_dat_dst_data17;
  wire [7:0] sc2mac_dat_dst_data18;
  wire [7:0] sc2mac_dat_dst_data19;
  wire [7:0] sc2mac_dat_dst_data20;
  wire [7:0] sc2mac_dat_dst_data21;
  wire [7:0] sc2mac_dat_dst_data22;
  wire [7:0] sc2mac_dat_dst_data23;
  wire [7:0] sc2mac_dat_dst_data24;
  wire [7:0] sc2mac_dat_dst_data25;
  wire [7:0] sc2mac_dat_dst_data26;
  wire [7:0] sc2mac_dat_dst_data27;
  wire [7:0] sc2mac_dat_dst_data28;
  wire [7:0] sc2mac_dat_dst_data29;
  wire [7:0] sc2mac_dat_dst_data30;
  wire [7:0] sc2mac_dat_dst_data31;
  wire [7:0] sc2mac_dat_dst_data32;
  wire [7:0] sc2mac_dat_dst_data33;
  wire [7:0] sc2mac_dat_dst_data34;
  wire [7:0] sc2mac_dat_dst_data35;
  wire [7:0] sc2mac_dat_dst_data36;
  wire [7:0] sc2mac_dat_dst_data37;
  wire [7:0] sc2mac_dat_dst_data38;
  wire [7:0] sc2mac_dat_dst_data39;
  wire [7:0] sc2mac_dat_dst_data40;
  wire [7:0] sc2mac_dat_dst_data41;
  wire [7:0] sc2mac_dat_dst_data42;
  wire [7:0] sc2mac_dat_dst_data43;
  wire [7:0] sc2mac_dat_dst_data44;
  wire [7:0] sc2mac_dat_dst_data45;
  wire [7:0] sc2mac_dat_dst_data46;
  wire [7:0] sc2mac_dat_dst_data47;
  wire [7:0] sc2mac_dat_dst_data48;
  wire [7:0] sc2mac_dat_dst_data49;
  wire [7:0] sc2mac_dat_dst_data50;
  wire [7:0] sc2mac_dat_dst_data51;
  wire [7:0] sc2mac_dat_dst_data52;
  wire [7:0] sc2mac_dat_dst_data53;
  wire [7:0] sc2mac_dat_dst_data54;
  wire [7:0] sc2mac_dat_dst_data55;
  wire [7:0] sc2mac_dat_dst_data56;
  wire [7:0] sc2mac_dat_dst_data57;
  wire [7:0] sc2mac_dat_dst_data58;
  wire [7:0] sc2mac_dat_dst_data59;
  wire [7:0] sc2mac_dat_dst_data60;
  wire [7:0] sc2mac_dat_dst_data61;
  wire [7:0] sc2mac_dat_dst_data62;
  wire [7:0] sc2mac_dat_dst_data63;
  wire [7:0] sc2mac_dat_dst_data64;
  wire [7:0] sc2mac_dat_dst_data65;
  wire [7:0] sc2mac_dat_dst_data66;
  wire [7:0] sc2mac_dat_dst_data67;
  wire [7:0] sc2mac_dat_dst_data68;
  wire [7:0] sc2mac_dat_dst_data69;
  wire [7:0] sc2mac_dat_dst_data70;
  wire [7:0] sc2mac_dat_dst_data71;
  wire [7:0] sc2mac_dat_dst_data72;
  wire [7:0] sc2mac_dat_dst_data73;
  wire [7:0] sc2mac_dat_dst_data74;
  wire [7:0] sc2mac_dat_dst_data75;
  wire [7:0] sc2mac_dat_dst_data76;
  wire [7:0] sc2mac_dat_dst_data77;
  wire [7:0] sc2mac_dat_dst_data78;
  wire [7:0] sc2mac_dat_dst_data79;
  wire [7:0] sc2mac_dat_dst_data80;
  wire [7:0] sc2mac_dat_dst_data81;
  wire [7:0] sc2mac_dat_dst_data82;
  wire [7:0] sc2mac_dat_dst_data83;
  wire [7:0] sc2mac_dat_dst_data84;
  wire [7:0] sc2mac_dat_dst_data85;
  wire [7:0] sc2mac_dat_dst_data86;
  wire [7:0] sc2mac_dat_dst_data87;
  wire [7:0] sc2mac_dat_dst_data88;
  wire [7:0] sc2mac_dat_dst_data89;
  wire [7:0] sc2mac_dat_dst_data90;
  wire [7:0] sc2mac_dat_dst_data91;
  wire [7:0] sc2mac_dat_dst_data92;
  wire [7:0] sc2mac_dat_dst_data93;
  wire [7:0] sc2mac_dat_dst_data94;
  wire [7:0] sc2mac_dat_dst_data95;
  wire [7:0] sc2mac_dat_dst_data96;
  wire [7:0] sc2mac_dat_dst_data97;
  wire [7:0] sc2mac_dat_dst_data98;
  wire [7:0] sc2mac_dat_dst_data99;
  wire [7:0] sc2mac_dat_dst_data100;
  wire [7:0] sc2mac_dat_dst_data101;
  wire [7:0] sc2mac_dat_dst_data102;
  wire [7:0] sc2mac_dat_dst_data103;
  wire [7:0] sc2mac_dat_dst_data104;
  wire [7:0] sc2mac_dat_dst_data105;
  wire [7:0] sc2mac_dat_dst_data106;
  wire [7:0] sc2mac_dat_dst_data107;
  wire [7:0] sc2mac_dat_dst_data108;
  wire [7:0] sc2mac_dat_dst_data109;
  wire [7:0] sc2mac_dat_dst_data110;
  wire [7:0] sc2mac_dat_dst_data111;
  wire [7:0] sc2mac_dat_dst_data112;
  wire [7:0] sc2mac_dat_dst_data113;
  wire [7:0] sc2mac_dat_dst_data114;
  wire [7:0] sc2mac_dat_dst_data115;
  wire [7:0] sc2mac_dat_dst_data116;
  wire [7:0] sc2mac_dat_dst_data117;
  wire [7:0] sc2mac_dat_dst_data118;
  wire [7:0] sc2mac_dat_dst_data119;
  wire [7:0] sc2mac_dat_dst_data120;
  wire [7:0] sc2mac_dat_dst_data121;
  wire [7:0] sc2mac_dat_dst_data122;
  wire [7:0] sc2mac_dat_dst_data123;
  wire [7:0] sc2mac_dat_dst_data124;
  wire [7:0] sc2mac_dat_dst_data125;
  wire [7:0] sc2mac_dat_dst_data126;
  wire [7:0] sc2mac_dat_dst_data127;
  wire [8:0] sc2mac_dat_dst_pd;

  NV_NVDLA_RT_csc2cmac_b uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .sc2mac_wt_src_pvld(sc2mac_wt_src_pvld),
    .sc2mac_wt_src_mask(sc2mac_wt_src_mask),
    .sc2mac_wt_src_data0(sc2mac_wt_src_data0),
    .sc2mac_wt_src_data1(sc2mac_wt_src_data1),
    .sc2mac_wt_src_data2(sc2mac_wt_src_data2),
    .sc2mac_wt_src_data3(sc2mac_wt_src_data3),
    .sc2mac_wt_src_data4(sc2mac_wt_src_data4),
    .sc2mac_wt_src_data5(sc2mac_wt_src_data5),
    .sc2mac_wt_src_data6(sc2mac_wt_src_data6),
    .sc2mac_wt_src_data7(sc2mac_wt_src_data7),
    .sc2mac_wt_src_data8(sc2mac_wt_src_data8),
    .sc2mac_wt_src_data9(sc2mac_wt_src_data9),
    .sc2mac_wt_src_data10(sc2mac_wt_src_data10),
    .sc2mac_wt_src_data11(sc2mac_wt_src_data11),
    .sc2mac_wt_src_data12(sc2mac_wt_src_data12),
    .sc2mac_wt_src_data13(sc2mac_wt_src_data13),
    .sc2mac_wt_src_data14(sc2mac_wt_src_data14),
    .sc2mac_wt_src_data15(sc2mac_wt_src_data15),
    .sc2mac_wt_src_data16(sc2mac_wt_src_data16),
    .sc2mac_wt_src_data17(sc2mac_wt_src_data17),
    .sc2mac_wt_src_data18(sc2mac_wt_src_data18),
    .sc2mac_wt_src_data19(sc2mac_wt_src_data19),
    .sc2mac_wt_src_data20(sc2mac_wt_src_data20),
    .sc2mac_wt_src_data21(sc2mac_wt_src_data21),
    .sc2mac_wt_src_data22(sc2mac_wt_src_data22),
    .sc2mac_wt_src_data23(sc2mac_wt_src_data23),
    .sc2mac_wt_src_data24(sc2mac_wt_src_data24),
    .sc2mac_wt_src_data25(sc2mac_wt_src_data25),
    .sc2mac_wt_src_data26(sc2mac_wt_src_data26),
    .sc2mac_wt_src_data27(sc2mac_wt_src_data27),
    .sc2mac_wt_src_data28(sc2mac_wt_src_data28),
    .sc2mac_wt_src_data29(sc2mac_wt_src_data29),
    .sc2mac_wt_src_data30(sc2mac_wt_src_data30),
    .sc2mac_wt_src_data31(sc2mac_wt_src_data31),
    .sc2mac_wt_src_sel(sc2mac_wt_src_sel),
    .sc2mac_dat_src_pvld(sc2mac_dat_src_pvld),
    .sc2mac_dat_src_mask(sc2mac_dat_src_mask),
    .sc2mac_dat_src_data0(sc2mac_dat_src_data0),
    .sc2mac_dat_src_data1(sc2mac_dat_src_data1),
    .sc2mac_dat_src_data2(sc2mac_dat_src_data2),
    .sc2mac_dat_src_data3(sc2mac_dat_src_data3),
    .sc2mac_dat_src_data4(sc2mac_dat_src_data4),
    .sc2mac_dat_src_data5(sc2mac_dat_src_data5),
    .sc2mac_dat_src_data6(sc2mac_dat_src_data6),
    .sc2mac_dat_src_data7(sc2mac_dat_src_data7),
    .sc2mac_dat_src_data8(sc2mac_dat_src_data8),
    .sc2mac_dat_src_data9(sc2mac_dat_src_data9),
    .sc2mac_dat_src_data10(sc2mac_dat_src_data10),
    .sc2mac_dat_src_data11(sc2mac_dat_src_data11),
    .sc2mac_dat_src_data12(sc2mac_dat_src_data12),
    .sc2mac_dat_src_data13(sc2mac_dat_src_data13),
    .sc2mac_dat_src_data14(sc2mac_dat_src_data14),
    .sc2mac_dat_src_data15(sc2mac_dat_src_data15),
    .sc2mac_dat_src_data16(sc2mac_dat_src_data16),
    .sc2mac_dat_src_data17(sc2mac_dat_src_data17),
    .sc2mac_dat_src_data18(sc2mac_dat_src_data18),
    .sc2mac_dat_src_data19(sc2mac_dat_src_data19),
    .sc2mac_dat_src_data20(sc2mac_dat_src_data20),
    .sc2mac_dat_src_data21(sc2mac_dat_src_data21),
    .sc2mac_dat_src_data22(sc2mac_dat_src_data22),
    .sc2mac_dat_src_data23(sc2mac_dat_src_data23),
    .sc2mac_dat_src_data24(sc2mac_dat_src_data24),
    .sc2mac_dat_src_data25(sc2mac_dat_src_data25),
    .sc2mac_dat_src_data26(sc2mac_dat_src_data26),
    .sc2mac_dat_src_data27(sc2mac_dat_src_data27),
    .sc2mac_dat_src_data28(sc2mac_dat_src_data28),
    .sc2mac_dat_src_data29(sc2mac_dat_src_data29),
    .sc2mac_dat_src_data30(sc2mac_dat_src_data30),
    .sc2mac_dat_src_data31(sc2mac_dat_src_data31),
    .sc2mac_dat_src_data32(sc2mac_dat_src_data32),
    .sc2mac_dat_src_data33(sc2mac_dat_src_data33),
    .sc2mac_dat_src_data34(sc2mac_dat_src_data34),
    .sc2mac_dat_src_data35(sc2mac_dat_src_data35),
    .sc2mac_dat_src_data36(sc2mac_dat_src_data36),
    .sc2mac_dat_src_data37(sc2mac_dat_src_data37),
    .sc2mac_dat_src_data38(sc2mac_dat_src_data38),
    .sc2mac_dat_src_data39(sc2mac_dat_src_data39),
    .sc2mac_dat_src_data40(sc2mac_dat_src_data40),
    .sc2mac_dat_src_data41(sc2mac_dat_src_data41),
    .sc2mac_dat_src_data42(sc2mac_dat_src_data42),
    .sc2mac_dat_src_data43(sc2mac_dat_src_data43),
    .sc2mac_dat_src_data44(sc2mac_dat_src_data44),
    .sc2mac_dat_src_data45(sc2mac_dat_src_data45),
    .sc2mac_dat_src_data46(sc2mac_dat_src_data46),
    .sc2mac_dat_src_data47(sc2mac_dat_src_data47),
    .sc2mac_dat_src_data48(sc2mac_dat_src_data48),
    .sc2mac_dat_src_data49(sc2mac_dat_src_data49),
    .sc2mac_dat_src_data50(sc2mac_dat_src_data50),
    .sc2mac_dat_src_data51(sc2mac_dat_src_data51),
    .sc2mac_dat_src_data52(sc2mac_dat_src_data52),
    .sc2mac_dat_src_data53(sc2mac_dat_src_data53),
    .sc2mac_dat_src_data54(sc2mac_dat_src_data54),
    .sc2mac_dat_src_data55(sc2mac_dat_src_data55),
    .sc2mac_dat_src_data56(sc2mac_dat_src_data56),
    .sc2mac_dat_src_data57(sc2mac_dat_src_data57),
    .sc2mac_dat_src_data58(sc2mac_dat_src_data58),
    .sc2mac_dat_src_data59(sc2mac_dat_src_data59),
    .sc2mac_dat_src_data60(sc2mac_dat_src_data60),
    .sc2mac_dat_src_data61(sc2mac_dat_src_data61),
    .sc2mac_dat_src_data62(sc2mac_dat_src_data62),
    .sc2mac_dat_src_data63(sc2mac_dat_src_data63),
    .sc2mac_dat_src_pd(sc2mac_dat_src_pd),
    .sc2mac_wt_dst_pvld(sc2mac_wt_dst_pvld),
    .sc2mac_wt_dst_mask(sc2mac_wt_dst_mask),
    .sc2mac_wt_dst_data0(sc2mac_wt_dst_data0),
    .sc2mac_wt_dst_data1(sc2mac_wt_dst_data1),
    .sc2mac_wt_dst_data2(sc2mac_wt_dst_data2),
    .sc2mac_wt_dst_data3(sc2mac_wt_dst_data3),
    .sc2mac_wt_dst_data4(sc2mac_wt_dst_data4),
    .sc2mac_wt_dst_data5(sc2mac_wt_dst_data5),
    .sc2mac_wt_dst_data6(sc2mac_wt_dst_data6),
    .sc2mac_wt_dst_data7(sc2mac_wt_dst_data7),
    .sc2mac_wt_dst_data8(sc2mac_wt_dst_data8),
    .sc2mac_wt_dst_data9(sc2mac_wt_dst_data9),
    .sc2mac_wt_dst_data10(sc2mac_wt_dst_data10),
    .sc2mac_wt_dst_data11(sc2mac_wt_dst_data11),
    .sc2mac_wt_dst_data12(sc2mac_wt_dst_data12),
    .sc2mac_wt_dst_data13(sc2mac_wt_dst_data13),
    .sc2mac_wt_dst_data14(sc2mac_wt_dst_data14),
    .sc2mac_wt_dst_data15(sc2mac_wt_dst_data15),
    .sc2mac_wt_dst_data16(sc2mac_wt_dst_data16),
    .sc2mac_wt_dst_data17(sc2mac_wt_dst_data17),
    .sc2mac_wt_dst_data18(sc2mac_wt_dst_data18),
    .sc2mac_wt_dst_data19(sc2mac_wt_dst_data19),
    .sc2mac_wt_dst_data20(sc2mac_wt_dst_data20),
    .sc2mac_wt_dst_data21(sc2mac_wt_dst_data21),
    .sc2mac_wt_dst_data22(sc2mac_wt_dst_data22),
    .sc2mac_wt_dst_data23(sc2mac_wt_dst_data23),
    .sc2mac_wt_dst_data24(sc2mac_wt_dst_data24),
    .sc2mac_wt_dst_data25(sc2mac_wt_dst_data25),
    .sc2mac_wt_dst_data26(sc2mac_wt_dst_data26),
    .sc2mac_wt_dst_data27(sc2mac_wt_dst_data27),
    .sc2mac_wt_dst_data28(sc2mac_wt_dst_data28),
    .sc2mac_wt_dst_data29(sc2mac_wt_dst_data29),
    .sc2mac_wt_dst_data30(sc2mac_wt_dst_data30),
    .sc2mac_wt_dst_data31(sc2mac_wt_dst_data31),
    .sc2mac_wt_dst_data32(sc2mac_wt_dst_data32),
    .sc2mac_wt_dst_data33(sc2mac_wt_dst_data33),
    .sc2mac_wt_dst_data34(sc2mac_wt_dst_data34),
    .sc2mac_wt_dst_data35(sc2mac_wt_dst_data35),
    .sc2mac_wt_dst_data36(sc2mac_wt_dst_data36),
    .sc2mac_wt_dst_data37(sc2mac_wt_dst_data37),
    .sc2mac_wt_dst_data38(sc2mac_wt_dst_data38),
    .sc2mac_wt_dst_data39(sc2mac_wt_dst_data39),
    .sc2mac_wt_dst_data40(sc2mac_wt_dst_data40),
    .sc2mac_wt_dst_data41(sc2mac_wt_dst_data41),
    .sc2mac_wt_dst_data42(sc2mac_wt_dst_data42),
    .sc2mac_wt_dst_data43(sc2mac_wt_dst_data43),
    .sc2mac_wt_dst_data44(sc2mac_wt_dst_data44),
    .sc2mac_wt_dst_data45(sc2mac_wt_dst_data45),
    .sc2mac_wt_dst_data46(sc2mac_wt_dst_data46),
    .sc2mac_wt_dst_data47(sc2mac_wt_dst_data47),
    .sc2mac_wt_dst_data48(sc2mac_wt_dst_data48),
    .sc2mac_wt_dst_data49(sc2mac_wt_dst_data49),
    .sc2mac_wt_dst_data50(sc2mac_wt_dst_data50),
    .sc2mac_wt_dst_data51(sc2mac_wt_dst_data51),
    .sc2mac_wt_dst_data52(sc2mac_wt_dst_data52),
    .sc2mac_wt_dst_data53(sc2mac_wt_dst_data53),
    .sc2mac_wt_dst_data54(sc2mac_wt_dst_data54),
    .sc2mac_wt_dst_data55(sc2mac_wt_dst_data55),
    .sc2mac_wt_dst_data56(sc2mac_wt_dst_data56),
    .sc2mac_wt_dst_data57(sc2mac_wt_dst_data57),
    .sc2mac_wt_dst_data58(sc2mac_wt_dst_data58),
    .sc2mac_wt_dst_data59(sc2mac_wt_dst_data59),
    .sc2mac_wt_dst_data60(sc2mac_wt_dst_data60),
    .sc2mac_wt_dst_data61(sc2mac_wt_dst_data61),
    .sc2mac_wt_dst_data62(sc2mac_wt_dst_data62),
    .sc2mac_wt_dst_data63(sc2mac_wt_dst_data63),
    .sc2mac_wt_dst_data64(sc2mac_wt_dst_data64),
    .sc2mac_wt_dst_data65(sc2mac_wt_dst_data65),
    .sc2mac_wt_dst_data66(sc2mac_wt_dst_data66),
    .sc2mac_wt_dst_data67(sc2mac_wt_dst_data67),
    .sc2mac_wt_dst_data68(sc2mac_wt_dst_data68),
    .sc2mac_wt_dst_data69(sc2mac_wt_dst_data69),
    .sc2mac_wt_dst_data70(sc2mac_wt_dst_data70),
    .sc2mac_wt_dst_data71(sc2mac_wt_dst_data71),
    .sc2mac_wt_dst_data72(sc2mac_wt_dst_data72),
    .sc2mac_wt_dst_data73(sc2mac_wt_dst_data73),
    .sc2mac_wt_dst_data74(sc2mac_wt_dst_data74),
    .sc2mac_wt_dst_data75(sc2mac_wt_dst_data75),
    .sc2mac_wt_dst_data76(sc2mac_wt_dst_data76),
    .sc2mac_wt_dst_data77(sc2mac_wt_dst_data77),
    .sc2mac_wt_dst_data78(sc2mac_wt_dst_data78),
    .sc2mac_wt_dst_data79(sc2mac_wt_dst_data79),
    .sc2mac_wt_dst_data80(sc2mac_wt_dst_data80),
    .sc2mac_wt_dst_data81(sc2mac_wt_dst_data81),
    .sc2mac_wt_dst_data82(sc2mac_wt_dst_data82),
    .sc2mac_wt_dst_data83(sc2mac_wt_dst_data83),
    .sc2mac_wt_dst_data84(sc2mac_wt_dst_data84),
    .sc2mac_wt_dst_data85(sc2mac_wt_dst_data85),
    .sc2mac_wt_dst_data86(sc2mac_wt_dst_data86),
    .sc2mac_wt_dst_data87(sc2mac_wt_dst_data87),
    .sc2mac_wt_dst_data88(sc2mac_wt_dst_data88),
    .sc2mac_wt_dst_data89(sc2mac_wt_dst_data89),
    .sc2mac_wt_dst_data90(sc2mac_wt_dst_data90),
    .sc2mac_wt_dst_data91(sc2mac_wt_dst_data91),
    .sc2mac_wt_dst_data92(sc2mac_wt_dst_data92),
    .sc2mac_wt_dst_data93(sc2mac_wt_dst_data93),
    .sc2mac_wt_dst_data94(sc2mac_wt_dst_data94),
    .sc2mac_wt_dst_data95(sc2mac_wt_dst_data95),
    .sc2mac_wt_dst_data96(sc2mac_wt_dst_data96),
    .sc2mac_wt_dst_data97(sc2mac_wt_dst_data97),
    .sc2mac_wt_dst_data98(sc2mac_wt_dst_data98),
    .sc2mac_wt_dst_data99(sc2mac_wt_dst_data99),
    .sc2mac_wt_dst_data100(sc2mac_wt_dst_data100),
    .sc2mac_wt_dst_data101(sc2mac_wt_dst_data101),
    .sc2mac_wt_dst_data102(sc2mac_wt_dst_data102),
    .sc2mac_wt_dst_data103(sc2mac_wt_dst_data103),
    .sc2mac_wt_dst_data104(sc2mac_wt_dst_data104),
    .sc2mac_wt_dst_data105(sc2mac_wt_dst_data105),
    .sc2mac_wt_dst_data106(sc2mac_wt_dst_data106),
    .sc2mac_wt_dst_data107(sc2mac_wt_dst_data107),
    .sc2mac_wt_dst_data108(sc2mac_wt_dst_data108),
    .sc2mac_wt_dst_data109(sc2mac_wt_dst_data109),
    .sc2mac_wt_dst_data110(sc2mac_wt_dst_data110),
    .sc2mac_wt_dst_data111(sc2mac_wt_dst_data111),
    .sc2mac_wt_dst_data112(sc2mac_wt_dst_data112),
    .sc2mac_wt_dst_data113(sc2mac_wt_dst_data113),
    .sc2mac_wt_dst_data114(sc2mac_wt_dst_data114),
    .sc2mac_wt_dst_data115(sc2mac_wt_dst_data115),
    .sc2mac_wt_dst_data116(sc2mac_wt_dst_data116),
    .sc2mac_wt_dst_data117(sc2mac_wt_dst_data117),
    .sc2mac_wt_dst_data118(sc2mac_wt_dst_data118),
    .sc2mac_wt_dst_data119(sc2mac_wt_dst_data119),
    .sc2mac_wt_dst_data120(sc2mac_wt_dst_data120),
    .sc2mac_wt_dst_data121(sc2mac_wt_dst_data121),
    .sc2mac_wt_dst_data122(sc2mac_wt_dst_data122),
    .sc2mac_wt_dst_data123(sc2mac_wt_dst_data123),
    .sc2mac_wt_dst_data124(sc2mac_wt_dst_data124),
    .sc2mac_wt_dst_data125(sc2mac_wt_dst_data125),
    .sc2mac_wt_dst_data126(sc2mac_wt_dst_data126),
    .sc2mac_wt_dst_data127(sc2mac_wt_dst_data127),
    .sc2mac_dat_dst_pvld(sc2mac_dat_dst_pvld),
    .sc2mac_dat_dst_mask(sc2mac_dat_dst_mask),
    .sc2mac_dat_dst_data0(sc2mac_dat_dst_data0),
    .sc2mac_dat_dst_data1(sc2mac_dat_dst_data1),
    .sc2mac_dat_dst_data2(sc2mac_dat_dst_data2),
    .sc2mac_dat_dst_data3(sc2mac_dat_dst_data3),
    .sc2mac_dat_dst_data4(sc2mac_dat_dst_data4),
    .sc2mac_dat_dst_data5(sc2mac_dat_dst_data5),
    .sc2mac_dat_dst_data6(sc2mac_dat_dst_data6),
    .sc2mac_dat_dst_data7(sc2mac_dat_dst_data7),
    .sc2mac_dat_dst_data8(sc2mac_dat_dst_data8),
    .sc2mac_dat_dst_data9(sc2mac_dat_dst_data9),
    .sc2mac_dat_dst_data10(sc2mac_dat_dst_data10),
    .sc2mac_dat_dst_data11(sc2mac_dat_dst_data11),
    .sc2mac_dat_dst_data12(sc2mac_dat_dst_data12),
    .sc2mac_dat_dst_data13(sc2mac_dat_dst_data13),
    .sc2mac_dat_dst_data14(sc2mac_dat_dst_data14),
    .sc2mac_dat_dst_data15(sc2mac_dat_dst_data15),
    .sc2mac_dat_dst_data16(sc2mac_dat_dst_data16),
    .sc2mac_dat_dst_data17(sc2mac_dat_dst_data17),
    .sc2mac_dat_dst_data18(sc2mac_dat_dst_data18),
    .sc2mac_dat_dst_data19(sc2mac_dat_dst_data19),
    .sc2mac_dat_dst_data20(sc2mac_dat_dst_data20),
    .sc2mac_dat_dst_data21(sc2mac_dat_dst_data21),
    .sc2mac_dat_dst_data22(sc2mac_dat_dst_data22),
    .sc2mac_dat_dst_data23(sc2mac_dat_dst_data23),
    .sc2mac_dat_dst_data24(sc2mac_dat_dst_data24),
    .sc2mac_dat_dst_data25(sc2mac_dat_dst_data25),
    .sc2mac_dat_dst_data26(sc2mac_dat_dst_data26),
    .sc2mac_dat_dst_data27(sc2mac_dat_dst_data27),
    .sc2mac_dat_dst_data28(sc2mac_dat_dst_data28),
    .sc2mac_dat_dst_data29(sc2mac_dat_dst_data29),
    .sc2mac_dat_dst_data30(sc2mac_dat_dst_data30),
    .sc2mac_dat_dst_data31(sc2mac_dat_dst_data31),
    .sc2mac_dat_dst_data32(sc2mac_dat_dst_data32),
    .sc2mac_dat_dst_data33(sc2mac_dat_dst_data33),
    .sc2mac_dat_dst_data34(sc2mac_dat_dst_data34),
    .sc2mac_dat_dst_data35(sc2mac_dat_dst_data35),
    .sc2mac_dat_dst_data36(sc2mac_dat_dst_data36),
    .sc2mac_dat_dst_data37(sc2mac_dat_dst_data37),
    .sc2mac_dat_dst_data38(sc2mac_dat_dst_data38),
    .sc2mac_dat_dst_data39(sc2mac_dat_dst_data39),
    .sc2mac_dat_dst_data40(sc2mac_dat_dst_data40),
    .sc2mac_dat_dst_data41(sc2mac_dat_dst_data41),
    .sc2mac_dat_dst_data42(sc2mac_dat_dst_data42),
    .sc2mac_dat_dst_data43(sc2mac_dat_dst_data43),
    .sc2mac_dat_dst_data44(sc2mac_dat_dst_data44),
    .sc2mac_dat_dst_data45(sc2mac_dat_dst_data45),
    .sc2mac_dat_dst_data46(sc2mac_dat_dst_data46),
    .sc2mac_dat_dst_data47(sc2mac_dat_dst_data47),
    .sc2mac_dat_dst_data48(sc2mac_dat_dst_data48),
    .sc2mac_dat_dst_data49(sc2mac_dat_dst_data49),
    .sc2mac_dat_dst_data50(sc2mac_dat_dst_data50),
    .sc2mac_dat_dst_data51(sc2mac_dat_dst_data51),
    .sc2mac_dat_dst_data52(sc2mac_dat_dst_data52),
    .sc2mac_dat_dst_data53(sc2mac_dat_dst_data53),
    .sc2mac_dat_dst_data54(sc2mac_dat_dst_data54),
    .sc2mac_dat_dst_data55(sc2mac_dat_dst_data55),
    .sc2mac_dat_dst_data56(sc2mac_dat_dst_data56),
    .sc2mac_dat_dst_data57(sc2mac_dat_dst_data57),
    .sc2mac_dat_dst_data58(sc2mac_dat_dst_data58),
    .sc2mac_dat_dst_data59(sc2mac_dat_dst_data59),
    .sc2mac_dat_dst_data60(sc2mac_dat_dst_data60),
    .sc2mac_dat_dst_data61(sc2mac_dat_dst_data61),
    .sc2mac_dat_dst_data62(sc2mac_dat_dst_data62),
    .sc2mac_dat_dst_data63(sc2mac_dat_dst_data63),
    .sc2mac_dat_dst_data64(sc2mac_dat_dst_data64),
    .sc2mac_dat_dst_data65(sc2mac_dat_dst_data65),
    .sc2mac_dat_dst_data66(sc2mac_dat_dst_data66),
    .sc2mac_dat_dst_data67(sc2mac_dat_dst_data67),
    .sc2mac_dat_dst_data68(sc2mac_dat_dst_data68),
    .sc2mac_dat_dst_data69(sc2mac_dat_dst_data69),
    .sc2mac_dat_dst_data70(sc2mac_dat_dst_data70),
    .sc2mac_dat_dst_data71(sc2mac_dat_dst_data71),
    .sc2mac_dat_dst_data72(sc2mac_dat_dst_data72),
    .sc2mac_dat_dst_data73(sc2mac_dat_dst_data73),
    .sc2mac_dat_dst_data74(sc2mac_dat_dst_data74),
    .sc2mac_dat_dst_data75(sc2mac_dat_dst_data75),
    .sc2mac_dat_dst_data76(sc2mac_dat_dst_data76),
    .sc2mac_dat_dst_data77(sc2mac_dat_dst_data77),
    .sc2mac_dat_dst_data78(sc2mac_dat_dst_data78),
    .sc2mac_dat_dst_data79(sc2mac_dat_dst_data79),
    .sc2mac_dat_dst_data80(sc2mac_dat_dst_data80),
    .sc2mac_dat_dst_data81(sc2mac_dat_dst_data81),
    .sc2mac_dat_dst_data82(sc2mac_dat_dst_data82),
    .sc2mac_dat_dst_data83(sc2mac_dat_dst_data83),
    .sc2mac_dat_dst_data84(sc2mac_dat_dst_data84),
    .sc2mac_dat_dst_data85(sc2mac_dat_dst_data85),
    .sc2mac_dat_dst_data86(sc2mac_dat_dst_data86),
    .sc2mac_dat_dst_data87(sc2mac_dat_dst_data87),
    .sc2mac_dat_dst_data88(sc2mac_dat_dst_data88),
    .sc2mac_dat_dst_data89(sc2mac_dat_dst_data89),
    .sc2mac_dat_dst_data90(sc2mac_dat_dst_data90),
    .sc2mac_dat_dst_data91(sc2mac_dat_dst_data91),
    .sc2mac_dat_dst_data92(sc2mac_dat_dst_data92),
    .sc2mac_dat_dst_data93(sc2mac_dat_dst_data93),
    .sc2mac_dat_dst_data94(sc2mac_dat_dst_data94),
    .sc2mac_dat_dst_data95(sc2mac_dat_dst_data95),
    .sc2mac_dat_dst_data96(sc2mac_dat_dst_data96),
    .sc2mac_dat_dst_data97(sc2mac_dat_dst_data97),
    .sc2mac_dat_dst_data98(sc2mac_dat_dst_data98),
    .sc2mac_dat_dst_data99(sc2mac_dat_dst_data99),
    .sc2mac_dat_dst_data100(sc2mac_dat_dst_data100),
    .sc2mac_dat_dst_data101(sc2mac_dat_dst_data101),
    .sc2mac_dat_dst_data102(sc2mac_dat_dst_data102),
    .sc2mac_dat_dst_data103(sc2mac_dat_dst_data103),
    .sc2mac_dat_dst_data104(sc2mac_dat_dst_data104),
    .sc2mac_dat_dst_data105(sc2mac_dat_dst_data105),
    .sc2mac_dat_dst_data106(sc2mac_dat_dst_data106),
    .sc2mac_dat_dst_data107(sc2mac_dat_dst_data107),
    .sc2mac_dat_dst_data108(sc2mac_dat_dst_data108),
    .sc2mac_dat_dst_data109(sc2mac_dat_dst_data109),
    .sc2mac_dat_dst_data110(sc2mac_dat_dst_data110),
    .sc2mac_dat_dst_data111(sc2mac_dat_dst_data111),
    .sc2mac_dat_dst_data112(sc2mac_dat_dst_data112),
    .sc2mac_dat_dst_data113(sc2mac_dat_dst_data113),
    .sc2mac_dat_dst_data114(sc2mac_dat_dst_data114),
    .sc2mac_dat_dst_data115(sc2mac_dat_dst_data115),
    .sc2mac_dat_dst_data116(sc2mac_dat_dst_data116),
    .sc2mac_dat_dst_data117(sc2mac_dat_dst_data117),
    .sc2mac_dat_dst_data118(sc2mac_dat_dst_data118),
    .sc2mac_dat_dst_data119(sc2mac_dat_dst_data119),
    .sc2mac_dat_dst_data120(sc2mac_dat_dst_data120),
    .sc2mac_dat_dst_data121(sc2mac_dat_dst_data121),
    .sc2mac_dat_dst_data122(sc2mac_dat_dst_data122),
    .sc2mac_dat_dst_data123(sc2mac_dat_dst_data123),
    .sc2mac_dat_dst_data124(sc2mac_dat_dst_data124),
    .sc2mac_dat_dst_data125(sc2mac_dat_dst_data125),
    .sc2mac_dat_dst_data126(sc2mac_dat_dst_data126),
    .sc2mac_dat_dst_data127(sc2mac_dat_dst_data127),
    .sc2mac_dat_dst_pd(sc2mac_dat_dst_pd)
  );

  initial begin
    nvdla_core_clk = 0;
    nvdla_core_rstn = 0;
    sc2mac_wt_src_pvld = 0;
    sc2mac_dat_src_pvld = 0;
    #10 nvdla_core_rstn = 1; // Release reset

    // Test Case 1: Valid weight source
    sc2mac_wt_src_mask = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    sc2mac_wt_src_data0 = 8'hAA;
    sc2mac_wt_src_data1 = 8'hBB;
    sc2mac_wt_src_data2 = 8'hCC;
    sc2mac_wt_src_data3 = 8'hDD;
    sc2mac_wt_src_data4 = 8'hEE;
    sc2mac_wt_src_data5 = 8'hFF;
    sc2mac_wt_src_data6 = 8'h11;
    sc2mac_wt_src_data7 = 8'h22;
    sc2mac_wt_src_data8 = 8'h33;
    sc2mac_wt_src_data9 = 8'h44;
    sc2mac_wt_src_data10 = 8'h55;
    sc2mac_wt_src_data11 = 8'h66;
    sc2mac_wt_src_data12 = 8'h77;
    sc2mac_wt_src_data13 = 8'h88;
    sc2mac_wt_src_data14 = 8'h99;
    sc2mac_wt_src_data15 = 8'h00;
    sc2mac_wt_src_sel = 8'h01;
    sc2mac_wt_src_pvld = 1;
    #20;

    if (!uut.sc2mac_wt_dst_pvld) begin
      $display("FAIL: Weight destination valid signal not set");
      $finish;
    end

    // Check the output data
    if (uut.sc2mac_wt_dst_data0 !== 8'hAA) begin
      $display("FAIL: Unexpected data0");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data1 !== 8'hBB) begin
      $display("FAIL: Unexpected data1");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data2 !== 8'hCC) begin
      $display("FAIL: Unexpected data2");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data3 !== 8'hDD) begin
      $display("FAIL: Unexpected data3");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data4 !== 8'hEE) begin
      $display("FAIL: Unexpected data4");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data5 !== 8'hFF) begin
      $display("FAIL: Unexpected data5");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data6 !== 8'h11) begin
      $display("FAIL: Unexpected data6");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data7 !== 8'h22) begin
      $display("FAIL: Unexpected data7");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data8 !== 8'h33) begin
      $display("FAIL: Unexpected data8");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data9 !== 8'h44) begin
      $display("FAIL: Unexpected data9");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data10 !== 8'h55) begin
      $display("FAIL: Unexpected data10");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data11 !== 8'h66) begin
      $display("FAIL: Unexpected data11");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data12 !== 8'h77) begin
      $display("FAIL: Unexpected data12");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data13 !== 8'h88) begin
      $display("FAIL: Unexpected data13");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data14 !== 8'h99) begin
      $display("FAIL: Unexpected data14");
      $finish;
    end
    if (uut.sc2mac_wt_dst_data15 !== 8'h00) begin
      $display("FAIL: Unexpected data15");
      $finish;
    end

    // Test Case 2: Valid data source
    sc2mac_dat_src_mask = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    sc2mac_dat_src_data0 = 8'hFF;
    sc2mac_dat_src_data1 = 8'hEE;
    sc2mac_dat_src_data2 = 8'hDD;
    sc2mac_dat_src_data3 = 8'hCC;
    sc2mac_dat_src_data4 = 8'hBB;
    sc2mac_dat_src_data5 = 8'hAA;
    sc2mac_dat_src_data6 = 8'h99;
    sc2mac_dat_src_data7 = 8'h88;
    sc2mac_dat_src_data8 = 8'h77;
    sc2mac_dat_src_data9 = 8'h66;
    sc2mac_dat_src_data10 = 8'h55;
    sc2mac_dat_src_data11 = 8'h44;
    sc2mac_dat_src_data12 = 8'h33;
    sc2mac_dat_src_data13 = 8'h22;
    sc2mac_dat_src_data14 = 8'h11;
    sc2mac_dat_src_data15 = 8'h00;
    sc2mac_dat_src_pvld = 1;
    #20;

    if (!uut.sc2mac_dat_dst_pvld) begin
      $display("FAIL: Data destination valid signal not set");
      $finish;
    end

    // Check the output data
    if (uut.sc2mac_dat_dst_data0 !== 8'hFF) begin
      $display("FAIL: Unexpected data0");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data1 !== 8'hEE) begin
      $display("FAIL: Unexpected data1");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data2 !== 8'hDD) begin
      $display("FAIL: Unexpected data2");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data3 !== 8'hCC) begin
      $display("FAIL: Unexpected data3");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data4 !== 8'hBB) begin
      $display("FAIL: Unexpected data4");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data5 !== 8'hAA) begin
      $display("FAIL: Unexpected data5");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data6 !== 8'h99) begin
      $display("FAIL: Unexpected data6");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data7 !== 8'h88) begin
      $display("FAIL: Unexpected data7");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data8 !== 8'h77) begin
      $display("FAIL: Unexpected data8");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data9 !== 8'h66) begin
      $display("FAIL: Unexpected data9");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data10 !== 8'h55) begin
      $display("FAIL: Unexpected data10");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data11 !== 8'h44) begin
      $display("FAIL: Unexpected data11");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data12 !== 8'h33) begin
      $display("FAIL: Unexpected data12");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data13 !== 8'h22) begin
      $display("FAIL: Unexpected data13");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data14 !== 8'h11) begin
      $display("FAIL: Unexpected data14");
      $finish;
    end
    if (uut.sc2mac_dat_dst_data15 !== 8'h00) begin
      $display("FAIL: Unexpected data15");
      $finish;
    end

    $display("PASS");
    $finish;
  end

  always #5 nvdla_core_clk = ~nvdla_core_clk; // Clock generation

endmodule