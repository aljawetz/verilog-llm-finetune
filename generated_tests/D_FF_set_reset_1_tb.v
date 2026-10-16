`timescale 1ns/1ps

module tb_D_FF_set_reset;

  reg D;
  reg clk;
  reg reset_n;
  reg set_n;
  wire Q;

  // Instantiate the module under test (uut)
  D_FF_set_reset uut (
    .D(D),
    .clk(clk),
    .reset_n(reset_n),
    .set_n(set_n),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    D = 0;
    reset_n = 1;
    set_n = 1;

    // Test 1: Check reset functionality
    reset_n = 0; // Assert reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0");
      $finish;
    end
    reset_n = 1; // Deassert reset

    // Test 2: Check set functionality
    D = 0; set_n = 0; // Assert set
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Set did not set Q to 1");
      $finish;
    end
    set_n = 1; // Deassert set

    // Test 3: Check D input functionality
    D = 1; #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D when set_n is high");
      $finish;
    end

    D = 0; #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not follow D when set_n is high");
      $finish;
    end

    // Test 4: Check synchronous set with D input
    D = 1; set_n = 0; // Assert set
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not set to 1 when set_n is low");
      $finish;
    end
    set_n = 1; // Deassert set

    // Test 5: Check reset while D is high
    D = 1; reset_n = 0; // Assert reset
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Reset did not set Q to 0 when D was high");
      $finish;
    end

    // Test 6: Check normal operation after reset
    reset_n = 1; D = 1; #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Q did not follow D after reset");
      $finish;
    end

    D = 0; #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Q did not follow D after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule