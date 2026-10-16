`timescale 1ns/1ps

module tb_add_unsigned_carry;
  reg [7:0] A;
  reg [7:0] B;
  reg CI;
  wire [8:0] Z;

  // Instantiate the module under test
  add_unsigned_carry uut (
    .A(A),
    .B(B),
    .CI(CI),
    .Z(Z)
  );

  initial begin
    // Test case 1: 8'h01 + 8'h01 + CI=0
    A = 8'h01; B = 8'h01; CI = 0;
    #10;
    if (Z !== 9'h002) $display("FAIL: Test case 1 failed, expected 9'h002, got %h", Z);

    // Test case 2: 8'hFF + 8'h01 + CI=0
    A = 8'hFF; B = 8'h01; CI = 0;
    #10;
    if (Z !== 9'h100) $display("FAIL: Test case 2 failed, expected 9'h100, got %h", Z);

    // Test case 3: 8'h7F + 8'h01 + CI=0
    A = 8'h7F; B = 8'h01; CI = 0;
    #10;
    if (Z !== 9'h80) $display("FAIL: Test case 3 failed, expected 9'h80, got %h", Z);

    // Test case 4: 8'h80 + 8'h80 + CI=0
    A = 8'h80; B = 8'h80; CI = 0;
    #10;
    if (Z !== 9'h100) $display("FAIL: Test case 4 failed, expected 9'h100, got %h", Z);

    // Test case 5: 8'h01 + 8'h01 + CI=1
    A = 8'h01; B = 8'h01; CI = 1;
    #10;
    if (Z !== 9'h003) $display("FAIL: Test case 5 failed, expected 9'h003, got %h", Z);

    // Test case 6: 8'hFF + 8'h01 + CI=1
    A = 8'hFF; B = 8'h01; CI = 1;
    #10;
    if (Z !== 9'h101) $display("FAIL: Test case 6 failed, expected 9'h101, got %h", Z);

    // Test case 7: 8'h7F + 8'h01 + CI=1
    A = 8'h7F; B = 8'h01; CI = 1;
    #10;
    if (Z !== 9'h81) $display("FAIL: Test case 7 failed, expected 9'h81, got %h", Z);

    // Test case 8: 8'h80 + 8'h80 + CI=1
    A = 8'h80; B = 8'h80; CI = 1;
    #10;
    if (Z !== 9'h101) $display("FAIL: Test case 8 failed, expected 9'h101, got %h", Z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule