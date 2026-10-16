`timescale 1ns/1ps

module tb_aclk_alarm_reg;

  // Parameters
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

  // Instantiate the Unit Under Test (UUT)
  aclk_alarm_reg uut (
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
    #10;

    // Test loading new alarm values
    new_alarm_ms_hr = 4'b1010; // 10
    new_alarm_ls_hr = 4'b0101; // 5
    new_alarm_ms_min = 4'b0011; // 3
    new_alarm_ls_min = 4'b0001; // 1
    load_new_alarm = 1;
    
    // Wait for a clock cycle
    #10;
    load_new_alarm = 0; // Clear load signal

    // Check if the alarm time registers are updated correctly
    #10;
    if (alarm_time_ms_hr !== 4'b1010) $display("FAIL: alarm_time_ms_hr not updated correctly");
    if (alarm_time_ls_hr !== 4'b0101) $display("FAIL: alarm_time_ls_hr not updated correctly");
    if (alarm_time_ms_min !== 4'b0011) $display("FAIL: alarm_time_ms_min not updated correctly");
    if (alarm_time_ls_min !== 4'b0001) $display("FAIL: alarm_time_ls_min not updated correctly");

    // Reset the module
    reset = 1;
    #10;
    reset = 0;

    // Check if the alarm time registers are cleared
    #10;
    if (alarm_time_ms_hr !== 4'b0000) $display("FAIL: alarm_time_ms_hr not cleared on reset");
    if (alarm_time_ls_hr !== 4'b0000) $display("FAIL: alarm_time_ls_hr not cleared on reset");
    if (alarm_time_ms_min !== 4'b0000) $display("FAIL: alarm_time_ms_min not cleared on reset");
    if (alarm_time_ls_min !== 4'b0000) $display("FAIL: alarm_time_ls_min not cleared on reset");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule