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
    forever #5 clock = ~clock; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    load_new_alarm = 0;
    new_alarm_ms_hr = 0;
    new_alarm_ls_hr = 0;
    new_alarm_ms_min = 0;
    new_alarm_ls_min = 0;

    // Wait for a clock cycle
    #10;

    // Release reset
    reset = 0;

    // Test 1: Check reset behavior
    #10;
    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
      $display("FAIL: Reset did not clear alarm times");
      $finish;
    end

    // Test 2: Load new alarm time
    new_alarm_ms_hr = 4'b0010; // 2
    new_alarm_ls_hr = 4'b0001; // 1
    new_alarm_ms_min = 4'b0100; // 4
    new_alarm_ls_min = 4'b0011; // 3
    load_new_alarm = 1;

    // Wait for a clock cycle
    #10;
    load_new_alarm = 0; // Disable loading

    // Check loaded values
    if (alarm_time_ms_hr !== 4'b0010 || alarm_time_ls_hr !== 4'b0001 || 
        alarm_time_ms_min !== 4'b0100 || alarm_time_ls_min !== 4'b0011) begin
      $display("FAIL: Loaded alarm times are incorrect");
      $finish;
    end

    // Test 3: Check that values do not change without load_new_alarm
    #10;
    if (alarm_time_ms_hr !== 4'b0010 || alarm_time_ls_hr !== 4'b0001 || 
        alarm_time_ms_min !== 4'b0100 || alarm_time_ls_min !== 4'b0011) begin
      $display("FAIL: Alarm times changed without load_new_alarm");
      $finish;
    end

    // Test 4: Reset again and check values
    #10;
    reset = 1; // Assert reset
    #10;
    reset = 0; // Release reset

    // Check reset behavior again
    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
      $display("FAIL: Reset did not clear alarm times on second reset");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule