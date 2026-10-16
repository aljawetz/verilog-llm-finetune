`timescale 1ns/1ps

module tb_Day20_SR_FF;

  reg s;
  reg r;
  reg clk;
  reg rst;
  wire Q;

  // Instantiate the module under test
  Day20_SR_FF uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s = 0;
    r = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns

    // Deassert reset
    rst = 0;
    #10;

    // Test case 1: Set Q to 1
    s = 1; r = 0;
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Expected Q=1 after setting s=1, r=0");
      $finish;
    end

    // Test case 2: Reset Q to 0
    s = 0; r = 1;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q=0 after setting s=0, r=1");
      $finish;
    end

    // Test case 3: Maintain Q
    s = 0; r = 0;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q=0 after maintaining s=0, r=0");
      $finish;
    end

    // Test case 4: Set Q to 1 again
    s = 1; r = 0;
    #10;
    if (Q !== 1'b1) begin
      $display("FAIL: Expected Q=1 after setting s=1, r=0");
      $finish;
    end

    // Test case 5: Force high impedance
    s = 1; r = 1;
    #10;
    if (Q !== 1'bz) begin
      $display("FAIL: Expected Q=z after setting s=1, r=1");
      $finish;
    end

    // Test case 6: Reset again
    s = 0; r = 1;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q=0 after resetting with s=0, r=1");
      $finish;
    end

    // Test case 7: Check maintaining state
    s = 0; r = 0;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q=0 after maintaining with s=0, r=0");
      $finish;
    end

    // Test case 8: Assert reset again
    rst = 1;
    #10;
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q=0 after asserting reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule