`timescale 1ns/1ps

module tb_dff_Pe_Ar;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_Pe_Ar uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test 1: Check reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check data input on clock edge
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1 on clock edge");
      $finish;
    end

    // Test 3: Check data input when d is 0
    d = 0; // Set d to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to 0 on clock edge");
      $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 after deasserting");
      $finish;
    end

    // Test 5: Check data input after reset
    rst = 0; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1 after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule