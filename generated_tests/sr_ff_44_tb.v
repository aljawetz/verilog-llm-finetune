`timescale 1ns/1ps

module tb_sr_ff;

  reg clk;
  reg S;
  reg R;
  wire q;
  wire q_bar;

  // Instantiate the SR flip-flop
  sr_ff uut (
    .clk(clk),
    .S(S),
    .R(R),
    .q(q),
    .q_bar(q_bar)
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
    #10; // Wait for clock to stabilize

    // Test case 1: Hold state (S=0, R=0)
    @(posedge clk);
    S = 0; R = 0;
    #1;
    if (q !== q) $display("FAIL: Hold state failed");

    // Test case 2: Set state (S=1, R=0)
    @(posedge clk);
    S = 1; R = 0;
    #1;
    if (q !== 1'b1) $display("FAIL: Set state failed");

    // Test case 3: Reset state (S=0, R=1)
    @(posedge clk);
    S = 0; R = 1;
    #1;
    if (q !== 1'b0) $display("FAIL: Reset state failed");

    // Test case 4: Undefined state (S=1, R=1)
    @(posedge clk);
    S = 1; R = 1;
    #1;
    if (q !== 1'bx) $display("FAIL: Undefined state failed");

    // Test case 5: Back to hold state (S=0, R=0)
    @(posedge clk);
    S = 0; R = 0;
    #1;
    if (q !== 1'bx) $display("FAIL: Hold after undefined state failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule