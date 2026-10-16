`timescale 1ns/1ps

module tb_lcd_driver;

reg show_new_time;
reg show_a;
reg [3:0] alarm_time;
reg [3:0] current_time;
reg [3:0] key;
wire sound;
wire [7:0] display;

lcd_driver uut (
    .show_new_time(show_new_time),
    .show_a(show_a),
    .alarm_time(alarm_time),
    .current_time(current_time),
    .key(key),
    .sound(sound),
    .display(display)
);

initial begin
    // Test Case 1: Display current time
    show_new_time = 0;
    show_a = 0;
    current_time = 4'b0010; // 2
    alarm_time = 4'b0001;    // 1
    key = 4'b0000;           // 0
    #10;
    if (display !== 8'h32) $display("FAIL: Expected display 2, got %h", display);
    
    // Test Case 2: Display alarm time
    show_a = 1;
    #10;
    if (display !== 8'h31) $display("FAIL: Expected display 1, got %h", display);
    
    // Test Case 3: Display new time from key
    show_a = 0;
    show_new_time = 1;
    key = 4'b0101; // 5
    #10;
    if (display !== 8'h35) $display("FAIL: Expected display 5, got %h", display);
    
    // Test Case 4: Sound output when current time equals alarm time
    show_new_time = 0;
    show_a = 0;
    current_time = 4'b0001; // 1
    alarm_time = 4'b0001;    // 1
    #10;
    if (sound !== 1'b1) $display("FAIL: Expected sound to be 1, got %b", sound);
    
    // Test Case 5: No sound when current time does not equal alarm time
    current_time = 4'b0010; // 2
    #10;
    if (sound !== 1'b0) $display("FAIL: Expected sound to be 0, got %b", sound);
    
    // Test Case 6: Invalid display value
    current_time = 4'b1111; // Invalid
    alarm_time = 4'b0000;   // 0
    show_new_time = 0;
    show_a = 0;
    #10;
    if (display !== 8'h3A) $display("FAIL: Expected display ERROR, got %h", display);
    
    $display("PASS");
    $finish;
end

endmodule