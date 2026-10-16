`timescale 1ns/1ps

module tb_e203_subsys_pll;

  // Parameters
  reg pll_asleep;
  reg pllrefclk;
  wire plloutclk;
  reg pll_RESET;
  reg [1:0] pll_OD;
  reg [7:0] pll_M;
  reg [4:0] pll_N;

  // Instantiate the module under test (uut)
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
    pll_M = 8'b00000001;
    pll_N = 5'b00001;

    // Wait for a few clock cycles
    #10;

    // Check output when PLL is not asleep
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock when not asleep");
      $finish;
    end

    // Test sleep functionality
    pll_asleep = 1; // Put PLL to sleep
    #10;

    // Check output when PLL is asleep
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock should still match reference clock when asleep");
      $finish;
    end

    // Wake up PLL
    pll_asleep = 0;
    #10;

    // Final check
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock after waking up");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule