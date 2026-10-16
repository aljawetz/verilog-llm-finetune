`timescale 1ns/1ps

module tb_BLOCK2;
  reg PIN1;
  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;
  wire POUT;
  wire GOUT;

  // Instantiate the module under test (uut)
  BLOCK2 uut (
    .PIN1(PIN1),
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .POUT(POUT),
    .GOUT(GOUT)
  );

  initial begin
    // Initialize inputs
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 0; PHI = 0;

    // Test case 1: Check POUT and GOUT with all inputs low
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check POUT and GOUT with PIN1 = 1, PIN2 = 0
    PIN1 = 1; PIN2 = 0; GIN1 = 0; GIN2 = 0; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check POUT and GOUT with PIN1 = 0, PIN2 = 1
    PIN1 = 0; PIN2 = 1; GIN1 = 0; GIN2 = 0; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check POUT and GOUT with PIN1 = 1, PIN2 = 1
    PIN1 = 1; PIN2 = 1; GIN1 = 0; GIN2 = 0; PHI = 0;
    #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Check GOUT with GIN1 = 1, GIN2 = 0
    PIN1 = 0; PIN2 = 1; GIN1 = 1; GIN2 = 0; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Check GOUT with GIN1 = 0, GIN2 = 1
    PIN1 = 0; PIN2 = 1; GIN1 = 0; GIN2 = 1; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Check GOUT with GIN1 = 1, GIN2 = 1
    PIN1 = 0; PIN2 = 1; GIN1 = 1; GIN2 = 1; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule