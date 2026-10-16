`timescale 1ns/1ps

module tb_BLOCK1A;

  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;
  wire GOUT;

  // Instantiate the module under test (uut)
  BLOCK1A uut (
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .GOUT(GOUT)
  );

  initial begin
    // Initialize inputs
    PIN2 = 0;
    GIN1 = 0;
    GIN2 = 0;
    PHI = 0;

    // Test sequence
    // Test case 1: All inputs low
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Test case 1 failed, expected GOUT=1, got GOUT=%b", GOUT);
      $finish;
    end

    // Test case 2: GIN1 high
    GIN1 = 1;
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Test case 2 failed, expected GOUT=1, got GOUT=%b", GOUT);
      $finish;
    end

    // Test case 3: GIN2 high
    GIN2 = 1;
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Test case 3 failed, expected GOUT=0, got GOUT=%b", GOUT);
      $finish;
    end

    // Test case 4: PIN2 high
    PIN2 = 1;
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Test case 4 failed, expected GOUT=0, got GOUT=%b", GOUT);
      $finish;
    end

    // Test case 5: GIN1 and GIN2 high
    GIN1 = 1;
    GIN2 = 1;
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Test case 5 failed, expected GOUT=0, got GOUT=%b", GOUT);
      $finish;
    end

    // Test case 6: Reset inputs
    PIN2 = 0; GIN1 = 0; GIN2 = 0;
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Test case 6 failed, expected GOUT=1, got GOUT=%b", GOUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule