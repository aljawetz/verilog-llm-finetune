`timescale 1ns/1ps

module tb_clock_switch3_basic;

  // Inputs
  reg rst0_i;
  reg clk0_i;
  reg rst1_i;
  reg clk1_i;
  reg rst2_i;
  reg clk2_i;
  reg enable;
  reg [1:0] select;

  // Output
  wire clk_o;

  // Instantiate the Unit Under Test (UUT)
  clock_switch3_basic uut (
    .rst0_i(rst0_i),
    .clk0_i(clk0_i),
    .rst1_i(rst1_i),
    .clk1_i(clk1_i),
    .rst2_i(rst2_i),
    .clk2_i(clk2_i),
    .enable(enable),
    .select(select),
    .clk_o(clk_o)
  );

  // Clock generation
  initial begin
    clk0_i = 0;
    clk1_i = 0;
    clk2_i = 0;
    forever begin
      #5 clk0_i = ~clk0_i;
      #5 clk1_i = ~clk1_i;
      #5 clk2_i = ~clk2_i;
    end
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst0_i = 1;
    rst1_i = 1;
    rst2_i = 1;
    enable = 0;
    select = 2'b00;

    // Release resets
    #10;
    rst0_i = 0;
    rst1_i = 0;
    rst2_i = 0;

    // Test case 1: Enable clock 0
    enable = 1;
    select = 2'b00;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 when clock 0 is selected and enabled");

    // Test case 2: Enable clock 1
    select = 2'b01;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 when clock 1 is selected and enabled");

    // Test case 3: Enable clock 2
    select = 2'b10;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 when clock 2 is selected and enabled");

    // Test case 4: Disable all clocks
    enable = 0;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be 0 when all clocks are disabled");

    // Test case 5: Reset clock 0
    rst0_i = 1;
    #10;
    rst0_i = 0;
    select = 2'b00;
    enable = 1;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 after resetting clock 0 and enabling");

    // Test case 6: Reset clock 1
    rst1_i = 1;
    #10;
    rst1_i = 0;
    select = 2'b01;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 after resetting clock 1 and enabling");

    // Test case 7: Reset clock 2
    rst2_i = 1;
    #10;
    rst2_i = 0;
    select = 2'b10;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be 1 after resetting clock 2 and enabling");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule