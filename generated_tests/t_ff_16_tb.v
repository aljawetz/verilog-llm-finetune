`timescale 1ns/1ps

module tb_t_ff;
  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop
  t_ff uut (
    .t(t),
    .clk(clk),
    .q(q)
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

    // Wait for a clock edge
    #10;
    if (q !== 1) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test toggling behavior
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to toggle to 0");
      $finish;
    end

    #10;  // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to toggle to 1");
      $finish;
    end

    // Test holding state when T is low
    t = 0; // Set T low
    #10;   // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to remain 1");
      $finish;
    end

    #10;  // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to remain 1");
      $finish;
    end

    // Test toggling again
    t = 1; // Set T high
    #10;   // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to toggle to 0");
      $finish;
    end

    #10;  // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to toggle to 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule