`timescale 1ns/1ps

module tb_CDN_mux4;
  reg sel0, data0, sel1, data1, sel2, data2, sel3, data3;
  wire z;

  // Instantiate the module under test (uut)
  CDN_mux4 uut (
    .sel0(sel0),
    .data0(data0),
    .sel1(sel1),
    .data1(data1),
    .sel2(sel2),
    .data2(data2),
    .sel3(sel3),
    .data3(data3),
    .z(z)
  );

  initial begin
    // Test case 1: Select data0
    sel0 = 1; sel1 = 0; sel2 = 0; sel3 = 0; data0 = 1; data1 = 0; data2 = 0; data3 = 0;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Expected z = 1'b1, got z = %b", z);
      $finish;
    end

    // Test case 2: Select data1
    sel0 = 0; sel1 = 1; sel2 = 0; sel3 = 0; data0 = 0; data1 = 1; data2 = 0; data3 = 0;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Expected z = 1'b1, got z = %b", z);
      $finish;
    end

    // Test case 3: Select data2
    sel0 = 0; sel1 = 0; sel2 = 1; sel3 = 0; data0 = 0; data1 = 0; data2 = 1; data3 = 0;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Expected z = 1'b1, got z = %b", z);
      $finish;
    end

    // Test case 4: Select data3
    sel0 = 0; sel1 = 0; sel2 = 0; sel3 = 1; data0 = 0; data1 = 0; data2 = 0; data3 = 1;
    #10;
    if (z !== 1'b1) begin
      $display("FAIL: Expected z = 1'b1, got z = %b", z);
      $finish;
    end

    // Test case 5: No valid selection (all selects low)
    sel0 = 0; sel1 = 0; sel2 = 0; sel3 = 0; data0 = 0; data1 = 0; data2 = 0; data3 = 0;
    #10;
    if (z !== 1'bX) begin
      $display("FAIL: Expected z = 1'bX, got z = %b", z);
      $finish;
    end

    // Test case 6: Invalid selection (multiple selects high)
    sel0 = 1; sel1 = 1; sel2 = 0; sel3 = 0; data0 = 1; data1 = 0; data2 = 0; data3 = 0;
    #10;
    if (z !== 1'bX) begin
      $display("FAIL: Expected z = 1'bX, got z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule