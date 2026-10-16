`timescale 1ns/1ps

module tb_D_FF_NEC;

  reg D;
  reg clk;
  wire Q;

  // Instantiate the D Flip-Flop
  D_FF_NEC uut (
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
    // Initialize
    D = 0;

    // Wait for the clock to stabilize
    #10;

    // Test case 1: Check Q follows D on negedge of clk
    D = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should be 1 when D is 1");
      $finish;
    end

    // Test case 2: Change D and check Q
    D = 0;
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 when D is 0");
      $finish;
    end

    // Test case 3: Check Q holds value until next negedge
    D = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1) begin
      $display("FAIL: Q should still be 1 after D is set to 1");
      $finish;
    end

    // Test case 4: Final check with D = 0
    D = 0;
    #10; // Wait for one clock cycle
    if (Q !== 0) begin
      $display("FAIL: Q should be 0 after D is set to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule