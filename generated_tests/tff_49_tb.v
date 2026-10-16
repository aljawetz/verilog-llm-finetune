`timescale 1ns/1ps

module tb_tff;
  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
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
    #10; // Wait for 10ns

    // Test case 1: T = 0, Q should remain 1
    t = 0;
    #10; // Wait for 1 clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q=1, got Q=%b", q);
      $finish;
    end

    // Test case 2: T = 1, Q should toggle to 0
    t = 1;
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // Test case 3: T = 0, Q should remain 0
    t = 0;
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // Test case 4: T = 1, Q should toggle to 1
    t = 1;
    #10; // Wait for 1 clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q=1, got Q=%b", q);
      $finish;
    end

    // Test case 5: T = 0, Q should remain 1
    t = 0;
    #10; // Wait for 1 clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected Q=1, got Q=%b", q);
      $finish;
    end

    // Test case 6: T = 1, Q should toggle to 0
    t = 1;
    #10; // Wait for 1 clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected Q=0, got Q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule