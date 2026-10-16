`timescale 1ns/1ps

module tb_Sin_Cos_mul;

reg [11:0] coeffs_c1;
reg [13:0] x_g_B;
wire [18:0] x_g_D0;

Sin_Cos_mul uut (
    .coeffs_c1(coeffs_c1),
    .x_g_B(x_g_B),
    .x_g_D0(x_g_D0)
);

initial begin
    // Test case 1: Simple multiplication
    coeffs_c1 = 12'd1; // Coefficient 1
    x_g_B = 14'd1;     // Input 1
    #10;
    if (x_g_D0 !== 19'd0) $display("FAIL: Test case 1 failed, expected 0, got %d", x_g_D0);

    // Test case 2: Coefficient 2, Input 2
    coeffs_c1 = 12'd2; // Coefficient 2
    x_g_B = 14'd2;     // Input 2
    #10;
    if (x_g_D0 !== 19'd0) $display("FAIL: Test case 2 failed, expected 0, got %d", x_g_D0);

    // Test case 3: Maximum values
    coeffs_c1 = 12'd4095; // Max 12-bit value
    x_g_B = 14'd16383;    // Max 14-bit value
    #10;
    if (x_g_D0 !== 19'd0) $display("FAIL: Test case 3 failed, expected 0, got %d", x_g_D0);

    // Test case 4: Random values
    coeffs_c1 = 12'd1234; // Random coefficient
    x_g_B = 14'd5678;     // Random input
    #10;
    if (x_g_D0 !== (coeffs_c1 * x_g_B >> 7)) $display("FAIL: Test case 4 failed, expected %d, got %d", (coeffs_c1 * x_g_B >> 7), x_g_D0);

    // Test case 5: Zero input
    coeffs_c1 = 12'd1000; // Coefficient
    x_g_B = 14'd0;        // Zero input
    #10;
    if (x_g_D0 !== 19'd0) $display("FAIL: Test case 5 failed, expected 0, got %d", x_g_D0);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule