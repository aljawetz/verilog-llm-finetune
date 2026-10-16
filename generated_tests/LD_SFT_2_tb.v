`timescale 1ns/1ps

module tb_LD_SFT;

  reg S;
  reg IN1;
  reg IN2;
  wire OUT;

  // Instantiate the module under test (uut)
  LD_SFT uut (
    .S(S),
    .IN1(IN1),
    .IN2(IN2),
    .OUT(OUT)
  );

  initial begin
    // Test case 1: S = 0, IN1 = 0, IN2 = 0
    S = 0; IN1 = 0; IN2 = 0;
    #10;
    if (OUT !== 0) $display("FAIL: Test case 1 failed, expected OUT = 0, got OUT = %b", OUT);

    // Test case 2: S = 0, IN1 = 1, IN2 = 0
    S = 0; IN1 = 1; IN2 = 0;
    #10;
    if (OUT !== 1) $display("FAIL: Test case 2 failed, expected OUT = 1, got OUT = %b", OUT);

    // Test case 3: S = 0, IN1 = 0, IN2 = 1
    S = 0; IN1 = 0; IN2 = 1;
    #10;
    if (OUT !== 0) $display("FAIL: Test case 3 failed, expected OUT = 0, got OUT = %b", OUT);

    // Test case 4: S = 1, IN1 = 0, IN2 = 0
    S = 1; IN1 = 0; IN2 = 0;
    #10;
    if (OUT !== 0) $display("FAIL: Test case 4 failed, expected OUT = 0, got OUT = %b", OUT);

    // Test case 5: S = 1, IN1 = 1, IN2 = 0
    S = 1; IN1 = 1; IN2 = 0;
    #10;
    if (OUT !== 0) $display("FAIL: Test case 5 failed, expected OUT = 0, got OUT = %b", OUT);

    // Test case 6: S = 1, IN1 = 0, IN2 = 1
    S = 1; IN1 = 0; IN2 = 1;
    #10;
    if (OUT !== 1) $display("FAIL: Test case 6 failed, expected OUT = 1, got OUT = %b", OUT);

    // Test case 7: S = 1, IN1 = 1, IN2 = 1
    S = 1; IN1 = 1; IN2 = 1;
    #10;
    if (OUT !== 1) $display("FAIL: Test case 7 failed, expected OUT = 1, got OUT = %b", OUT);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule