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
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    load_new_alarm = 0;
    new_alarm_ms_hr = 4'b0000;
    new_alarm_ls_hr = 4'b0000;
    new_alarm_ms_min = 4'b0000;
    new_alarm_ls_min = 4'b0000;

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;
    
    // Test 1: Load alarm time
    new_alarm_ms_hr = 4'b0010; // 2
    new_alarm_ls_hr = 4'b0001; // 1
    new_alarm_ms_min = 4'b0011; // 3
    new_alarm_ls_min = 4'b0000; // 0
    load_new_alarm = 1;
    #10; // Wait for clock edge
    load_new_alarm = 0;

    // Check the loaded values
    if (alarm_time_ms_hr !== 4'b0010) $display("FAIL: alarm_time_ms_hr mismatch");
    if (alarm_time_ls_hr !== 4'b0001) $display("FAIL: alarm_time_ls_hr mismatch");
    if (alarm_time_ms_min !== 4'b0011) $display("FAIL: alarm_time_ms_min mismatch");
    if (alarm_time_ls_min !== 4'b0000) $display("FAIL: alarm_time_ls_min mismatch");

    // Test 2: Reset functionality
    reset = 1;
    #10; // Wait for clock edge
    reset = 0;

    // Check that all outputs are reset
    if (alarm_time_ms_hr !== 4'b0000) $display("FAIL: alarm_time_ms_hr not reset");
    if (alarm_time_ls_hr !== 4'b0000) $display("FAIL: alarm_time_ls_hr not reset");
    if (alarm_time_ms_min !== 4'b0000) $display("FAIL: alarm_time_ms_min not reset");
    if (alarm_time_ls_min !== 4'b0000) $display("FAIL: alarm_time_ls_min not reset");

    // Test 3: Load new values after reset
    new_alarm_ms_hr = 4'b0100; // 4
    new_alarm_ls_hr = 4'b0010; // 2
    new_alarm_ms_min = 4'b0110; // 6
    new_alarm_ls_min = 4'b0001; // 1
    load_new_alarm = 1;
    #10; // Wait for clock edge
    load_new_alarm = 0;

    // Check the loaded values
    if (alarm_time_ms_hr !== 4'b0100) $display("FAIL: alarm_time_ms_hr mismatch after reset");
    if (alarm_time_ls_hr !== 4'b0010) $display("FAIL: alarm_time_ls_hr mismatch after reset");
    if (alarm_time_ms_min !== 4'b0110) $display("FAIL: alarm_time_ms_min mismatch after reset");
    if (alarm_time_ls_min !== 4'b0001) $display("FAIL: alarm_time_ls_min mismatch after reset");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule