`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
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
    // Initialize signals
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset and test D input
    rst = 0; // Deassert reset
    d = 1;   // Set D to 1
    #10;     // Wait for clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when rst is low");
      $finish;
    end

    // Change D input
    d = 0;   // Set D to 0
    #10;     // Wait for clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when D changed to 0");
      $finish;
    end

    // Test another reset
    rst = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Release reset and test D input again
    rst = 0; // Deassert reset
    d = 1;   // Set D to 1
    #10;     // Wait for clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d after reset");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end
endmodule