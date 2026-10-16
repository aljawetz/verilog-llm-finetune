`timescale 1ns/1ps

module tb_five_bit_Counter;

  reg clock;
  reg [4:0] in;
  reg load;
  reg up;
  reg down;
  wire [4:0] counter;
  wire high;
  wire low;

  // Instantiate the module under test (uut)
  five_bit_Counter uut (
    .clock(clock),
    .in(in),
    .load(load),
    .up(up),
    .down(down),
    .counter(counter),
    .high(high),
    .low(low)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    load = 0;
    up = 0;
    down = 0;
    in = 5'b00000;

    // Test loading value
    in = 5'b01010; // Load 10
    load = 1;
    #10;
    load = 0;
    if (counter !== 5'b01010) begin
      $display("FAIL: Counter did not load correctly.");
      $finish;
    end

    // Test incrementing
    up = 1;
    #10;
    up = 0;
    if (counter !== 5'b01011) begin
      $display("FAIL: Counter did not increment correctly.");
      $finish;
    end

    // Test incrementing to max
    in = 5'b11110; // Load 30
    load = 1;
    #10;
    load = 0;
    up = 1;
    #10;
    up = 0;
    if (counter !== 5'b11111) begin
      $display("FAIL: Counter did not reach maximum value.");
      $finish;
    end

    // Test high signal
    if (high !== 1'b1) begin
      $display("FAIL: High signal not asserted at max value.");
      $finish;
    end

    // Test decrementing
    down = 1;
    #10;
    down = 0;
    if (counter !== 5'b11110) begin
      $display("FAIL: Counter did not decrement correctly.");
      $finish;
    end

    // Test low signal
    down = 1;
    in = 5'b00000; // Load 0
    load = 1;
    #10;
    load = 0;
    if (counter !== 5'b00000) begin
      $display("FAIL: Counter did not load zero correctly.");
      $finish;
    end
    if (low !== 1'b1) begin
      $display("FAIL: Low signal not asserted at zero value.");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule