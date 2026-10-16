`timescale 1ns/1ps

module tb_alarm_reg;

  reg [3:0] new_alarm_ms_hr;
  reg [3:0] new_alarm_ls_hr;
  reg [3:0] new_alarm_ms_min;
  reg [3:0] new_alarm_ls_min;
  reg load_new_alarm;
  reg clock;
  reg reset;
  
  wire [3:0] alarm_time_ms_hr;
  wire [3:0] alarm_time_ls_hr;
  wire [3:0] alarm_time_ms_min;
  wire [3:0] alarm_time_ls_min;

  // Instantiate the module under test
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
    // Initialize signals
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
    #10;

    // Test 1: Load new alarm time
    new_alarm_ms_hr = 4'b0001; // 1 hour
    new_alarm_ls_hr = 4'b0010; // 2 hours
    new_alarm_ms_min = 4'b0011; // 3 minutes
    new_alarm_ls_min = 4'b0100; // 4 minutes
    load_new_alarm = 1;
    #10; // Wait for clock edge

    load_new_alarm = 0;
    #10;

    // Check loaded values
    if (alarm_time_ms_hr !== 4'b0001 || alarm_time_ls_hr !== 4'b0010 ||
        alarm_time_ms_min !== 4'b0011 || alarm_time_ls_min !== 4'b0100) begin
      $display("FAIL: Alarm time not loaded correctly");
      $finish;
    end

    // Test 2: Reset functionality
    reset = 1;
    #10; // Wait for clock edge
    reset = 0;
    #10;

    // Check reset values
    if (alarm_time_ms_hr !== 4'b0000 || alarm_time_ls_hr !== 4'b0000 ||
        alarm_time_ms_min !== 4'b0000 || alarm_time_ls_min !== 4'b0000) begin
      $display("FAIL: Alarm time not reset correctly");
      $finish;
    end

    // Test 3: Load another alarm time
    new_alarm_ms_hr = 4'b0100; // 4 hours
    new_alarm_ls_hr = 4'b0101; // 5 hours
    new_alarm_ms_min = 4'b0110; // 6 minutes
    new_alarm_ls_min = 4'b0111; // 7 minutes
    load_new_alarm = 1;
    #10; // Wait for clock edge

    load_new_alarm = 0;
    #10;

    // Check loaded values
    if (alarm_time_ms_hr !== 4'b0100 || alarm_time_ls_hr !== 4'b0101 ||
        alarm_time_ms_min !== 4'b0110 || alarm_time_ls_min !== 4'b0111) begin
      $display("FAIL: Alarm time not loaded correctly on second load");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule