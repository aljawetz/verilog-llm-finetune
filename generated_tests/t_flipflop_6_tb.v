`timescale 1ns/1ps

module tb_t_flipflop;

  reg t;
  reg clk;
  reg rst;
  wire qn;
  wire qnbar;

  // Instantiate the T flip-flop module
  t_flipflop uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .qn(qn),
    .qnbar(qnbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Assert reset
    t = 0;
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Check reset functionality
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset did not set qn to 0 and qnbar to 1");
      $finish;
    end

    // Test case 2: Toggle qn when t = 1
    t = 1; // Set t to 1
    #10; // Wait for one clock cycle
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: qn did not toggle to 1 when t = 1");
      $finish;
    end

    // Test case 3: Toggle qn back when t = 1
    #10; // Wait for one clock cycle
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: qn did not toggle back to 0 when t = 1");
      $finish;
    end

    // Test case 4: No toggle when t = 0
    t = 0; // Set t to 0
    #10; // Wait for one clock cycle
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: qn changed when t = 0");
      $finish;
    end

    // Test case 5: Toggle qn when t = 1 again
    t = 1; // Set t to 1
    #10; // Wait for one clock cycle
    if (qn !== 1 || qnbar !== 0) begin
      $display("FAIL: qn did not toggle to 1 when t = 1 again");
      $finish;
    end

    // Test case 6: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (qn !== 0 || qnbar !== 1) begin
      $display("FAIL: Reset did not set qn to 0 and qnbar to 1 again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule