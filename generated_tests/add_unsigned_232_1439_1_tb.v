`timescale 1ns/1ps

module tb_add_unsigned_232_1439;

  reg [12:0] A;
  reg [12:0] B;
  wire [13:0] Z;

  // Instantiate the module under test
  add_unsigned_232_1439 uut (
    .A(A),
    .B(B),
    .Z(Z)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    A = 12'd0; B = 12'd0;
    #10;
    if (Z !== 14'd0) $display("FAIL: Test case 1 failed (0 + 0)");

    // Test case 2: 1 + 1 = 2
    A = 12'd1; B = 12'd1;
    #10;
    if (Z !== 14'd2) $display("FAIL: Test case 2 failed (1 + 1)");

    // Test case 3: 4095 + 4095 = 8190
    A = 12'd4095; B = 12'd4095;
    #10;
    if (Z !== 14'd8190) $display("FAIL: Test case 3 failed (4095 + 4095)");

    // Test case 4: 4095 + 1 = 4096
    A = 12'd4095; B = 12'd1;
    #10;
    if (Z !== 14'd4096) $display("FAIL: Test case 4 failed (4095 + 1)");

    // Test case 5: 2048 + 2048 = 4096
    A = 12'd2048; B = 12'd2048;
    #10;
    if (Z !== 14'd4096) $display("FAIL: Test case 5 failed (2048 + 2048)");

    // Test case 6: 1234 + 5678 = 6912
    A = 12'd1234; B = 12'd5678;
    #10;
    if (Z !== 14'd6912) $display("FAIL: Test case 6 failed (1234 + 5678)");

    // Test case 7: 4095 + 4096 = 8191 (overflow case)
    A = 12'd4095; B = 12'd4096;
    #10;
    if (Z !== 14'd8191) $display("FAIL: Test case 7 failed (4095 + 4096)");

    // Test case 8: 0 + 4095 = 4095
    A = 12'd0; B = 12'd4095;
    #10;
    if (Z !== 14'd4095) $display("FAIL: Test case 8 failed (0 + 4095)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule