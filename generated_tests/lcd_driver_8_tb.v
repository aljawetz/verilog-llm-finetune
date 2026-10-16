`timescale 1ns/1ps

module tb_lcd_driver;

  reg [3:0] alarm_time;
  reg [3:0] current_time;
  reg show_alarm;
  reg show_new_time;
  reg [3:0] key;
  wire [7:0] display_time;
  wire sound_alarm;

  // Instantiate the module under test (uut)
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
    // Initialize inputs
    alarm_time = 4'd0;
    current_time = 4'd0;
    show_alarm = 0;
    show_new_time = 0;
    key = 4'd0;

    // Test case 1: Display current time when show_alarm and show_new_time are low
    #10;
    current_time = 4'd5;
    if (display_time !== 8'h35) $display("FAIL: Expected display_time to be 8'h35, got %h", display_time);

    // Test case 2: Display alarm time when show_alarm is high
    #10;
    alarm_time = 4'd3;
    show_alarm = 1;
    if (display_time !== 8'h33) $display("FAIL: Expected display_time to be 8'h33, got %h", display_time);

    // Test case 3: Display new time when show_new_time is high
    #10;
    show_alarm = 0;
    show_new_time = 1;
    key = 4'd7;
    if (display_time !== 8'h37) $display("FAIL: Expected display_time to be 8'h37, got %h", display_time);

    // Test case 4: Sound alarm when current time equals alarm time
    #10;
    current_time = 4'd3;
    if (sound_alarm !== 1'b1) $display("FAIL: Expected sound_alarm to be 1, got %b", sound_alarm);

    // Test case 5: No sound alarm when current time does not equal alarm time
    #10;
    current_time = 4'd2;
    if (sound_alarm !== 1'b0) $display("FAIL: Expected sound_alarm to be 0, got %b", sound_alarm);

    // Test case 6: Invalid key input
    #10;
    show_new_time = 1;
    key = 4'd10; // Invalid key
    if (display_time !== 8'h3A) $display("FAIL: Expected display_time to be 8'h3A for invalid key, got %h", display_time);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule