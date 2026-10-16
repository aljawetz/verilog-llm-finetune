`timescale 1ns/1ps

module tb_reg_16bit;

  reg clk;
  reg rst;
  reg ld;
  reg [15:0] d;
  wire [15:0] q;

  // Instantiate the module under test (uut)
  reg_16bit uut (
    .clk(clk),
    .rst(rst),
    .ld(ld),
    .d(d),
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
    rst = 1;
    ld = 0;
    d = 16'h0000;

    // Wait for a clock cycle
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test 1: Load data into register
    d = 16'hA5A5; // Load value
    ld = 1; // Enable load
    #10; // Wait for clock edge
    ld = 0; // Disable load
    #10;

    if (q !== 16'hA5A5) begin
      $display("FAIL: Test 1 failed, expected 0xA5A5, got 0x%h", q);
      $finish;
    end

    // Test 2: Check retention of value
    #10; // Wait for another clock edge
    if (q !== 16'hA5A5) begin
      $display("FAIL: Test 2 failed, expected 0xA5A5, got 0x%h", q);
      $finish;
    end

    // Test 3: Reset the register
    rst = 1; // Assert reset
    #10; // Wait for clock edge
    rst = 0; // Release reset
    #10;

    if (q !== 16'h0000) begin
      $display("FAIL: Test 3 failed, expected 0x0000, got 0x%h", q);
      $finish;
    end

    // Test 4: Load new data after reset
    d = 16'h1234; // New load value
    ld = 1; // Enable load
    #10; // Wait for clock edge
    ld = 0; // Disable load
    #10;

    if (q !== 16'h1234) begin
      $display("FAIL: Test 4 failed, expected 0x1234, got 0x%h", q);
      $finish;
    end

    // Test 5: Check retention of new value
    #10; // Wait for another clock edge
    if (q !== 16'h1234) begin
      $display("FAIL: Test 5 failed, expected 0x1234, got 0x%h", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule