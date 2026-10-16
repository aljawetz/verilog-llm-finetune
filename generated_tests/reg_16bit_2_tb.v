`timescale 1ns/1ps

module tb_reg_16bit;

  // Inputs
  reg clk;
  reg rst;
  reg ld;
  reg [15:0] d;

  // Outputs
  wire [15:0] q;

  // Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    rst = 1;
    ld = 0;
    d = 16'h0000;

    // Wait for a clock edge
    #10;

    // Release reset
    rst = 0;

    // Test 1: Check reset functionality
    #10;
    if (q !== 16'b0) begin
      $display("FAIL: Reset did not clear register");
      $finish;
    end

    // Test 2: Load value into register
    d = 16'hA5A5; // Load value
    ld = 1; // Enable load
    #10;
    ld = 0; // Disable load

    if (q !== 16'hA5A5) begin
      $display("FAIL: Load did not set register to d");
      $finish;
    end

    // Test 3: Check that register holds value when ld is low
    #10;
    if (q !== 16'hA5A5) begin
      $display("FAIL: Register value changed when ld is low");
      $finish;
    end

    // Test 4: Load another value
    d = 16'h5A5A; // New value
    ld = 1; // Enable load
    #10;
    ld = 0; // Disable load

    if (q !== 16'h5A5A) begin
      $display("FAIL: Load did not update register with new d");
      $finish;
    end

    // Test 5: Check that register holds value when ld is low
    #10;
    if (q !== 16'h5A5A) begin
      $display("FAIL: Register value changed when ld is low");
      $finish;
    end

    // Test 6: Check reset functionality again
    rst = 1; // Assert reset
    #10;
    rst = 0; // Release reset

    if (q !== 16'b0) begin
      $display("FAIL: Reset did not clear register on second check");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule