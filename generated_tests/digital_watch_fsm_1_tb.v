`timescale 1ns/1ps

module tb_digital_watch_fsm;
  reg clk;
  reg reset;
  reg mode_button;
  reg up;
  reg down;
  wire [5:0] hour;
  wire [5:0] minute;
  wire alarm_trigger;

  // Instantiate the module under test (uut)
  digital_watch_fsm uut (
    .clk(clk),
    .reset(reset),
    .mode_button(mode_button),
    .up(up),
    .down(down),
    .hour(hour),
    .minute(minute),
    .alarm_trigger(alarm_trigger)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    mode_button = 0;
    up = 0;
    down = 0;

    // Release reset
    #10 reset = 0;

    // Test DISPLAY_TIME state
    #10;
    if (hour !== 0 || minute !== 0) $display("FAIL: Initial time is not 00:00");
    
    // Test SET_HOUR state
    mode_button = 1; // Switch to SET_HOUR
    #10 mode_button = 0;
    up = 1; // Increment hour
    #10 up = 0;
    if (hour !== 1) $display("FAIL: Hour not set correctly to 1");
    
    // Test SET_MINUTE state
    mode_button = 1; // Switch to SET_MINUTE
    #10 mode_button = 0;
    up = 1; // Increment minute
    #10 up = 0;
    if (minute !== 1) $display("FAIL: Minute not set correctly to 1");

    // Test ALARM state
    mode_button = 1; // Switch to ALARM
    #10 mode_button = 0;
    up = 1; // Set alarm hour to 1
    #10 up = 0;
    if (uut.alarm_hour !== 1) $display("FAIL: Alarm hour not set correctly to 1");

    // Check alarm trigger
    if (hour == uut.alarm_hour) begin
      if (alarm_trigger !== 1) $display("FAIL: Alarm did not trigger at the correct time");
    end

    // Reset and check
    reset = 1;
    #10 reset = 0;
    if (hour !== 0 || minute !== 0 || alarm_trigger !== 0) $display("FAIL: State not reset correctly");

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule