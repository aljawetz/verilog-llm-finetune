`timescale 1ns/1ps

module tb_display;

  // Testbench signals
  reg clk;
  reg reset;
  reg [11:0] voltage_in;
  reg [11:0] current_in;
  reg [11:0] power_in;
  reg [11:0] temperature_in;
  reg [11:0] efficiency_in;

  wire [11:0] voltage_display;
  wire [11:0] current_display;
  wire [11:0] power_display;
  wire [11:0] temperature_display;
  wire [11:0] efficiency_display;

  // Instantiate the module under test (uut)
  display uut (
    .clk(clk),
    .reset(reset),
    .voltage_in(voltage_in),
    .current_in(current_in),
    .power_in(power_in),
    .temperature_in(temperature_in),
    .efficiency_in(efficiency_in),
    .voltage_display(voltage_display),
    .current_display(current_display),
    .power_display(power_display),
    .temperature_display(temperature_display),
    .efficiency_display(efficiency_display)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    voltage_in = 12'h000;
    current_in = 12'h000;
    power_in = 12'h000;
    temperature_in = 12'h000;
    efficiency_in = 12'h000;

    // Release reset
    #10 reset = 0;

    // Test case 1: Latch values
    voltage_in = 12'hABC;
    current_in = 12'h123;
    power_in = 12'h456;
    temperature_in = 12'h789;
    efficiency_in = 12'hFFF;
    #10; // Wait for one clock cycle

    if (voltage_display !== 12'hABC) $display("FAIL: voltage_display mismatch");
    if (current_display !== 12'h123) $display("FAIL: current_display mismatch");
    if (power_display !== 12'h456) $display("FAIL: power_display mismatch");
    if (temperature_display !== 12'h789) $display("FAIL: temperature_display mismatch");
    if (efficiency_display !== 12'hFFF) $display("FAIL: efficiency_display mismatch");

    // Test case 2: Reset functionality
    reset = 1;
    #10; // Wait for reset to take effect
    reset = 0;
    #10; // Wait for one clock cycle

    if (voltage_display !== 12'h000) $display("FAIL: voltage_display should be reset");
    if (current_display !== 12'h000) $display("FAIL: current_display should be reset");
    if (power_display !== 12'h000) $display("FAIL: power_display should be reset");
    if (temperature_display !== 12'h000) $display("FAIL: temperature_display should be reset");
    if (efficiency_display !== 12'h000) $display("FAIL: efficiency_display should be reset");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule