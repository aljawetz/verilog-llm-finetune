`timescale 1ns/1ps

module tb_gbuf;

  reg CLK;
  wire GL;

  // Instantiate the unit under test (uut)
  gbuf uut (
    .GL(GL),
    .CLK(CLK)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // Toggle clock every 5 ns
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles
    #10;

    // Check the output GL against the input CLK
    if (GL !== CLK) begin
      $display("FAIL: GL does not match CLK at time %0t", $time);
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check the output GL again
    if (GL !== CLK) begin
      $display("FAIL: GL does not match CLK at time %0t", $time);
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Final check
    if (GL !== CLK) begin
      $display("FAIL: GL does not match CLK at time %0t", $time);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule