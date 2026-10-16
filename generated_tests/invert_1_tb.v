`timescale 1ns/1ps

module tb_invert;

  // Inputs
  reg b;

  // Outputs
  wire ib;

  // Instantiate the Unit Under Test (UUT)
  invert uut (
    .ib(ib),
    .b(b)
  );

  initial begin
    // Initialize Inputs
    b = 0;

    // Wait for a moment and check the output
    #10;
    if (ib !== 1) begin
      $display("FAIL: Expected ib = 1 when b = 0, got ib = %b", ib);
      $finish;
    end

    // Change input and check output
    b = 1;
    #10;
    if (ib !== 0) begin
      $display("FAIL: Expected ib = 0 when b = 1, got ib = %b", ib);
      $finish;
    end

    // Test with another transition
    b = 0;
    #10;
    if (ib !== 1) begin
      $display("FAIL: Expected ib = 1 when b = 0, got ib = %b", ib);
      $finish;
    end

    // Final check
    b = 1;
    #10;
    if (ib !== 0) begin
      $display("FAIL: Expected ib = 0 when b = 1, got ib = %b", ib);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule