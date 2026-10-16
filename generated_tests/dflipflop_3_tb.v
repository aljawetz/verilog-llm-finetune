`timescale 1ns/1ps

module tb_dflipflop;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  dflipflop uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 0; 
    d = 0; 
    #10;

    // Assert reset
    rst = 1; 
    #10;

    // Test case 1: Check output when D is 0
    d = 0; 
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 when d = 0");
      $finish;
    end

    // Test case 2: Check output when D is 1
    d = 1; 
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 when d = 1");
      $finish;
    end

    // Test case 3: Check output after reset
    rst = 0; 
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset");
      $finish;
    end

    // Test case 4: Check output when D is 0 after reset
    rst = 1; 
    d = 0; 
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 when d = 0 after reset");
      $finish;
    end

    // Test case 5: Check output when D is 1 after reset
    d = 1; 
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 when d = 1 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule