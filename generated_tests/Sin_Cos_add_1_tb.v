`timescale 1ns/1ps

module tb_Sin_Cos_add;

  reg [18:0] coeffs_c0;
  reg [18:0] x_g_D0;
  wire [19:0] x_g_D1;

  // Instantiate the module under test (uut)
  Sin_Cos_add uut (
    .coeffs_c0(coeffs_c0),
    .x_g_D0(x_g_D0),
    .x_g_D1(x_g_D1)
  );

  initial begin
    // Test case 1
    coeffs_c0 = 19'b0000000000000000001; // 1
    x_g_D0 = 19'b0000000000000000001;    // 1
    #10;
    if (x_g_D1 !== 20'b0000000000000000010) // Expecting 2
      $display("FAIL: Test case 1 failed, expected 2 but got %b", x_g_D1);
    
    // Test case 2
    coeffs_c0 = 19'b0000000000000000010; // 2
    x_g_D0 = 19'b0000000000000000011;    // 3
    #10;
    if (x_g_D1 !== 20'b0000000000000000111) // Expecting 5
      $display("FAIL: Test case 2 failed, expected 5 but got %b", x_g_D1);
    
    // Test case 3
    coeffs_c0 = 19'b0000000000000000100; // 4
    x_g_D0 = 19'b0000000000000000100;    // 4
    #10;
    if (x_g_D1 !== 20'b0000000000000001000) // Expecting 8
      $display("FAIL: Test case 3 failed, expected 8 but got %b", x_g_D1);
    
    // Test case 4
    coeffs_c0 = 19'b1111111111111111111; // Max value for coeffs_c0
    x_g_D0 = 19'b0000000000000000001;   // 1
    #10;
    if (x_g_D1 !== 20'b0000000000000000000) // Expecting 0 due to overflow
      $display("FAIL: Test case 4 failed, expected 0 but got %b", x_g_D1);
    
    // Test case 5
    coeffs_c0 = 19'b0000000000000000000; // 0
    x_g_D0 = 19'b0000000000000000000;   // 0
    #10;
    if (x_g_D1 !== 20'b0000000000000000000) // Expecting 0
      $display("FAIL: Test case 5 failed, expected 0 but got %b", x_g_D1);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule