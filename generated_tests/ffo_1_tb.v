`timescale 1ns/1ps

module tb_ffo;

  reg D;
  reg clk;
  wire Q;
  wire Qbar;

  // Instantiate the module under test
  ffo uut (
    .D(D),
    .clk(clk),
    .Q(Q),
    .Qbar(Qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    D = 0;
    #10; // Wait for 10ns

    // Test case 1: Check initial state
    if (Q !== 1'b0 || Qbar !== 1'b1) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test case 2: Set D to 1
    D = 1;
    #10; // Wait for clock edge
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
      $display("FAIL: Q and Qbar are incorrect after setting D to 1");
      $finish;
    end

    // Test case 3: Set D to 0
    D = 0;
    #10; // Wait for clock edge
    if (Q !== 1'b0 || Qbar !== 1'b1) begin
      $display("FAIL: Q and Qbar are incorrect after setting D to 0");
      $finish;
    end

    // Test case 4: Hold D at 1
    D = 1;
    #10; // Wait for clock edge
    if (Q !== 1'b1 || Qbar !== 1'b0) begin
      $display("FAIL: Q and Qbar are incorrect while holding D at 1");
      $finish;
    end

    // Test case 5: Hold D at 0
    D = 0;
    #10; // Wait for clock edge
    if (Q !== 1'b0 || Qbar !== 1'b1) begin
      $display("FAIL: Q and Qbar are incorrect while holding D at 0");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule