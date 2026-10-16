`timescale 1ns/1ps

module tb_mode_control;

  reg clk;
  reg reset;
  reg mode;
  reg valid_vote;
  reg [7:0] c1_vote;
  reg [7:0] c2_vote;
  reg [7:0] c3_vote;
  reg [7:0] c4_vote;
  reg c1_button_press;
  reg c2_button_press;
  reg c3_button_press;
  reg c4_button_press;
  wire [7:0] led;

  mode_control uut (
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .valid_vote(valid_vote),
    .c1_vote(c1_vote),
    .c2_vote(c2_vote),
    .c3_vote(c3_vote),
    .c4_vote(c4_vote),
    .c1_button_press(c1_button_press),
    .c2_button_press(c2_button_press),
    .c3_button_press(c3_button_press),
    .c4_button_press(c4_button_press),
    .led(led)
  );

  initial begin
    clk = 0;
    reset = 1;
    mode = 0;
    valid_vote = 0;
    c1_vote = 8'd1;
    c2_vote = 8'd2;
    c3_vote = 8'd3;
    c4_vote = 8'd4;
    c1_button_press = 0;
    c2_button_press = 0;
    c3_button_press = 0;
    c4_button_press = 0;

    #10 reset = 0; // Release reset

    // Test mode 0 with valid_vote
    valid_vote = 1;
    #10 valid_vote = 0; // Release valid_vote

    // Wait for LEDs to light up
    #100;
    if (led !== 8'hFF) begin
      $display("FAIL: LEDs did not light up in mode 0");
      $finish;
    end

    // Test mode 1 with button press
    mode = 1;
    c1_button_press = 1;
    #10 c1_button_press = 0;

    if (led !== c1_vote) begin
      $display("FAIL: LED did not show c1_vote");
      $finish;
    end

    c2_button_press = 1;
    #10 c2_button_press = 0;

    if (led !== c2_vote) begin
      $display("FAIL: LED did not show c2_vote");
      $finish;
    end

    c3_button_press = 1;
    #10 c3_button_press = 0;

    if (led !== c3_vote) begin
      $display("FAIL: LED did not show c3_vote");
      $finish;
    end

    c4_button_press = 1;
    #10 c4_button_press = 0;

    if (led !== c4_vote) begin
      $display("FAIL: LED did not show c4_vote");
      $finish;
    end

    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk; // Clock generation

endmodule