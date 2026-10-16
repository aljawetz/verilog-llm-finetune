`timescale 1ns/1ps

module tb_tq_ht2x2;

  reg [14:0] ht_s00_i;
  reg [14:0] ht_s01_i;
  reg [14:0] ht_s10_i;
  reg [14:0] ht_s11_i;
  wire [14:0] ht_d00_o;
  wire [14:0] ht_d01_o;
  wire [14:0] ht_d10_o;
  wire [14:0] ht_d11_o;

  tq_ht2x2 uut (
    .ht_s00_i(ht_s00_i),
    .ht_s01_i(ht_s01_i),
    .ht_s10_i(ht_s10_i),
    .ht_s11_i(ht_s11_i),
    .ht_d00_o(ht_d00_o),
    .ht_d01_o(ht_d01_o),
    .ht_d10_o(ht_d10_o),
    .ht_d11_o(ht_d11_o)
  );

  initial begin
    // Test case 1
    ht_s00_i = 15'd5;   // 0000 0000 0000 0101
    ht_s01_i = 15'd3;   // 0000 0000 0000 0011
    ht_s10_i = 15'd2;   // 0000 0000 0000 0010
    ht_s11_i = 15'd1;   // 0000 0000 0000 0001
    #10;

    if (ht_d00_o !== 15'd11) $display("FAIL: Test case 1, ht_d00_o expected 11, got %d", ht_d00_o);
    if (ht_d01_o !== 15'd8)  $display("FAIL: Test case 1, ht_d01_o expected 8, got %d", ht_d01_o);
    if (ht_d10_o !== 15'd6)  $display("FAIL: Test case 1, ht_d10_o expected 6, got %d", ht_d10_o);
    if (ht_d11_o !== 15'd5)  $display("FAIL: Test case 1, ht_d11_o expected 5, got %d", ht_d11_o);

    // Test case 2
    ht_s00_i = 15'd10;  // 0000 0000 0000 1010
    ht_s01_i = 15'd5;   // 0000 0000 0000 0101
    ht_s10_i = 15'd7;   // 0000 0000 0000 0111
    ht_s11_i = 15'd2;   // 0000 0000 0000 0010
    #10;

    if (ht_d00_o !== 15'd24) $display("FAIL: Test case 2, ht_d00_o expected 24, got %d", ht_d00_o);
    if (ht_d01_o !== 15'd20) $display("FAIL: Test case 2, ht_d01_o expected 20, got %d", ht_d01_o);
    if (ht_d10_o !== 15'd15) $display("FAIL: Test case 2, ht_d10_o expected 15, got %d", ht_d10_o);
    if (ht_d11_o !== 15'd12) $display("FAIL: Test case 2, ht_d11_o expected 12, got %d", ht_d11_o);

    // Test case 3
    ht_s00_i = 15'd0;   // 0000 0000 0000 0000
    ht_s01_i = 15'd0;   // 0000 0000 0000 0000
    ht_s10_i = 15'd0;   // 0000 0000 0000 0000
    ht_s11_i = 15'd0;   // 0000 0000 0000 0000
    #10;

    if (ht_d00_o !== 15'd0) $display("FAIL: Test case 3, ht_d00_o expected 0, got %d", ht_d00_o);
    if (ht_d01_o !== 15'd0) $display("FAIL: Test case 3, ht_d01_o expected 0, got %d", ht_d01_o);
    if (ht_d10_o !== 15'd0) $display("FAIL: Test case 3, ht_d10_o expected 0, got %d", ht_d10_o);
    if (ht_d11_o !== 15'd0) $display("FAIL: Test case 3, ht_d11_o expected 0, got %d", ht_d11_o);

    $display("PASS");
    $finish;
  end

endmodule