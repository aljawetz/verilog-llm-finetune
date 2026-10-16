`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
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
    // Initialize signals
    rst = 1; // Start with reset active
    d = 0;

    // Wait for a clock edge
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when reset is active");
      $finish;
    end

    // Deactivate reset
    rst = 0;
    #10;

    // Test capturing d
    d = 1; // Set d to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d");
      $finish;
    end

    // Change d to 0
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after capturing d");
      $finish;
    end

    // Test reset functionality again
    rst = 1; // Activate reset
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 when reset is active");
      $finish;
    end

    // Deactivate reset and test again
    rst = 0;
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after capturing d");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule