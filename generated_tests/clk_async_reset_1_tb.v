`timescale 1ns/1ps

module tb_clk_async_reset;

  reg clk;
  reg rst;
  wire qout;

  // Instantiate the module under test (uut)
  clk_async_reset uut (
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
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    rst = 0; // Deassert reset
    #10;     // Wait for 10ns

    // Check qout after reset deassertion
    if (qout !== 1) begin
      $display("FAIL: qout should be 1 after reset deassertion");
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check qout again
    if (qout !== 1) begin
      $display("FAIL: qout should remain 1");
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Check qout after reset deassertion
    if (qout !== 1) begin
      $display("FAIL: qout should be 1 after reset deassertion");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule