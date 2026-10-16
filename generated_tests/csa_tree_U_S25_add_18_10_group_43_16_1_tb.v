`timescale 1ns/1ps

module tb_csa_tree_U_S25_add_18_10_group_43_16;

  // Inputs
  reg [11:0] in_0;
  reg [13:0] in_1;
  reg [15:0] in_2;
  reg [15:0] in_3;

  // Outputs
  wire [15:0] out_0;

  // Instantiate the Unit Under Test (UUT)
  csa_tree_U_S25_add_18_10_group_43_16 uut (
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .out_0(out_0)
  );

  // Test sequence
  initial begin
    // Test case 1
    in_0 = 12'h0A; // 10
    in_1 = 14'h1E; // 30
    in_2 = 16'h000F; // 15
    in_3 = 16'h0001; // 1
    #10; // Wait for output
    if (out_0 !== 16'h002F) $display("FAIL: Test case 1 failed, expected 0x002F, got 0x%04h", out_0);

    // Test case 2
    in_0 = 12'hFFF; // 4095
    in_1 = 14'h3FFF; // 16383
    in_2 = 16'hFFFF; // 65535
    in_3 = 16'h0000; // 0
    #10; // Wait for output
    if (out_0 !== 16'hFFFF) $display("FAIL: Test case 2 failed, expected 0xFFFF, got 0x%04h", out_0);

    // Test case 3
    in_0 = 12'h000; // 0
    in_1 = 14'h000; // 0
    in_2 = 16'h0000; // 0
    in_3 = 16'h0000; // 0
    #10; // Wait for output
    if (out_0 !== 16'h0000) $display("FAIL: Test case 3 failed, expected 0x0000, got 0x%04h", out_0);

    // Test case 4
    in_0 = 12'h123; // 291
    in_1 = 14'h456; // 1110
    in_2 = 16'h789A; // 30874
    in_3 = 16'hBCDE; // 48350
    #10; // Wait for output
    if (out_0 !== 16'hBCDE) $display("FAIL: Test case 4 failed, expected 0xBCDE, got 0x%04h", out_0);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule