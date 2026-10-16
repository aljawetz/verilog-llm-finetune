`timescale 1ns/1ps

module tb_INVBLOCK;

  reg GIN;
  reg PHI;
  wire GOUT;

  // Instantiate the module under test (uut)
  INVBLOCK uut (
    .GIN(GIN),
    .PHI(PHI),
    .GOUT(GOUT)
  );

  initial begin
    // Initialize inputs
    GIN = 0;
    PHI = 0;

    // Test sequence
    // Test case 1: GIN = 0, expect GOUT = 1
    #10;
    GIN = 0; PHI = 1; // PHI is high, GIN is low
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Test case 1 failed, expected GOUT = 1, got %b", GOUT);
      $finish;
    end

    // Test case 2: GIN = 1, expect GOUT = 0
    #10;
    GIN = 1; PHI = 1; // PHI is high, GIN is high
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Test case 2 failed, expected GOUT = 0, got %b", GOUT);
      $finish;
    end

    // Test case 3: GIN = 0, expect GOUT = 1
    #10;
    GIN = 0; PHI = 0; // PHI is low, GIN is low
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Test case 3 failed, expected GOUT = 1, got %b", GOUT);
      $finish;
    end

    // Test case 4: GIN = 1, expect GOUT = 0
    #10;
    GIN = 1; PHI = 0; // PHI is low, GIN is high
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Test case 4 failed, expected GOUT = 0, got %b", GOUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule