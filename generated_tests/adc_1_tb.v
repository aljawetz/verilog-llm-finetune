`timescale 1ns/1ps

module tb_adc;

  // Parameters
  reg clk;
  reg reset;
  reg [11:0] voltage_in;
  reg [11:0] current_in;
  reg [11:0] temperature_in;
  wire [11:0] voltage_out;
  wire [11:0] current_out;
  wire [11:0] temperature_out;

  // Instantiate the Unit Under Test (UUT)
  adc uut (
    .clk(clk),
    .reset(reset),
    .voltage_in(voltage_in),
    .current_in(current_in),
    .temperature_in(temperature_in),
    .voltage_out(voltage_out),
    .current_out(current_out),
    .temperature_out(temperature_out)
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
    temperature_in = 12'h000;

    // Apply reset
    #10;
    reset = 0;

    // Test case 1: Check initial values after reset
    #10;
    if (voltage_out !== 12'h000 || current_out !== 12'h000 || temperature_out !== 12'h000) begin
      $display("FAIL: Initial values after reset are incorrect");
      $finish;
    end

    // Test case 2: Apply some values
    voltage_in = 12'hABC;
    current_in = 12'h123;
    temperature_in = 12'h456;
    #10;

    // Check outputs
    if (voltage_out !== 12'hABC || current_out !== 12'h123 || temperature_out !== 12'h456) begin
      $display("FAIL: Output values do not match input values");
      $finish;
    end

    // Test case 3: Apply new values
    voltage_in = 12'hFFF;
    current_in = 12'h000;
    temperature_in = 12'h7FF;
    #10;

    // Check outputs
    if (voltage_out !== 12'hFFF || current_out !== 12'h000 || temperature_out !== 12'h7FF) begin
      $display("FAIL: Output values do not match new input values");
      $finish;
    end

    // Test case 4: Assert reset functionality
    reset = 1;
    #10;
    reset = 0;

    // Check outputs after reset
    if (voltage_out !== 12'h000 || current_out !== 12'h000 || temperature_out !== 12'h000) begin
      $display("FAIL: Output values after reset are incorrect");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule