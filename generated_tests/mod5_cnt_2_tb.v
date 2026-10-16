`timescale 1ns/1ps

module tb_mod5_cnt;
  reg clk;
  reg rst;
  wire [3:0] cnt;

  // Instantiate the module under test (uut)
  mod5_cnt uut (
    .clk(clk),
    .rst(rst),
    .cnt(cnt)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;

    // Check counter values
    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd0) $display("FAIL: Expected cnt = 0 after reset, got cnt = %d", cnt);

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd1) $display("FAIL: Expected cnt = 1, got cnt = %d", cnt);

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd2) $display("FAIL: Expected cnt = 2, got cnt = %d", cnt);

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd3) $display("FAIL: Expected cnt = 3, got cnt = %d", cnt);

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd0) $display("FAIL: Expected cnt = 0 after reaching 4, got cnt = %d", cnt);

    // Test reset functionality
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'd0) $display("FAIL: Expected cnt = 0 after reset, got cnt = %d", cnt);

    // Finish simulation
    $display("PASS");
    $finish;
  end
endmodule