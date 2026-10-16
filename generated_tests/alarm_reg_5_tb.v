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
    new_alarm_ms_hr = 4'b0000;
    new_alarm_ls_hr = 4'b0000;
    new_alarm_ms_min = 4'b0000;
    new_alarm_ls_min = 4'b0000;
    load_new_alarm = 0;
    reset = 0;

    // Test 1: Reset the registers
    reset = 1; #10;
    reset = 0; #10;

    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
      $display("FAIL: Reset did not clear registers");
      $finish;
    end

    // Test 2: Load new alarm time
    new_alarm_ms_hr = 4'b0010; // 2 hours
    new_alarm_ls_hr = 4'b0001; // 1 hour
    new_alarm_ms_min = 4'b0101; // 5 minutes
    new_alarm_ls_min = 4'b0010; // 2 minutes
    load_new_alarm = 1; #10;
    load_new_alarm = 0; #10;

    if (alarm_time_ms_hr !== 4'b0010 || alarm_time_ls_hr !== 4'b0001 || 
        alarm_time_ms_min !== 4'b0101 || alarm_time_ls_min !== 4'b0010) begin
      $display("FAIL: Failed to load new alarm time");
      $finish;
    end

    // Test 3: Reset again
    reset = 1; #10;
    reset = 0; #10;

    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
      $display("FAIL: Reset did not clear registers after loading");
      $finish;
    end

    // Test 4: Load another alarm time
    new_alarm_ms_hr = 4'b0001; // 1 hour
    new_alarm_ls_hr = 4'b0011; // 3 hours
    new_alarm_ms_min = 4'b0000; // 0 minutes
    new_alarm_ls_min = 4'b1001; // 9 minutes
    load_new_alarm = 1; #10;
    load_new_alarm = 0; #10;

    if (alarm_time_ms_hr !== 4'b0001 || alarm_time_ls_hr !== 4'b0011 || 
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b1001) begin
      $display("FAIL: Failed to load new alarm time again");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule