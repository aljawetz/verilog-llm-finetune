`timescale 1ns/1ps

module tb_direct_interc;

  // Inputs
  reg [0:0] in;

  // Outputs
  wire [0:0] out;

  // Instantiate the Unit Under Test (UUT)
  direct_interc uut (
    .in(in),
    .out(out)
  );

  // Test procedure
  initial begin
    // Initialize input
    in = 1'b0;

    // Wait for some time
    #10;

    // Test case 1: Check when in is 0
    if (out !== 1'b0) begin
      $display("FAIL: Output is not as expected for input 0");
      $finish;
    end

    // Test case 2: Check when in is 1
    in = 1'b1;
    #10; // Wait for output to settle

    if (out !== 1'b1) begin
      $display("FAIL: Output is not as expected for input 1");
      $finish;
    end

    // Test case 3: Check when in is toggled back to 0
    in = 1'b0;
    #10; // Wait for output to settle

    if (out !== 1'b0) begin
      $display("FAIL: Output is not as expected for input 0 after toggle");
      $finish;
    end

    // Test case 4: Check when in is toggled to 1 again
    in = 1'b1;
    #10; // Wait for output to settle

    if (out !== 1'b1) begin
      $display("FAIL: Output is not as expected for input 1 after toggle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule