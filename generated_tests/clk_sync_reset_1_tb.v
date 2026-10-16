`timescale 1ns/1ps

module tb_clk_sync_reset;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire qout;

  // Instantiate the module under test (uut)
  clk_sync_reset uut (
    .clk(clk),
    .rst(rst),
    .qout(qout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 0; // Active low reset
    #10; // Wait for 10ns
    if (qout !== 0) begin
      $display("FAIL: qout should be 0 when rst is low");
      $finish;
    end

    // Release reset
    rst = 1; // Release reset
    #10; // Wait for 10ns
    if (qout !== 1) begin
      $display("FAIL: qout should be 1 when rst is high");
      $finish;
    end

    // Check behavior on clock edge with reset high
    #10; // Wait for 10ns
    if (qout !== 1) begin
      $display("FAIL: qout should remain 1 after clock edge when rst is high");
      $finish;
    end

    // Assert reset again
    rst = 0; // Active low reset
    #10; // Wait for 10ns
    if (qout !== 0) begin
      $display("FAIL: qout should be 0 when rst is low again");
      $finish;
    end

    // Release reset and check again
    rst = 1; // Release reset
    #10; // Wait for 10ns
    if (qout !== 1) begin
      $display("FAIL: qout should be 1 when rst is high again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule