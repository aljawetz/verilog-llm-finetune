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
    // Test case 1: Check initial condition
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Initial output is incorrect");
      $finish;
    end

    // Test case 2: Check output when input is 1
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output is incorrect when input is 1");
      $finish;
    end

    // Test case 3: Check output when input is 0 again
    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output is incorrect when input is 0");
      $finish;
    end

    // Test case 4: Check output when input toggles
    in = 1'b1; #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output is incorrect when input toggles to 1");
      $finish;
    end

    in = 1'b0; #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output is incorrect when input toggles back to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule