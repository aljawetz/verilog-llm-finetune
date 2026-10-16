`timescale 1ns/1ps

module tb_LogicProbe_sampler;

  reg clock;
  reg reset;
  reg trigger;
  reg sample;
  reg [127:0] data_in;
  wire full;
  reg [12:0] rdaddr;
  wire [7:0] data_out;

  // Instantiate the module under test
  LogicProbe_sampler uut (
    .clock(clock),
    .reset(reset),
    .trigger(trigger),
    .sample(sample),
    .data_in(data_in),
    .full(full),
    .rdaddr(rdaddr),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    trigger = 0;
    sample = 0;
    data_in = 128'h0;
    rdaddr = 0;

    // Release reset
    #10 reset = 0;

    // Test 1: Trigger and sample data
    data_in = 128'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
    trigger = 1;
    #10;
    sample = 1; // Sample data
    #10;
    trigger = 0; // Release trigger
    #10;

    // Check if data is captured correctly
    if (uut.mem0[0] !== 32'hA5A5A5A5) begin
      $display("FAIL: Data not captured correctly in mem0");
      $finish;
    end

    // Test 2: Continue sampling until full
    for (integer i = 1; i < 512; i = i + 1) begin
      data_in = {i, i, i, i}; // Sample data
      #10;
      sample = 1; // Sample data
      #10;
      sample = 0; // Stop sampling
    end

    // Check if full signal is asserted
    if (uut.full !== 1) begin
      $display("FAIL: Full signal not asserted after 512 samples");
      $finish;
    end

    // Test 3: Read data from memory
    rdaddr = 0;
    #10;
    if (data_out !== 8'hA5) begin
      $display("FAIL: Data out mismatch at rdaddr 0");
      $finish;
    end

    rdaddr = 1;
    #10;
    if (data_out !== 8'hA5) begin
      $display("FAIL: Data out mismatch at rdaddr 1");
      $finish;
    end

    // Test 4: Reset functionality
    reset = 1;
    #10;
    reset = 0;

    // Check if memory is cleared
    if (uut.full !== 0) begin
      $display("FAIL: Full signal not cleared after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule