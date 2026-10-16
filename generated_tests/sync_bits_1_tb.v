`timescale 1ns/1ps

module tb_sync_bits;

  parameter NUM_OF_BITS = 4;
  parameter ASYNC_CLK = 1;

  reg [NUM_OF_BITS-1:0] in_bits;
  reg out_resetn;
  reg out_clk;
  wire [NUM_OF_BITS-1:0] out_bits;

  // Instantiate the module under test
  sync_bits #(
    .NUM_OF_BITS(NUM_OF_BITS),
    .ASYNC_CLK(ASYNC_CLK)
  ) uut (
    .in_bits(in_bits),
    .out_resetn(out_resetn),
    .out_clk(out_clk),
    .out_bits(out_bits)
  );

  // Clock generation
  initial begin
    out_clk = 0;
    forever #5 out_clk = ~out_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    in_bits = 4'b0000;
    out_resetn = 0;

    // Apply reset
    #10;
    out_resetn = 1;

    // Test case 1: Check output after reset
    #10;
    if (out_bits !== 4'b0000) begin
      $display("FAIL: Output should be 0000 after reset");
      $finish;
    end

    // Test case 2: Change input bits
    in_bits = 4'b1010;
    #10;
    if (out_bits !== 4'b0000) begin
      $display("FAIL: Output should still be 0000 (waiting for sync)");
      $finish;
    end

    // Wait for synchronization
    #10;
    if (out_bits !== 4'b1010) begin
      $display("FAIL: Output should be 1010 after synchronization");
      $finish;
    end

    // Test case 3: Change input bits again
    in_bits = 4'b1100;
    #10;
    if (out_bits !== 4'b1010) begin
      $display("FAIL: Output should still be 1010 (waiting for sync)");
      $finish;
    end

    // Wait for synchronization
    #10;
    if (out_bits !== 4'b1100) begin
      $display("FAIL: Output should be 1100 after synchronization");
      $finish;
    end

    // Test case 4: Check behavior with reset
    in_bits = 4'b1111;
    #10;
    out_resetn = 0; // Assert reset
    #10;
    out_resetn = 1; // Deassert reset
    #10;
    if (out_bits !== 4'b0000) begin
      $display("FAIL: Output should be 0000 after reset");
      $finish;
    end

    // Final check after reset
    #10;
    if (out_bits !== 4'b1111) begin
      $display("FAIL: Output should be 1111 after synchronization");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule