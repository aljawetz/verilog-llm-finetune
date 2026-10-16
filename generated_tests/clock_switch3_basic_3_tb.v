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

  // Testbench logic
  initial begin
    // Initialize inputs
    rst0_i = 1; rst1_i = 1; rst2_i = 1; enable = 0; select = 2'b00;
    #10;
    
    // Release resets
    rst0_i = 0; rst1_i = 0; rst2_i = 0;
    #10;

    // Test case 1: Enable clock 0
    enable = 1; select = 2'b00;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clock 0 is selected and enabled");

    // Test case 2: Enable clock 1
    select = 2'b01;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clock 1 is selected and enabled");

    // Test case 3: Enable clock 2
    select = 2'b10;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clock 2 is selected and enabled");

    // Test case 4: Disable all clocks
    enable = 0; select = 2'b00;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when all clocks are disabled");

    // Test case 5: Enable clock 2 with reset
    rst2_i = 1; #10; rst2_i = 0; enable = 1; select = 2'b10;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clock 2 is selected and enabled after reset");

    // Test case 6: Check for glitch-free switching
    select = 2'b01; #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clock 1 is selected and enabled after switching");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule