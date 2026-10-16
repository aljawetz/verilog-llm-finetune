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

  // Instantiate the module under test
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
    // Initialize inputs
    {sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7, sel8, sel9,
     sel10, sel11, sel12, sel13, sel14, sel15, sel16, sel17, sel18,
     sel19, sel20, sel21, sel22, sel23, sel24} = 25'b0;

    {data0, data1, data2, data3, data4, data5, data6, data7, data8,
     data9, data10, data11, data12, data13, data14, data15, data16,
     data17, data18, data19, data20, data21, data22, data23, data24} = 25'b0;

    // Test case 1: Select data0
    sel0 = 1; data0 = 1'b1; #10;
    if (z !== 1'b1) $display("FAIL: Expected z = 1'b1 when sel0 is selected");

    // Test case 2: Select data1
    sel0 = 0; sel1 = 1; data1 = 1'b0; #10;
    if (z !== 1'b0) $display("FAIL: Expected z = 1'b0 when sel1 is selected");

    // Test case 3: Select data2
    sel1 = 0; sel2 = 1; data2 = 1'b1; #10;
    if (z !== 1'b1) $display("FAIL: Expected z = 1'b1 when sel2 is selected");

    // Test case 4: Select data3
    sel2 = 0; sel3 = 1; data3 = 1'b0; #10;
    if (z !== 1'b0) $display("FAIL: Expected z = 1'b0 when sel3 is selected");

    // Test case 5: Select data4
    sel3 = 0; sel4 = 1; data4 = 1'b1; #10;
    if (z !== 1'b1) $display("FAIL: Expected z = 1'b1 when sel4 is selected");

    // Test case 6: Select data24
    sel4 = 0; sel24 = 1; data24 = 1'b1; #10;
    if (z !== 1'b1) $display("FAIL: Expected z = 1'b1 when sel24 is selected");

    // Test case 7: No selection (default case)
    {sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7, sel8, sel9,
     sel10, sel11, sel12, sel13, sel14, sel15, sel16, sel17, sel18,
     sel19, sel20, sel21, sel22, sel23, sel24} = 25'b0; #10;
    if (z !== 1'bX) $display("FAIL: Expected z = 1'bX when no selection is made");

    $display("PASS");
    $finish;
  end

endmodule