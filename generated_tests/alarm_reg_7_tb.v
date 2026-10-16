`timescale 1ns/1ps

module tb_alarm_reg;

  // Inputs
  reg [3:0] new_alarm_ms_hr;
  reg [3:0] new_alarm_ls_hr;
  reg [3:0] new_alarm_ms_min;
  reg [3:0] new_alarm_ls_min;
  reg load_new_alarm;
  reg clock;
  reg reset;

  // Outputs
  wire [3:0] alarm_time_ms_hr;
  wire [3:0] alarm_time_ls_hr;
  wire [3:0] alarm_time_ms_min;
  wire [3:0] alarm_time_ls_min;

  // Instantiate the Unit Under Test (UUT)
  alarm_reg uut (
    .new_alarm_ms_hr(new_alarm_ms_hr),
    .new_alarm_ls_hr(new_alarm_ls_hr),
    .new_alarm_ms_min(new_alarm_ms_min),
    .new_alarm_ls_min(new_alarm_ls_min),
    .load_new_alarm(load_new_alarm),
    .clock(clock),
    .reset(reset),
    .alarm_time_ms_hr(alarm_time_ms_hr),
    .alarm_time_ls_hr(alarm_time_ls_hr),
    .alarm_time_ms_min(alarm_time_ms_min),
    .alarm_time_ls_min(alarm_time_ls_min)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize Inputs
    reset = 1;
    load_new_alarm = 0;
    new_alarm_ms_hr = 4'b0000;
    new_alarm_ls_hr = 4'b0000;
    new_alarm_ms_min = 4'b0000;
    new_alarm_ls_min = 4'b0000;

    // Wait for global reset
    #10;
    reset = 0;

    // Test 1: Load new alarm time
    new_alarm_ms_hr = 4'b0001; // 1 hour
    new_alarm_ls_hr = 4'b0010; // 2 hours
    new_alarm_ms_min = 4'b0011; // 3 minutes
    new_alarm_ls_min = 4'b0100; // 4 minutes
    load_new_alarm = 1;

    #10; // Wait for clock edge
    load_new_alarm = 0;

    // Check loaded values
    if (alarm_time_ms_hr !== 4'b0001) $display("FAIL: Expected alarm_time_ms_hr = 0001, got %b", alarm_time_ms_hr);
    if (alarm_time_ls_hr !== 4'b0010) $display("FAIL: Expected alarm_time_ls_hr = 0010, got %b", alarm_time_ls_hr);
    if (alarm_time_ms_min !== 4'b0011) $display("FAIL: Expected alarm_time_ms_min = 0011, got %b", alarm_time_ms_min);
    if (alarm_time_ls_min !== 4'b0100) $display("FAIL: Expected alarm_time_ls_min = 0100, got %b", alarm_time_ls_min);

    // Test 2: Reset the registers
    reset = 1;
    #10; // Wait for clock edge
    reset = 0;

    // Check reset values
    if (alarm_time_ms_hr !== 4'b0000) $display("FAIL: Expected alarm_time_ms_hr = 0000 after reset, got %b", alarm_time_ms_hr);
    if (alarm_time_ls_hr !== 4'b0000) $display("FAIL: Expected alarm_time_ls_hr = 0000 after reset, got %b", alarm_time_ls_hr);
    if (alarm_time_ms_min !== 4'b0000) $display("FAIL: Expected alarm_time_ms_min = 0000 after reset, got %b", alarm_time_ms_min);
    if (alarm_time_ls_min !== 4'b0000) $display("FAIL: Expected alarm_time_ls_min = 0000 after reset, got %b", alarm_time_ls_min);

    // Test 3: Load new alarm time again
    new_alarm_ms_hr = 4'b0101; // 5 hours
    new_alarm_ls_hr = 4'b0110; // 6 hours
    new_alarm_ms_min = 4'b0111; // 7 minutes
    new_alarm_ls_min = 4'b1000; // 8 minutes
    load_new_alarm = 1;

    #10; // Wait for clock edge
    load_new_alarm = 0;

    // Check loaded values
    if (alarm_time_ms_hr !== 4'b0101) $display("FAIL: Expected alarm_time_ms_hr = 0101, got %b", alarm_time_ms_hr);
    if (alarm_time_ls_hr !== 4'b0110) $display("FAIL: Expected alarm_time_ls_hr = 0110, got %b", alarm_time_ls_hr);
    if (alarm_time_ms_min !== 4'b0111) $display("FAIL: Expected alarm_time_ms_min = 0111, got %b", alarm_time_ms_min);
    if (alarm_time_ls_min !== 4'b1000) $display("FAIL: Expected alarm_time_ls_min = 1000, got %b", alarm_time_ls_min);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule