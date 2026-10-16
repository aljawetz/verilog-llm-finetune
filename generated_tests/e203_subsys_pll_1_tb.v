`timescale 1ns/1ps

module tb_e203_subsys_pll;

  // Parameters
  reg pll_asleep;
  reg pllrefclk;
  reg pll_RESET;
  reg [1:0] pll_OD;
  reg [7:0] pll_M;
  reg [4:0] pll_N;
  wire plloutclk;

  // Instantiate the Unit Under Test (UUT)
  e203_subsys_pll uut (
    .pll_asleep(pll_asleep),
    .pllrefclk(pllrefclk),
    .plloutclk(plloutclk),
    .pll_RESET(pll_RESET),
    .pll_OD(pll_OD),
    .pll_M(pll_M),
    .pll_N(pll_N)
  );

  // Clock generation
  initial begin
    pllrefclk = 0;
    forever #5 pllrefclk = ~pllrefclk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    pll_asleep = 0;
    pll_RESET = 0;
    pll_OD = 2'b00;
    pll_M = 8'h01; // Example value
    pll_N = 5'b00001; // Example value

    // Test 1: Check PLL output when not asleep
    #10;
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: PLL output not matching reference clock when not asleep");
      $finish;
    end

    // Test 2: Check PLL output when asleep
    pll_asleep = 1;
    #10;
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: PLL output should not change when asleep");
      $finish;
    end

    // Test 3: Reset the PLL
    pll_RESET = 1;
    #10;
    pll_RESET = 0;
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: PLL output not matching reference clock after reset");
      $finish;
    end

    // Test 4: Change PLL parameters
    pll_OD = 2'b01;
    pll_M = 8'h02; // Example value
    pll_N = 5'b00010; // Example value
    #10;
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: PLL output not matching reference clock after parameter change");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule