`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg d;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the D Flip-Flop
  dff uut (
    .clk(clk),
    .d(d),
    .rst(rst),
    .q(q),
    .qb(qb)
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
    d = 0;

    // Apply reset
    #10;
    rst = 0; // Release reset

    // Test case 1: Check reset behavior
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Set d to 1
    d = 1;
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: D=1 did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 3: Set d to 0
    d = 0;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: D=0 did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 4: Check reset again
    rst = 1;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 5: Check behavior after reset
    rst = 0;
    d = 1;
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: D=1 after reset did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 6: Final check with d=0
    d = 0;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: D=0 after D=1 did not set q to 0 and qb to 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule