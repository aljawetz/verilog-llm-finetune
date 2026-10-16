`timescale 1ns/1ps

module tb_washing_machine_fsm;

  reg clk;
  reg reset;
  reg start;
  reg [7:0] water_level;
  reg door_closed;
  wire wash;
  wire rinse;
  wire spin;
  wire fault;

  // Instantiate the Unit Under Test (UUT)
  washing_machine_fsm uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .water_level(water_level),
    .door_closed(door_closed),
    .wash(wash),
    .rinse(rinse),
    .spin(spin),
    .fault(fault)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    start = 0;
    water_level = 8'd0;
    door_closed = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: Start washing with door closed and sufficient water
    door_closed = 1;
    start = 1;
    water_level = 8'd50; // Sufficient water
    #10;

    // Check state transitions
    if (uut.state !== 3'b001) $display("FAIL: Expected state FILLWATER after starting with sufficient water");
    
    // Fill water
    #10;
    if (uut.state !== 3'b010) $display("FAIL: Expected state WASHING after filling water");

    // Check washing output
    if (uut.wash !== 1) $display("FAIL: Expected wash signal to be high during washing");

    // Test case 2: Insufficient water during washing
    water_level = 8'd30; // Insufficient water
    #10;
    if (uut.state !== 3'b011) $display("FAIL: Expected state RINSING after insufficient water during washing");

    // Check rinsing output
    if (uut.rinse !== 1) $display("FAIL: Expected rinse signal to be high during rinsing");

    // Test case 3: Rinse to spin
    #10;
    if (uut.state !== 3'b100) $display("FAIL: Expected state SPINNING after rinsing");

    // Check spinning output
    if (uut.spin !== 1) $display("FAIL: Expected spin signal to be high during spinning");

    // Test case 4: Fault condition
    water_level = 8'd0; // No water
    #10;
    if (uut.state !== 3'b101) $display("FAIL: Expected state FAULT due to no water");

    // Check fault output
    if (uut.fault !== 1) $display("FAIL: Expected fault signal to be high during fault state");

    // Test case 5: Reset fault and return to idle
    door_closed = 1; // Close door to reset fault
    #10;
    if (uut.state !== 3'b000) $display("FAIL: Expected state IDLE after closing door in fault state");

    // Check idle state outputs
    if (uut.wash !== 0 || uut.rinse !== 0 || uut.spin !== 0 || uut.fault !== 0) 
      $display("FAIL: Expected all outputs to be low in IDLE state");

    // End of test
    $display("PASS");
    $finish;
  end

endmodule