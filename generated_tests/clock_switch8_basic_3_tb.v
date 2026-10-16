`timescale 1ns/1ps

module tb_clock_switch8_basic;

  // Inputs
  reg rst0_i;
  reg clk0_i;
  reg rst1_i;
  reg clk1_i;
  reg rst2_i;
  reg clk2_i;
  reg rst3_i;
  reg clk3_i;
  reg rst4_i;
  reg clk4_i;
  reg rst5_i;
  reg clk5_i;
  reg rst6_i;
  reg clk6_i;
  reg rst7_i;
  reg clk7_i;
  reg enable;
  reg [2:0] select;

  // Output
  wire clk_o;

  // Instantiate the Unit Under Test (UUT)
  clock_switch8_basic uut (
    .rst0_i(rst0_i), 
    .clk0_i(clk0_i), 
    .rst1_i(rst1_i), 
    .clk1_i(clk1_i), 
    .rst2_i(rst2_i), 
    .clk2_i(clk2_i), 
    .rst3_i(rst3_i), 
    .clk3_i(clk3_i), 
    .rst4_i(rst4_i), 
    .clk4_i(clk4_i), 
    .rst5_i(rst5_i), 
    .clk5_i(clk5_i), 
    .rst6_i(rst6_i), 
    .clk6_i(clk6_i), 
    .rst7_i(rst7_i), 
    .clk7_i(clk7_i), 
    .enable(enable), 
    .select(select), 
    .clk_o(clk_o)
  );

  // Clock generation
  initial begin
    clk0_i = 0; clk1_i = 0; clk2_i = 0; clk3_i = 0;
    clk4_i = 0; clk5_i = 0; clk6_i = 0; clk7_i = 0;
    forever #5 clk0_i = ~clk0_i;
  end
  
  initial begin
    forever #5 clk1_i = ~clk1_i;
  end
  
  initial begin
    forever #5 clk2_i = ~clk2_i;
  end
  
  initial begin
    forever #5 clk3_i = ~clk3_i;
  end
  
  initial begin
    forever #5 clk4_i = ~clk4_i;
  end
  
  initial begin
    forever #5 clk5_i = ~clk5_i;
  end
  
  initial begin
    forever #5 clk6_i = ~clk6_i;
  end
  
  initial begin
    forever #5 clk7_i = ~clk7_i;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst0_i = 1; rst1_i = 1; rst2_i = 1; rst3_i = 1;
    rst4_i = 1; rst5_i = 1; rst6_i = 1; rst7_i = 1;
    enable = 0;
    select = 3'b000;

    // Release resets
    #10;
    rst0_i = 0; rst1_i = 0; rst2_i = 0; rst3_i = 0;
    rst4_i = 0; rst5_i = 0; rst6_i = 0; rst7_i = 0;

    // Test each clock selection
    enable = 1;

    // Select clock 0
    select = 3'b000; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 0");

    // Select clock 1
    select = 3'b001; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 1");

    // Select clock 2
    select = 3'b010; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 2");

    // Select clock 3
    select = 3'b011; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 3");

    // Select clock 4
    select = 3'b100; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 4");

    // Select clock 5
    select = 3'b101; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 5");

    // Select clock 6
    select = 3'b110; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 6");

    // Select clock 7
    select = 3'b111; #20;
    if (clk_o !== 1) $display("FAIL: Expected clk_o to be 1 when selecting clock 7");

    // Disable the clock
    enable = 0; #20;
    if (clk_o !== 0) $display("FAIL: Expected clk_o to be 0 when enable is low");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule