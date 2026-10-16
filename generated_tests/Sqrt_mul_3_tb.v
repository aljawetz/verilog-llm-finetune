`timescale 1ns/1ps

module tb_Sqrt_mul;

  reg [11:0] coeffs_Sqrt;
  reg [30:0] x_f_B;
  wire [19:0] x_f_D0;

  // Instantiate the module under test
  Sqrt_mul uut (
    .coeffs_Sqrt(coeffs_Sqrt),
    .x_f_B(x_f_B),
    .x_f_D0(x_f_D0)
  );

  initial begin
    // Test case 1
    coeffs_Sqrt = 12'd1; // Coefficient = 1
    x_f_B = 30'd1;       // Input = 1
    #10;
    if (x_f_D0 !== 20'd0) $display("FAIL: Test case 1 failed, expected 0, got %d", x_f_D0);

    // Test case 2
    coeffs_Sqrt = 12'd2; // Coefficient = 2
    x_f_B = 30'd2;       // Input = 2
    #10;
    if (x_f_D0 !== 20'd0) $display("FAIL: Test case 2 failed, expected 0, got %d", x_f_D0);

    // Test case 3
    coeffs_Sqrt = 12'd4096; // Coefficient = 4096 (2^12)
    x_f_B = 30'd1;          // Input = 1
    #10;
    if (x_f_D0 !== 20'd4096) $display("FAIL: Test case 3 failed, expected 4096, got %d", x_f_D0);

    // Test case 4
    coeffs_Sqrt = 12'd2048; // Coefficient = 2048 (2^11)
    x_f_B = 30'd2;          // Input = 2
    #10;
    if (x_f_D0 !== 20'd4096) $display("FAIL: Test case 4 failed, expected 4096, got %d", x_f_D0);

    // Test case 5
    coeffs_Sqrt = 12'd4095; // Coefficient = 4095
    x_f_B = 30'd3;          // Input = 3
    #10;
    if (x_f_D0 !== 20'd12285) $display("FAIL: Test case 5 failed, expected 12285, got %d", x_f_D0);

    // Test case 6
    coeffs_Sqrt = 12'd0;    // Coefficient = 0
    x_f_B = 30'd100;        // Input = 100
    #10;
    if (x_f_D0 !== 20'd0) $display("FAIL: Test case 6 failed, expected 0, got %d", x_f_D0);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule