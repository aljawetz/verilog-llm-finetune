`timescale 1ns/1ps

module tb_dff_2out31_0;

  reg [31:0] d;
  reg clk;
  wire [31:0] q;
  wire [31:0] qb;

  // Instantiate the module under test (uut)
  dff_2out31_0 uut (
    .d(d),
    .clk(clk),
    .q(q),
    .qb(qb)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 32'h00000000;

    // Wait for the first clock edge
    #10;

    // Test case 1: Check initial values
    if (q !== 32'h00000000 || qb !== 32'hFFFFFFFF) begin
      $display("FAIL: Initial values are incorrect");
      $finish;
    end

    // Test case 2: Apply a value
    d = 32'hA5A5A5A5; // Arbitrary test value
    #10; // Wait for clock edge
    if (q !== 32'hA5A5A5A5 || qb !== 32'h5A5A5A5A) begin
      $display("FAIL: Output values are incorrect after first input");
      $finish;
    end

    // Test case 3: Apply another value
    d = 32'hFFFFFFFF; // All bits set
    #10; // Wait for clock edge
    if (q !== 32'hFFFFFFFF || qb !== 32'h00000000) begin
      $display("FAIL: Output values are incorrect after second input");
      $finish;
    end

    // Test case 4: Apply zero
    d = 32'h00000000; // All bits cleared
    #10; // Wait for clock edge
    if (q !== 32'h00000000 || qb !== 32'hFFFFFFFF) begin
      $display("FAIL: Output values are incorrect after third input");
      $finish;
    end

    // Test case 5: Apply a random value
    d = 32'h12345678; // Random test value
    #10; // Wait for clock edge
    if (q !== 32'h12345678 || qb !== 32'hEDCBA987) begin
      $display("FAIL: Output values are incorrect after random input");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule