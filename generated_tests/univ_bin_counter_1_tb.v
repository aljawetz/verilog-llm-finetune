`timescale 1ns/1ps

module tb_univ_bin_counter;
  parameter N = 8;
  reg clk, reset, syn_clr, load, en, up;
  reg [N-1:0] d;
  wire max, min;
  wire [N-1:0] q;

  // Instantiate the unit under test (UUT)
  univ_bin_counter #(.N(N)) uut (
    .clk(clk),
    .reset(reset),
    .syn_clr(syn_clr),
    .load(load),
    .en(en),
    .up(up),
    .d(d),
    .max(max),
    .min(min),
    .q(q)
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
    syn_clr = 0;
    load = 0;
    en = 0;
    up = 0;
    d = 8'b0;

    // Release reset
    #10 reset = 0;

    // Test 1: Check reset functionality
    #10;
    if (q !== 8'b0) begin
      $display("FAIL: Reset did not clear the counter");
      $finish;
    end

    // Test 2: Load functionality
    load = 1; d = 8'b10101010; #10;
    load = 0; 
    if (q !== 8'b10101010) begin
      $display("FAIL: Load did not set the counter correctly");
      $finish;
    end

    // Test 3: Increment functionality
    en = 1; up = 1; #10;
    if (q !== 8'b10101011) begin
      $display("FAIL: Increment did not work correctly");
      $finish;
    end

    // Test 4: Decrement functionality
    up = 0; #10;
    if (q !== 8'b10101010) begin
      $display("FAIL: Decrement did not work correctly");
      $finish;
    end

    // Test 5: Synchronous clear functionality
    syn_clr = 1; #10;
    if (q !== 8'b0) begin
      $display("FAIL: Synchronous clear did not work correctly");
      $finish;
    end
    syn_clr = 0;

    // Test 6: Maximum value detection
    load = 1; d = 8'b11111111; #10;
    load = 0; 
    if (max !== 1'b1) begin
      $display("FAIL: Maximum value detection failed");
      $finish;
    end

    // Test 7: Minimum value detection
    syn_clr = 1; #10;
    if (min !== 1'b1) begin
      $display("FAIL: Minimum value detection failed");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end
endmodule