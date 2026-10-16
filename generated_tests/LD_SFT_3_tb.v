`timescale 1ns/1ps

module tb_LD_SFT;

  // Inputs
  reg S;
  reg IN1;
  reg IN2;

  // Output
  wire OUT;

  // Instantiate the Unit Under Test (UUT)
  LD_SFT uut (
    .S(S),
    .IN1(IN1),
    .IN2(IN2),
    .OUT(OUT)
  );

  initial begin
    // Initialize Inputs
    S = 0;
    IN1 = 0;
    IN2 = 0;

    // Test case 1: S = 0, IN1 = 0, IN2 = 0
    #10;
    if (OUT !== 0) $display("FAIL: Test case 1 failed (OUT should be 0)");
    
    // Test case 2: S = 0, IN1 = 1, IN2 = 0
    IN1 = 1; IN2 = 0; S = 0; #10;
    if (OUT !== 1) $display("FAIL: Test case 2 failed (OUT should be 1)");

    // Test case 3: S = 1, IN1 = 1, IN2 = 0
    IN1 = 1; IN2 = 0; S = 1; #10;
    if (OUT !== 0) $display("FAIL: Test case 3 failed (OUT should be 0)");

    // Test case 4: S = 0, IN1 = 0, IN2 = 1
    IN1 = 0; IN2 = 1; S = 0; #10;
    if (OUT !== 0) $display("FAIL: Test case 4 failed (OUT should be 0)");

    // Test case 5: S = 1, IN1 = 0, IN2 = 1
    IN1 = 0; IN2 = 1; S = 1; #10;
    if (OUT !== 1) $display("FAIL: Test case 5 failed (OUT should be 1)");

    // Test case 6: S = 0, IN1 = 1, IN2 = 1
    IN1 = 1; IN2 = 1; S = 0; #10;
    if (OUT !== 1) $display("FAIL: Test case 6 failed (OUT should be 1)");

    // Test case 7: S = 1, IN1 = 1, IN2 = 1
    IN1 = 1; IN2 = 1; S = 1; #10;
    if (OUT !== 1) $display("FAIL: Test case 7 failed (OUT should be 1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule