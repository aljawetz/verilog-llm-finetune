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
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    rin = 32'hA5A5A5A5; // Test input value

    // Wait for a clock cycle
    #10;

    // Release reset
    rst = 0;
    #10;

    // Check output after reset is released
    if (rout !== 32'hA5A5A5A5) begin
      $display("FAIL: Output should be A5A5A5A5 after reset is released");
      $finish;
    end

    // Change input value
    rin = 32'h5A5A5A5A;
    #10;

    // Check output after input change
    if (rout !== 32'h5A5A5A5A) begin
      $display("FAIL: Output should be 5A5A5A5A after input change");
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10;

    // Check output after asserting reset
    if (rout !== 32'd0) begin
      $display("FAIL: Output should be 0 after reset is asserted");
      $finish;
    end

    // Release reset again
    rst = 0;
    #10;

    // Check output after reset is released again
    if (rout !== 32'h5A5A5A5A) begin
      $display("FAIL: Output should be 5A5A5A5A after reset is released again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule