`timescale 1ns/1ps

module tb_discrete_dffn;

  reg clk_ni;
  reg d_i;
  wire d_o;

  // Instantiate the module under test (uut)
  discrete_dffn uut (
    .clk_ni(clk_ni),
    .d_i(d_i),
    .d_o(d_o)
  );

  // Clock generation
  initial begin
    clk_ni = 1'b0;
    forever #5 clk_ni = ~clk_ni; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d_i = 1'b0;

    // Wait for the first clock edge
    #10;

    // Test case 1: Check output when d_i is 0
    if (d_o !== 1'b0) begin
      $display("FAIL: Expected d_o = 0, got d_o = %b", d_o);
      $finish;
    end

    // Test case 2: Change d_i to 1
    d_i = 1'b1;
    #10; // Wait for the next negative edge of clk_ni

    if (d_o !== 1'b1) begin
      $display("FAIL: Expected d_o = 1, got d_o = %b", d_o);
      $finish;
    end

    // Test case 3: Change d_i back to 0
    d_i = 1'b0;
    #10; // Wait for the next negative edge of clk_ni

    if (d_o !== 1'b0) begin
      $display("FAIL: Expected d_o = 0, got d_o = %b", d_o);
      $finish;
    end

    // Test case 4: Change d_i to 1 again
    d_i = 1'b1;
    #10; // Wait for the next negative edge of clk_ni

    if (d_o !== 1'b1) begin
      $display("FAIL: Expected d_o = 1, got d_o = %b", d_o);
      $finish;
    end

    // Test case 5: Check stability
    #10; // Wait for another negative edge
    if (d_o !== 1'b1) begin
      $display("FAIL: Expected d_o = 1, got d_o = %b", d_o);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule