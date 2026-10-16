`timescale 1ns/1ps

module tb_clock_buffer;

  reg master_clk;
  wire buffer_clk;

  // Instantiate the module under test (uut)
  clock_buffer uut (
    .master_clk(master_clk),
    .buffer_clk(buffer_clk)
  );

  // Clock generation
  initial begin
    master_clk = 0;
    forever #5 master_clk = ~master_clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles
    #10;

    // Check if buffer_clk follows master_clk
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // Wait for a few more clock cycles
    #10;

    // Check again
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // Wait for additional clock cycles
    #10;

    // Final check
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule