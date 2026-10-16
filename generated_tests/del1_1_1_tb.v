`timescale 1ns/1ps

module tb_del1_1;

  reg inp;
  wire out;

  // Instantiate the module under test
  del1_1 uut (
    .inp(inp),
    .out(out)
  );

  initial begin
    // Initialize input
    inp = 0;

    // Test sequence
    #10; // Wait for 10 time units
    if (out !== inp) begin
      $display("FAIL: Output does not match input at time %0t", $time);
      $finish;
    end

    inp = 1; // Change input to 1
    #10; // Wait for 10 time units
    if (out !== inp) begin
      $display("FAIL: Output does not match input at time %0t", $time);
      $finish;
    end

    inp = 0; // Change input back to 0
    #10; // Wait for 10 time units
    if (out !== inp) begin
      $display("FAIL: Output does not match input at time %0t", $time);
      $finish;
    end

    // Final check
    inp = 1; // Change input to 1 again
    #10; // Wait for 10 time units
    if (out !== inp) begin
      $display("FAIL: Output does not match input at time %0t", $time);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule