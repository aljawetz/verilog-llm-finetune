`timescale 1ns/1ps

module tb_direct_interc;

  // Testbench signals
  reg [0:0] in;
  wire [0:0] out;

  // Instantiate the module under test (uut)
  direct_interc uut (
    .in(in),
    .out(out)
  );

  // Test procedure
  initial begin
    // Test case 1: Check when input is 0
    in = 1'b0;  // Set input to 0
    #10;        // Wait for 10 time units
    if (out !== 1'b0) begin
      $display("FAIL: Expected output 0, got %b", out);
      $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1;  // Set input to 1
    #10;        // Wait for 10 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected output 1, got %b", out);
      $finish;
    end

    // Test case 3: Check when input changes rapidly
    in = 1'b0;  // Set input to 0
    #5;         // Wait for 5 time units
    if (out !== 1'b0) begin
      $display("FAIL: Expected output 0, got %b", out);
      $finish;
    end
    in = 1'b1;  // Change input to 1
    #5;         // Wait for 5 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected output 1, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule