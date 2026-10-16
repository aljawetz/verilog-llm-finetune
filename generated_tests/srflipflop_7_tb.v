`timescale 1ns/1ps

module tb_srflipflop;
  reg s;
  reg r;
  reg clk;
  reg rst;
  wire q;
  wire qbar;

  // Instantiate the SR Flip-Flop
  srflipflop uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; s = 0; r = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test case 1: Set the flip-flop
    s = 1; r = 0; 
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 1 failed (Set condition)");
      $finish;
    end

    // Test case 2: Reset the flip-flop
    s = 0; r = 1; 
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 2 failed (Reset condition)");
      $finish;
    end

    // Test case 3: Hold state
    s = 0; r = 0; 
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 3 failed (Hold condition)");
      $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; 
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Test case 4 failed (Set condition)");
      $finish;
    end

    // Test case 5: Invalid condition
    s = 1; r = 1; 
    #10; // Wait for clock edge
    if (q !== 1'bx || qbar !== 1'bx) begin
      $display("FAIL: Test case 5 failed (Invalid condition)");
      $finish;
    end

    // Test case 6: Reset after invalid condition
    s = 0; r = 1; 
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Test case 6 failed (Reset after invalid condition)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule