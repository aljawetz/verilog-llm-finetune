`timescale 1ns/1ps

module tb_clock_buffer;

  reg master_clk;
  wire buffer_clk;

  // Instantiate the unit under test (uut)
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
    #15;

    // Check the output buffer_clk matches master_clk
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // Wait for a few more clock cycles
    #20;

    // Check again
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // Final check after more cycles
    #10;
    if (buffer_clk !== master_clk) begin
      $display("FAIL: buffer_clk does not match master_clk at time %0t", $time);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule