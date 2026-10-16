`timescale 1ns/1ps

module tb_t_ff;
  reg clk;
  reg rst;
  reg t;
  wire q;

  // Instantiate the T flip-flop
  t_ff uut (
    .clk(clk),
    .rst(rst),
    .t(t),
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
    rst = 1;
    t = 0;

    // Wait for a clock cycle
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test case 1: T = 0, Q should remain the same
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected Q=1, got Q=%b", q);
      $finish;
    end

    // Test case 3: T = 1, Q should toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // Test case 4: T = 0, Q should remain the same
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // Test case 5: Assert reset functionality
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q=0 after reset, got Q=%b", q);
      $finish;
    end

    // Test case 6: T = 1 after reset, Q should toggle
    rst = 0;
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected Q=1 after reset and T=1, got Q=%b", q);
      $finish;
    end

    // Test case 7: T = 1, Q should toggle again
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected Q=0 after toggle, got Q=%b", q);
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end
endmodule