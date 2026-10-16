`timescale 1ns/1ps

module tb_ff_drva;

  reg in;
  wire out;

  // Instantiate the module under test
  ff_drva uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize input
    in = 0;

    // Test sequence
    #10; // Wait for 10 time units
    if (out !== in) begin
      $display("FAIL: Output does not match input at time 10ns");
      $finish;
    end

    // Change input
    in = 1;
    #10; // Wait for 10 time units
    if (out !== in) begin
      $display("FAIL: Output does not match input at time 20ns");
      $finish;
    end

    // Change input again
    in = 0;
    #10; // Wait for 10 time units
    if (out !== in) begin
      $display("FAIL: Output does not match input at time 30ns");
      $finish;
    end

    // Final change
    in = 1;
    #10; // Wait for 10 time units
    if (out !== in) begin
      $display("FAIL: Output does not match input at time 40ns");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule