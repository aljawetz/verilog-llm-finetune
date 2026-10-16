`timescale 1ns/1ps

module tb_lcd_driver;

  // Inputs
  reg [3:0] alarm_time;
  reg [3:0] current_time;
  reg show_alarm;
  reg show_new_time;
  reg [3:0] key;

  // Outputs
  wire [7:0] display_time;
  wire sound_alarm;

  // Instantiate the Unit Under Test (UUT)
  lcd_driver uut (
    .alarm_time(alarm_time),
    .current_time(current_time),
    .show_alarm(show_alarm),
    .show_new_time(show_new_time),
    .key(key),
    .display_time(display_time),
    .sound_alarm(sound_alarm)
  );

  initial begin
    // Initialize Inputs
    alarm_time = 4'b0000;
    current_time = 4'b0000;
    show_alarm = 0;
    show_new_time = 0;
    key = 4'b0000;

    // Test case 1: Show current time
    #10;
    current_time = 4'b0010; // Set current time to 2
    show_alarm = 0;
    show_new_time = 0;
    #10;
    if (display_time !== 8'h32) $display("FAIL: Expected display_time to be 2 when showing current time");
    
    // Test case 2: Show alarm time
    #10;
    alarm_time = 4'b0100; // Set alarm time to 4
    show_alarm = 1;
    #10;
    if (display_time !== 8'h34) $display("FAIL: Expected display_time to be 4 when showing alarm time");

    // Test case 3: Show new time
    #10;
    key = 4'b0011; // Set key to 3
    show_alarm = 0;
    show_new_time = 1;
    #10;
    if (display_time !== 8'h33) $display("FAIL: Expected display_time to be 3 when showing new time");

    // Test case 4: Sound alarm when current time equals alarm time
    #10;
    current_time = 4'b0100; // Set current time to 4
    #10;
    if (sound_alarm !== 1'b1) $display("FAIL: Expected sound_alarm to be 1 when current time equals alarm time");

    // Test case 5: No sound alarm when current time does not equal alarm time
    #10;
    current_time = 4'b0010; // Set current time to 2
    #10;
    if (sound_alarm !== 1'b0) $display("FAIL: Expected sound_alarm to be 0 when current time does not equal alarm time");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule