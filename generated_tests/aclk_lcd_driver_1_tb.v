`timescale 1ns/1ps

module tb_aclk_lcd_driver;

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
  aclk_lcd_driver uut (
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
    alarm_time = 4'd0;
    current_time = 4'd0;
    show_alarm = 0;
    show_new_time = 0;
    key = 4'd0;

    // Test case 1: Display current time
    current_time = 4'd5;
    #10;
    if (display_time !== 8'h35) begin
      $display("FAIL: Expected display_time for current_time 5 is 8'h35, got %h", display_time);
      $finish;
    end

    // Test case 2: Display alarm time
    alarm_time = 4'd3;
    show_alarm = 1;
    #10;
    if (display_time !== 8'h33) begin
      $display("FAIL: Expected display_time for alarm_time 3 is 8'h33, got %h", display_time);
      $finish;
    end

    // Test case 3: Display key input
    key = 4'd7;
    show_alarm = 0;
    show_new_time = 1;
    #10;
    if (display_time !== 8'h37) begin
      $display("FAIL: Expected display_time for key 7 is 8'h37, got %h", display_time);
      $finish;
    end

    // Test case 4: Sound alarm when current time matches alarm time
    alarm_time = 4'd2;
    current_time = 4'd2;
    #10;
    if (sound_alarm !== 1'b1) begin
      $display("FAIL: Expected sound_alarm to be 1 when current_time matches alarm_time");
      $finish;
    end

    // Test case 5: No sound alarm when current time does not match alarm time
    current_time = 4'd1;
    #10;
    if (sound_alarm !== 1'b0) begin
      $display("FAIL: Expected sound_alarm to be 0 when current_time does not match alarm_time");
      $finish;
    end

    // Test case 6: Check for invalid display value
    key = 4'd15; // Invalid key
    show_new_time = 1;
    #10;
    if (display_time !== 8'h3A) begin
      $display("FAIL: Expected display_time for invalid key 15 is 8'h3A, got %h", display_time);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule