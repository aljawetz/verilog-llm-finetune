`timescale 1ns/1ps

module tb_pipo;

  reg [31:0] rin;
  reg clk;
  reg rst;
  wire [31:0] rout;

  // Instantiate the module under test (uut)
  pipo uut (
    .rin(rin),
    .clk(clk),
    .rst(rst),
    .rout(rout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rin = 32'h0;
    rst = 1; // Assert reset
    #10; // Wait for a clock cycle
    if (rout !== 32'h0) begin
      $display("FAIL: Output should be 0 when reset is asserted");
      $finish;
    end

    // Deassert reset
    rst = 0;
    rin = 32'hA5A5A5A5; // Test value
    #10; // Wait for a clock cycle
    if (rout !== 32'hA5A5A5A5) begin
      $display("FAIL: Output should be 0xA5A5A5A5 after reset is deasserted");
      $finish;
    end

    // Change input value
    rin = 32'h5A5A5A5A;
    #10; // Wait for a clock cycle
    if (rout !== 32'h5A5A5A5A) begin
      $display("FAIL: Output should be 0x5A5A5A5A after input change");
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10; // Wait for a clock cycle
    if (rout !== 32'h0) begin
      $display("FAIL: Output should be 0 when reset is asserted again");
      $finish;
    end

    // Deassert reset and check again
    rst = 0;
    rin = 32'hFFFFFFFF; // Test value
    #10; // Wait for a clock cycle
    if (rout !== 32'hFFFFFFFF) begin
      $display("FAIL: Output should be 0xFFFFFFFF after reset is deasserted");
      $finish;
    end

    // Final check
    rin = 32'h12345678;
    #10; // Wait for a clock cycle
    if (rout !== 32'h12345678) begin
      $display("FAIL: Output should be 0x12345678 after input change");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule