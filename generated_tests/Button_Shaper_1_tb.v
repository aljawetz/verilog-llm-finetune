`timescale 1ns/1ps

module tb_Button_Shaper;

  reg Button_in;
  reg clk;
  reg rst;
  wire Pulse_out;

  // Instantiate the Unit Under Test (UUT)
  Button_Shaper uut (
    .Button_in(Button_in),
    .clk(clk),
    .rst(rst),
    .Pulse_out(Pulse_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    Button_in = 0;
    rst = 0;

    // Apply reset
    #10;
    rst = 1; // Release reset
    #10;

    // Test case 1: Button pressed, expect Pulse_out to go high
    Button_in = 0; // Button not pressed
    #10;
    Button_in = 1; // Button pressed
    #10;
    if (Pulse_out !== 0) begin
      $display("FAIL: Pulse_out should be 0 when button is pressed but got %b", Pulse_out);
      $finish;
    end

    // Test case 2: Button released, expect Pulse_out to go high for one clock cycle
    Button_in = 0; // Button released
    #10;
    if (Pulse_out !== 1) begin
      $display("FAIL: Pulse_out should be 1 when button is released but got %b", Pulse_out);
      $finish;
    end

    // Test case 3: Wait state, expect Pulse_out to go low
    #10;
    if (Pulse_out !== 0) begin
      $display("FAIL: Pulse_out should be 0 in WAIT state but got %b", Pulse_out);
      $finish;
    end

    // Test case 4: Button pressed again, expect Pulse_out to go high
    #10;
    Button_in = 1; // Button pressed
    #10;
    if (Pulse_out !== 0) begin
      $display("FAIL: Pulse_out should be 0 when button is pressed but got %b", Pulse_out);
      $finish;
    end

    // Test case 5: Button released, expect Pulse_out to go high for one clock cycle
    Button_in = 0; // Button released
    #10;
    if (Pulse_out !== 1) begin
      $display("FAIL: Pulse_out should be 1 when button is released but got %b", Pulse_out);
      $finish;
    end

    // Final check: Ensure Pulse_out is low after the pulse
    #10;
    if (Pulse_out !== 0) begin
      $display("FAIL: Pulse_out should be 0 after pulse but got %b", Pulse_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule