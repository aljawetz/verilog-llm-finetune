`timescale 1ns/1ps

module tb_rvrs_unit;

  reg [31:0] deger_i;
  wire [31:0] rvrs_sonuc;

  // Instantiate the module under test (uut)
  rvrs_unit uut (
    .deger_i(deger_i),
    .rvrs_sonuc(rvrs_sonuc)
  );

  initial begin
    // Test case 1: Input is 0xAABBCCDD
    deger_i = 32'hAABBCCDD;
    #10;
    if (rvrs_sonuc !== 32'hDDCCBBAA) begin
      $display("FAIL: Test case 1 failed. Expected 0xDDCCBBAA, got 0x%h", rvrs_sonuc);
      $finish;
    end

    // Test case 2: Input is 0x12345678
    deger_i = 32'h12345678;
    #10;
    if (rvrs_sonuc !== 32'h78563412) begin
      $display("FAIL: Test case 2 failed. Expected 0x78563412, got 0x%h", rvrs_sonuc);
      $finish;
    end

    // Test case 3: Input is 0xFFFFFFFF
    deger_i = 32'hFFFFFFFF;
    #10;
    if (rvrs_sonuc !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 3 failed. Expected 0xFFFFFFFF, got 0x%h", rvrs_sonuc);
      $finish;
    end

    // Test case 4: Input is 0x00000000
    deger_i = 32'h00000000;
    #10;
    if (rvrs_sonuc !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed. Expected 0x00000000, got 0x%h", rvrs_sonuc);
      $finish;
    end

    // Test case 5: Input is 0x89ABCDEF
    deger_i = 32'h89ABCDEF;
    #10;
    if (rvrs_sonuc !== 32'hEFCDAB89) begin
      $display("FAIL: Test case 5 failed. Expected 0xEFCDAB89, got 0x%h", rvrs_sonuc);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule