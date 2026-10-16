`timescale 1ns/1ps

module tb_sr_ff_async_rst;

  reg clk;
  reg rst;
  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR flip-flop
  sr_ff_async_rst uut (
    .clk(clk),
    .rst(rst),
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
    rst = 1; S = 0; R = 0;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set the flip-flop
    S = 1; R = 0; 
    #10;
    if (Q !== 1'b1 || Q_bar !== 1'b0) begin
      $display("FAIL: Test case 1 failed (Set)");
      $finish;
    end

    // Test case 2: Reset the flip-flop
    S = 0; R = 1; 
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Test case 2 failed (Reset)");
      $finish;
    end

    // Test case 3: Hold state
    S = 0; R = 0; 
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Test case 3 failed (Hold)");
      $finish;
    end

    // Test case 4: Invalid state (S=1, R=1)
    S = 1; R = 1; 
    #10;
    if (Q !== 1'bx || Q_bar !== 1'bx) begin
      $display("FAIL: Test case 4 failed (Invalid state)");
      $finish;
    end

    // Test case 5: Asynchronous reset
    rst = 1; 
    #10;
    if (Q !== 1'b0 || Q_bar !== 1'b1) begin
      $display("FAIL: Test case 5 failed (Asynchronous reset)");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule