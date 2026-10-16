`timescale 1ns/1ps

module tb_Day14_DFF_Sync_Reset;

  reg clk;
  reg rst;
  reg [3:0] d;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  Day14_DFF_Sync_Reset uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1; // Start with reset high
    d = 4'b1010; // Test data

    // Wait for a clock cycle
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Output should be 0000 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle
    if (out !== 4'b1010) begin
      $display("FAIL: Output should be 1010 after loading data");
      $finish;
    end

    // Change input data
    d = 4'b1100;
    #10; // Wait for a clock cycle
    if (out !== 4'b1100) begin
      $display("FAIL: Output should be 1100 after loading new data");
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10; // Wait for a clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Output should be 0000 when rst is high again");
      $finish;
    end

    // Release reset and check output
    rst = 0;
    #10; // Wait for a clock cycle
    if (out !== 4'b1100) begin
      $display("FAIL: Output should still be 1100 after releasing reset");
      $finish;
    end

    // Final check with different data
    d = 4'b0111;
    #10; // Wait for a clock cycle
    if (out !== 4'b0111) begin
      $display("FAIL: Output should be 0111 after loading new data");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule