`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .rst(rst),
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
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset and test D flip-flop functionality
    rst = 0;
    #10; // Wait for 10ns

    // Test D input propagation
    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when d is 1");
      $finish;
    end

    d = 0; #10; // Set d to 0
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when d is 0");
      $finish;
    end

    // Test multiple clock cycles
    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d after clock edge when d is 1");
      $finish;
    end

    // Test reset again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule