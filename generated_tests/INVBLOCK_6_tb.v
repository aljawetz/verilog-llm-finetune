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
    // Test case 1: GIN = 0
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Expected GOUT = 1 when GIN = 0, got GOUT = %b", GOUT);
      $finish;
    end

    // Test case 2: GIN = 1
    GIN = 1;
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Expected GOUT = 0 when GIN = 1, got GOUT = %b", GOUT);
      $finish;
    end

    // Test case 3: GIN = 0 again
    GIN = 0;
    #10;
    if (GOUT !== 1) begin
      $display("FAIL: Expected GOUT = 1 when GIN = 0, got GOUT = %b", GOUT);
      $finish;
    end

    // Test case 4: GIN = 1 again
    GIN = 1;
    #10;
    if (GOUT !== 0) begin
      $display("FAIL: Expected GOUT = 0 when GIN = 1, got GOUT = %b", GOUT);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule