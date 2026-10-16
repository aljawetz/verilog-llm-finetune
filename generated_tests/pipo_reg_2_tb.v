`timescale 1ns/1ps

module tb_pipo_reg;

  reg clk;
  reg clear;
  reg [3:0] d;
  wire [3:0] q;

  // Instantiate the module under test (uut)
  pipo_reg uut (
    .clk(clk),
    .clear(clear),
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
    clear = 0;
    d = 4'b0000;

    // Test 1: Check reset functionality
    clear = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0000 after clear, got q = %b", q);
      $finish;
    end

    // Test 2: Check data loading
    clear = 0; // Deassert clear
    d = 4'b1010; // Load data
    #10; // Wait for one clock cycle
    if (q !== 4'b1010) begin
      $display("FAIL: Expected q = 1010 after loading data, got q = %b", q);
      $finish;
    end

    // Test 3: Check clear functionality again
    clear = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Expected q = 0000 after clear, got q = %b", q);
      $finish;
    end

    // Test 4: Load new data
    clear = 0; // Deassert clear
    d = 4'b1111; // Load new data
    #10; // Wait for one clock cycle
    if (q !== 4'b1111) begin
      $display("FAIL: Expected q = 1111 after loading new data, got q = %b", q);
      $finish;
    end

    // Test 5: Check that data is retained when clear is not asserted
    clear = 0; // Ensure clear is deasserted
    #10; // Wait for one clock cycle
    if (q !== 4'b1111) begin
      $display("FAIL: Expected q = 1111 to be retained, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule