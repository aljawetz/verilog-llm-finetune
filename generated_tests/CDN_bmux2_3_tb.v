`timescale 1ns/1ps

module tb_CDN_bmux2;

  // Inputs
  reg sel0;
  reg data0;
  reg data1;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  CDN_bmux2 uut (
    .sel0(sel0), 
    .data0(data0), 
    .data1(data1), 
    .z(z)
  );

  initial begin
    // Test case 1: sel0 = 0, expect z = data0
    data0 = 1'b0; data1 = 1'b1; sel0 = 1'b0;
    #10;
    if (z !== data0) begin
      $display("FAIL: Test case 1 failed, expected z = %b, got z = %b", data0, z);
      $finish;
    end

    // Test case 2: sel0 = 1, expect z = data1
    data0 = 1'b0; data1 = 1'b1; sel0 = 1'b1;
    #10;
    if (z !== data1) begin
      $display("FAIL: Test case 2 failed, expected z = %b, got z = %b", data1, z);
      $finish;
    end

    // Test case 3: sel0 = 0, data0 = 1, data1 = 0, expect z = data0
    data0 = 1'b1; data1 = 1'b0; sel0 = 1'b0;
    #10;
    if (z !== data0) begin
      $display("FAIL: Test case 3 failed, expected z = %b, got z = %b", data0, z);
      $finish;
    end

    // Test case 4: sel0 = 1, data0 = 1, data1 = 0, expect z = data1
    data0 = 1'b1; data1 = 1'b0; sel0 = 1'b1;
    #10;
    if (z !== data1) begin
      $display("FAIL: Test case 4 failed, expected z = %b, got z = %b", data1, z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule