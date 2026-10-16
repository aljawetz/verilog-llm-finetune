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
    clk0_i = 0; clk1_i = 0; clk2_i = 0; clk3_i = 0;
    forever begin
      #5 clk0_i = ~clk0_i;
      #5 clk1_i = ~clk1_i;
      #5 clk2_i = ~clk2_i;
      #5 clk3_i = ~clk3_i;
    end
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

    // Test case 1: Select clk0
    enable = 1; select = 2'b00;
    #20;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should be high when clk0 is selected and enabled");
      $finish;
    end

    // Test case 2: Select clk1
    select = 2'b01;
    #20;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should be high when clk1 is selected and enabled");
      $finish;
    end

    // Test case 3: Select clk2
    select = 2'b10;
    #20;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should be high when clk2 is selected and enabled");
      $finish;
    end

    // Test case 4: Select clk3
    select = 2'b11;
    #20;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should be high when clk3 is selected and enabled");
      $finish;
    end

    // Test case 5: Disable all clocks
    enable = 0;
    #20;
    if (clk_o !== 0) begin
      $display("FAIL: clk_o should be low when all clocks are disabled");
      $finish;
    end

    // Test case 6: Check unselected clocks stall high
    enable = 1; select = 2'b00; // select clk0
    #20;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should be high when clk0 is selected and enabled");
      $finish;
    end

    // Check that other clocks are stalled high
    #10;
    if (clk_o !== 1) begin
      $display("FAIL: clk_o should remain high when clk0 is selected");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule