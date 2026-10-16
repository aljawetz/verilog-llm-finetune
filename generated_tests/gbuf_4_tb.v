`timescale 1ns/1ps

module tb_gbuf;

  // Inputs
  reg CLK;

  // Outputs
  wire GL;

  // Instantiate the Unit Under Test (UUT)
  gbuf uut (
    .GL(GL),
    .CLK(CLK)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles
    #15;

    // Check if GL follows CLK
    if (GL !== CLK) begin
      $display("FAIL: GL does not match CLK at time %0t", $time);
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check again
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