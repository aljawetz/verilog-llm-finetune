`timescale 1ns/1ps

module tb_ff_drv;

  reg in;
  wire out;

  // Instantiate the module under test
  ff_drv uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize input
    in = 0;

    // Test sequence
    #10; // Wait for 10 time units
    if (out !== 0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // Change input to 1
    in = 1;
    #10; // Wait for 10 time units
    if (out !== 1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // Change input back to 0
    in = 0;
    #10; // Wait for 10 time units
    if (out !== 0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // Change input to 1 again
    in = 1;
    #10; // Wait for 10 time units
    if (out !== 1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // Final check
    in = 0;
    #10; // Wait for 10 time units
    if (out !== 0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule