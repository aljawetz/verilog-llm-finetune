`timescale 1ns/1ps

module tb_jk_ff;
  reg j, k, clk;
  wire Q;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .j(j),
    .k(k),
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
    j = 0; k = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Reset (j=0, k=1)
    j = 0; k = 1; 
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 when j=0, k=1");
      $finish;
    end

    // Test case 2: Set (j=1, k=0)
    j = 1; k = 0; 
    #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Expected Q=1 when j=1, k=0");
      $finish;
    end

    // Test case 3: Toggle (j=1, k=1)
    j = 1; k = 1; 
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 after toggle when previous Q=1");
      $finish;
    end

    // Test case 4: Hold (j=0, k=0)
    j = 0; k = 0; 
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 when j=0, k=0 and previous Q=0");
      $finish;
    end

    // Test case 5: Set again (j=1, k=0)
    j = 1; k = 0; 
    #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Expected Q=1 when j=1, k=0");
      $finish;
    end

    // Test case 6: Toggle again (j=1, k=1)
    j = 1; k = 1; 
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 after toggle when previous Q=1");
      $finish;
    end

    // Test case 7: Hold (j=0, k=0)
    j = 0; k = 0; 
    #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Expected Q=0 when j=0, k=0 and previous Q=0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule