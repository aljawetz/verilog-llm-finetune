`timescale 1ns/1ps

module tb_CDN_mux25;

  reg sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  reg sel4, data4, sel5, data5, sel6, data6, sel7, data7;
  reg sel8, data8, sel9, data9, sel10, data10, sel11, data11;
  reg sel12, data12, sel13, data13, sel14, data14, sel15, data15;
  reg sel16, data16, sel17, data17, sel18, data18, sel19, data19;
  reg sel20, data20, sel21, data21, sel22, data22, sel23, data23;
  reg sel24, data24;
  wire z;

  CDN_mux25 uut (
    .sel0(sel0), .data0(data0), .sel1(sel1), .data1(data1),
    .sel2(sel2), .data2(data2), .sel3(sel3), .data3(data3),
    .sel4(sel4), .data4(data4), .sel5(sel5), .data5(data5),
    .sel6(sel6), .data6(data6), .sel7(sel7), .data7(data7),
    .sel8(sel8), .data8(data8), .sel9(sel9), .data9(data9),
    .sel10(sel10), .data10(data10), .sel11(sel11), .data11(data11),
    .sel12(sel12), .data12(data12), .sel13(sel13), .data13(data13),
    .sel14(sel14), .data14(data14), .sel15(sel15), .data15(data15),
    .sel16(sel16), .data16(data16), .sel17(sel17), .data17(data17),
    .sel18(sel18), .data18(data18), .sel19(sel19), .data19(data19),
    .sel20(sel20), .data20(data20), .sel21(sel21), .data21(data21),
    .sel22(sel22), .data22(data22), .sel23(sel23), .data23(data23),
    .sel24(sel24), .data24(data24), .z(z)
  );

  initial begin
    // Test case 1: Select data0
    sel0 = 1; data0 = 1; sel1 = 0; data1 = 0; sel2 = 0; data2 = 0; 
    sel3 = 0; data3 = 0; sel4 = 0; data4 = 0; sel5 = 0; data5 = 0; 
    sel6 = 0; data6 = 0; sel7 = 0; data7 = 0; sel8 = 0; data8 = 0; 
    sel9 = 0; data9 = 0; sel10 = 0; data10 = 0; sel11 = 0; data11 = 0; 
    sel12 = 0; data12 = 0; sel13 = 0; data13 = 0; sel14 = 0; data14 = 0; 
    sel15 = 0; data15 = 0; sel16 = 0; data16 = 0; sel17 = 0; data17 = 0; 
    sel18 = 0; data18 = 0; sel19 = 0; data19 = 0; sel20 = 0; data20 = 0; 
    sel21 = 0; data21 = 0; sel22 = 0; data22 = 0; sel23 = 0; data23 = 0; 
    sel24 = 0; data24 = 0; 
    #10;
    if (z !== data0) begin
      $display("FAIL: Expected z = %b, got z = %b", data0, z);
      $finish;
    end

    // Test case 2: Select data1
    sel0 = 0; data0 = 0; sel1 = 1; data1 = 1; sel2 = 0; data2 = 0; 
    sel3 = 0; data3 = 0; sel4 = 0; data4 = 0; sel5 = 0; data5 = 0; 
    sel6 = 0; data6 = 0; sel7 = 0; data7 = 0; sel8 = 0; data8 = 0; 
    sel9 = 0; data9 = 0; sel10 = 0; data10 = 0; sel11 = 0; data11 = 0; 
    sel12 = 0; data12 = 0; sel13 = 0; data13 = 0; sel14 = 0; data14 = 0; 
    sel15 = 0; data15 = 0; sel16 = 0; data16 = 0; sel17 = 0; data17 = 0; 
    sel18 = 0; data18 = 0; sel19 = 0; data19 = 0; sel20 = 0; data20 = 0; 
    sel21 = 0; data21 = 0; sel22 = 0; data22 = 0; sel23 = 0; data23 = 0; 
    sel24 = 0; data24 = 0; 
    #10;
    if (z !== data1) begin
      $display("FAIL: Expected z = %b, got z = %b", data1, z);
      $finish;
    end

    // Test case 3: Select data24
    sel0 = 0; data0 = 0; sel1 = 0; data1 = 0; sel2 = 0; data2 = 0; 
    sel3 = 0; data3 = 0; sel4 = 0; data4 = 0; sel5 = 0; data5 = 0; 
    sel6 = 0; data6 = 0; sel7 = 0; data7 = 0; sel8 = 0; data8 = 0; 
    sel9 = 0; data9 = 0; sel10 = 0; data10 = 0; sel11 = 0; data11 = 0; 
    sel12 = 0; data12 = 0; sel13 = 0; data13 = 0; sel14 = 0; data14 = 0; 
    sel15 = 0; data15 = 0; sel16 = 0; data16 = 0; sel17 = 0; data17 = 0; 
    sel18 = 0; data18 = 0; sel19 = 0; data19 = 0; sel20 = 0; data20 = 0; 
    sel21 = 0; data21 = 0; sel22 = 0; data22 = 0; sel23 = 0; data23 = 0; 
    sel24 = 1; data24 = 1; 
    #10;
    if (z !== data24) begin
      $display("FAIL: Expected z = %b, got z = %b", data24, z);
      $finish;
    end

    // Test case 4: Select data5
    sel0 = 0; data0 = 0; sel1 = 0; data1 = 0; sel2 = 0; data2 = 0; 
    sel3 = 0; data3 = 0; sel4 = 0; data4 = 0; sel5 = 1; data5 = 1; 
    sel6 = 0; data6 = 0; sel7 = 0; data7 = 0; sel8 = 0; data8 = 0; 
    sel9 = 0; data9 = 0; sel10 = 0; data10 = 0; sel11 = 0; data11 = 0; 
    sel12 = 0; data12 = 0; sel13 = 0; data13 = 0; sel14 = 0; data14 = 0; 
    sel15 = 0; data15 = 0; sel16 = 0; data16 = 0; sel17 = 0; data17 = 0; 
    sel18 = 0; data18 = 0; sel19 = 0; data19 = 0; sel20 = 0; data20 = 0; 
    sel21 = 0; data21 = 0; sel22 = 0; data22 = 0; sel23 = 0; data23 = 0; 
    sel24 = 0; data24 = 0; 
    #10;
    if (z !== data5) begin
      $display("FAIL: Expected z = %b, got z = %b", data5, z);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule