`timescale 1ns/1ps

module tb_clock_switch4_basic;

  // Inputs
  reg rst0_i;
  reg clk0_i;
  reg rst1_i;
  reg clk1_i;
  reg rst2_i;
  reg clk2_i;
  reg rst3_i;
  reg clk3_i;
  reg enable;
  reg [1:0] select;

  // Outputs
  wire clk_o;

  // Instantiate the Unit Under Test (UUT)
  clock_switch4_basic uut (
    .rst0_i(rst0_i),
    .clk0_i(clk0_i),
    .rst1_i(rst1_i),
    .clk1_i(clk1_i),
    .rst2_i(rst2_i),
    .clk2_i(clk2_i),
    .rst3_i(rst3_i),
    .clk3_i(clk3_i),
    .enable(enable),
    .select(select),
    .clk_o(clk_o)
  );

  // Clock generation
  initial begin
    clk0_i = 0;
    clk1_i = 0;
    clk2_i = 0;
    clk3_i = 0;
    forever #5 clk0_i = ~clk0_i;
  end

  initial begin
    forever #7 clk1_i = ~clk1_i;
  end

  initial begin
    forever #11 clk2_i = ~clk2_i;
  end

  initial begin
    forever #13 clk3_i = ~clk3_i;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst0_i = 1; rst1_i = 1; rst2_i = 1; rst3_i = 1;
    enable = 0; select = 2'b00;
    #10;

    // Release resets
    rst0_i = 0; rst1_i = 0; rst2_i = 0; rst3_i = 0;
    #10;

    // Test case 1: Enable clock 0
    enable = 1; select = 2'b00;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clk0_i is high and selected");
    
    // Test case 2: Enable clock 1
    enable = 1; select = 2'b01;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clk1_i is high and selected");

    // Test case 3: Enable clock 2
    enable = 1; select = 2'b10;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clk2_i is high and selected");

    // Test case 4: Enable clock 3
    enable = 1; select = 2'b11;
    #20;
    if (clk_o !== 1) $display("FAIL: clk_o should be high when clk3_i is high and selected");

    // Test case 5: Disable all clocks
    enable = 0; select = 2'b00;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be low when enable is low");

    // Test case 6: Reset clock 0
    rst0_i = 1; #10; rst0_i = 0; select = 2'b00; enable = 1;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be low after reset of clk0_i");

    // Test case 7: Reset clock 1
    rst1_i = 1; #10; rst1_i = 0; select = 2'b01; enable = 1;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be low after reset of clk1_i");

    // Test case 8: Reset clock 2
    rst2_i = 1; #10; rst2_i = 0; select = 2'b10; enable = 1;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be low after reset of clk2_i");

    // Test case 9: Reset clock 3
    rst3_i = 1; #10; rst3_i = 0; select = 2'b11; enable = 1;
    #20;
    if (clk_o !== 0) $display("FAIL: clk_o should be low after reset of clk3_i");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule