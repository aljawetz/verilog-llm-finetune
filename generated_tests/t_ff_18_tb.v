`timescale 1ns/1ps

module tb_t_ff;

  reg t;
  reg clk;
  reg rst;
  wire qn;
  wire qnbar;

  // Instantiate the T flip-flop
  t_ff uut (
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
    // Initialize inputs
    t = 0;
    rst = 1;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test case 1: Check reset functionality
    if (qn !== 0) begin
      $display("FAIL: Reset did not set qn to 0");
      $finish;
    end

    // Test case 2: Toggle qn when t is high
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (qn !== 1) begin
      $display("FAIL: qn did not toggle to 1 when T is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn did not toggle to 0 when T is high");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set T low
    #10; // Wait for one clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn toggled when T is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn toggled when T is low");
      $finish;
    end

    // Test case 4: Toggle again with t high
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (qn !== 1) begin
      $display("FAIL: qn did not toggle to 1 when T is high again");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn did not toggle to 0 when T is high again");
      $finish;
    end

    // Test case 5: Check qnbar output
    if (qnbar !== ~qn) begin
      $display("FAIL: qnbar is not the complement of qn");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule