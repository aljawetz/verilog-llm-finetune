`timescale 1ns/1ps

module tb_dff_const2;

  reg clk;
  reg reset;
  wire q;

  // Instantiate the module under test (uut)
  dff_const2 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check output after reset
    if (q !== 1'b1) begin
      $display("FAIL: Output q should be 1 after reset");
      $finish;
    end

    // Wait for a few clock cycles and check output
    #10; // Wait for 10ns (1 clock cycle)
    if (q !== 1'b1) begin
      $display("FAIL: Output q should be 1 after clock edge");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Output q should be 1 after clock edge");
      $finish;
    end

    // Assert that output remains high for multiple clock cycles
    #20; // Wait for two more clock cycles
    if (q !== 1'b1) begin
      $display("FAIL: Output q should be 1 after multiple clock edges");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule