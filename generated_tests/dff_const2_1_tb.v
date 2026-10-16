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
    reset = 0;
    
    // Check the output after reset
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Output q should be 1 after reset");
      $finish;
    end

    // Allow some clock cycles to pass
    #20;

    // Check the output remains high
    if (q !== 1'b1) begin
      $display("FAIL: Output q should remain 1");
      $finish;
    end

    // Assert that the output remains high for multiple clock cycles
    #30;
    if (q !== 1'b1) begin
      $display("FAIL: Output q should remain 1");
      $finish;
    end

    // End the simulation
    $display("PASS");
    $finish;
  end

endmodule