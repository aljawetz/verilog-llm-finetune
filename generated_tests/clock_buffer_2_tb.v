`timescale 1ns/1ps

module tb_clock_buffer;

  reg x;
  wire out;

  // Instantiate the module under test (uut)
  clock_buffer uut (
    .out(out),
    .x(x)
  );

  initial begin
    // Initialize input
    x = 0;

    // Wait for some time
    #10;

    // Test case 1: Check when x is 0
    if (out !== 0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // Change input
    x = 1;
    #10;

    // Test case 2: Check when x is 1
    if (out !== 1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // Change input back to 0
    x = 0;
    #10;

    // Test case 3: Check again when x is 0
    if (out !== 0) begin
      $display("FAIL: Output should be 0 when input is 0");
      $finish;
    end

    // Change input to 1 again
    x = 1;
    #10;

    // Test case 4: Check again when x is 1
    if (out !== 1) begin
      $display("FAIL: Output should be 1 when input is 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule