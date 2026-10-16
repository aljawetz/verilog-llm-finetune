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
    alarm_time = 4'd0;
    current_time = 4'd0;
    show_alarm = 0;
    show_new_time = 0;
    key = 4'd0;

    // Test 1: Display current time
    #10;
    current_time = 4'd5;
    show_alarm = 0;
    show_new_time = 0;
    #10;
    if (display_time !== 8'h35) begin
      $display("FAIL: Expected display_time = 8'h35 for current_time = 4'd5");
      $finish;
    end

    // Test 2: Display alarm time
    #10;
    alarm_time = 4'd3;
    show_alarm = 1;
    show_new_time = 0;
    #10;
    if (display_time !== 8'h33) begin
      $display("FAIL: Expected display_time = 8'h33 for alarm_time = 4'd3");
      $finish;
    end

    // Test 3: Display new time from key
    #10;
    key = 4'd7;
    show_alarm = 0;
    show_new_time = 1;
    #10;
    if (display_time !== 8'h37) begin
      $display("FAIL: Expected display_time = 8'h37 for key = 4'd7");
      $finish;
    end

    // Test 4: Sound alarm when current time equals alarm time
    #10;
    alarm_time = 4'd2;
    current_time = 4'd2;
    show_alarm = 0;
    show_new_time = 0;
    #10;
    if (sound_alarm !== 1'b1) begin
      $display("FAIL: Expected sound_alarm = 1'b1 when current_time = alarm_time = 4'd2");
      $finish;
    end

    // Test 5: No sound alarm when current time does not equal alarm time
    #10;
    current_time = 4'd1;
    #10;
    if (sound_alarm !== 1'b0) begin
      $display("FAIL: Expected sound_alarm = 1'b0 when current_time != alarm_time");
      $finish;
    end

    // Test 6: Invalid display value
    #10;
    alarm_time = 4'd10; // Invalid value
    show_alarm = 1;
    show_new_time = 0;
    #10;
    if (display_time !== 8'h3A) begin
      $display("FAIL: Expected display_time = 8'h3A for invalid alarm_time = 4'd10");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule