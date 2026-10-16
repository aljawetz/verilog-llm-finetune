`timescale 1ns/1ps

module tb_edge_detect_pos;

  reg sig;
  reg clk;
  wire out;

  // Instantiate the module under test (uut)
  edge_detect_pos uut (
    .sig(sig),
    .clk(clk),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    sig = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Rising edge detection
    sig = 1; // Signal goes high
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: Expected out=1 after rising edge, got out=%b", out);
      $finish;
    end

    // Test case 2: No change, output should remain low
    sig = 1; // Signal remains high
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Expected out=0 when signal is high but no rising edge, got out=%b", out);
      $finish;
    end

    // Test case 3: Falling edge, output should remain low
    sig = 0; // Signal goes low
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Expected out=0 after falling edge, got out=%b", out);
      $finish;
    end

    // Test case 4: Another rising edge
    sig = 1; // Signal goes high again
    #10; // Wait for one clock cycle
    if (out !== 1) begin
      $display("FAIL: Expected out=1 after second rising edge, got out=%b", out);
      $finish;
    end

    // Test case 5: No change, output should remain low
    sig = 1; // Signal remains high
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Expected out=0 when signal is high but no rising edge, got out=%b", out);
      $finish;
    end

    // Test case 6: Final falling edge
    sig = 0; // Signal goes low
    #10; // Wait for one clock cycle
    if (out !== 0) begin
      $display("FAIL: Expected out=0 after final falling edge, got out=%b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule