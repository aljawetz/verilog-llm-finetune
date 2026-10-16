`timescale 1ns/1ps

module tb_up_counter;

  // Parameters
  reg clk;
  reg reset;
  reg enable;
  reg [7:0] start;
  wire [7:0] out;

  // Instantiate the up_counter module
  up_counter uut (
    .out(out),
    .enable(enable),
    .clk(clk),
    .reset(reset),
    .start(start)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    enable = 0;
    start = 8'h00;

    // Wait for a clock edge
    #10;

    // Test case 1: Reset with starting value
    reset = 1; start = 8'h05; 
    #10; // Wait for clock edge
    if (out !== 8'h05) begin
      $display("FAIL: Expected out = 5 after reset, got out = %d", out);
      $finish;
    end

    // Test case 2: Enable counting
    reset = 0; enable = 1;
    #10; // Wait for clock edge
    if (out !== 8'h06) begin
      $display("FAIL: Expected out = 6 after one increment, got out = %d", out);
      $finish;
    end

    // Test case 3: Continue counting
    #10; // Wait for clock edge
    if (out !== 8'h07) begin
      $display("FAIL: Expected out = 7 after two increments, got out = %d", out);
      $finish;
    end

    // Test case 4: Disable counting
    enable = 0;
    #10; // Wait for clock edge
    if (out !== 8'h07) begin
      $display("FAIL: Expected out = 7 after disable, got out = %d", out);
      $finish;
    end

    // Test case 5: Re-enable counting
    enable = 1;
    #10; // Wait for clock edge
    if (out !== 8'h08) begin
      $display("FAIL: Expected out = 8 after re-enabling, got out = %d", out);
      $finish;
    end

    // Test case 6: Reset again
    reset = 1; start = 8'h0A;
    #10; // Wait for clock edge
    if (out !== 8'h0A) begin
      $display("FAIL: Expected out = 10 after reset, got out = %d", out);
      $finish;
    end

    // Test case 7: Count after reset
    reset = 0; enable = 1;
    #10; // Wait for clock edge
    if (out !== 8'h0B) begin
      $display("FAIL: Expected out = 11 after increment, got out = %d", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule