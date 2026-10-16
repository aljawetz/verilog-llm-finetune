`timescale 1ns/1ps

module tb_D_FF_PEC;

  reg D;
  reg clk;
  wire Q;

  // Instantiate the D flip-flop
  D_FF_PEC uut (
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
    // Initialize D
    D = 0;

    // Wait for the first clock edge
    #10;
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after reset");
      $finish;
    end

    // Test case 1: Set D to 1
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is set to 1");
      $finish;
    end

    // Test case 2: Change D to 0
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is set to 0");
      $finish;
    end

    // Test case 3: Toggle D to 1 again
    D = 1;
    #10; // Wait for the next clock edge
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is set to 1 again");
      $finish;
    end

    // Test case 4: Hold D at 1
    #10; // Wait for the next clock edge
    if (Q !== 1) begin
      $display("FAIL: Q should remain 1 when D is held at 1");
      $finish;
    end

    // Test case 5: Change D to 0 again
    D = 0;
    #10; // Wait for the next clock edge
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is set to 0 again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule