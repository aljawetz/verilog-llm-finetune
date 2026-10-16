`timescale 1ns/1ps

module tb_D_FF_pos;

  // Inputs
  reg D;
  reg clk;

  // Outputs
  wire Q;

  // Instantiate the Unit Under Test (UUT)
  D_FF_pos uut (
    .D(D),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    D = 0;

    // Wait for the first clock edge
    #10;
    if (Q !== 0) begin
      $display("FAIL: Initial output Q is not 0");
      $finish;
    end

    // Test case 1: Set D to 1
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1) begin
      $display("FAIL: Output Q did not update to 1 when D was set to 1");
      $finish;
    end

    // Test case 2: Set D to 0
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0) begin
      $display("FAIL: Output Q did not update to 0 when D was set to 0");
      $finish;
    end

    // Test case 3: Toggle D to 1 again
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1) begin
      $display("FAIL: Output Q did not update to 1 when D was set to 1 again");
      $finish;
    end

    // Test case 4: Toggle D to 0 again
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0) begin
      $display("FAIL: Output Q did not update to 0 when D was set to 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule