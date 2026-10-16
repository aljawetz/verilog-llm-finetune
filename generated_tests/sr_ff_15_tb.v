`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    S = 0;
    R = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Set Q to 1
    S = 1; R = 0; 
    #10; // Wait for clock edge
    if (Q !== 1'b1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 2: Reset Q to 0
    S = 0; R = 1; 
    #10; // Wait for clock edge
    if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 3: Hold state (Q should remain 0)
    S = 0; R = 0; 
    #10; // Wait for clock edge
    if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 4: Set Q to 1 again
    S = 1; R = 0; 
    #10; // Wait for clock edge
    if (Q !== 1'b1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 5: Invalid state (S=1, R=1)
    S = 1; R = 1; 
    #10; // Wait for clock edge
    if (Q !== 1'bx) $display("FAIL: Expected Q=x, got Q=%b", Q);

    // Test case 6: Reset to 0
    S = 0; R = 1; 
    #10; // Wait for clock edge
    if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule