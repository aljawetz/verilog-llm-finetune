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
    pll_M = 8'b00000001;
    pll_N = 5'b00001;

    // Wait for a few clock cycles
    #10;

    // Check output when PLL is active
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock when active");
      $finish;
    end

    // Test sleep functionality
    pll_asleep = 1;
    #10;

    // Check output when PLL is asleep
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock when asleep");
      $finish;
    end

    // Test reset functionality
    pll_RESET = 1;
    #10;
    pll_RESET = 0;

    // Check output after reset
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock after reset");
      $finish;
    end

    // Final check
    pll_asleep = 0; // Reactivate PLL
    #10;
    if (plloutclk !== pllrefclk) begin
      $display("FAIL: Output clock does not match reference clock after reactivation");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule