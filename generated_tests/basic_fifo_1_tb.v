`timescale 1ns/1ps

module tb_basic_fifo;

  // Parameters
  parameter fifo_width = 2;
  parameter fifo_bit_depth = 2;

  // Inputs
  reg clk_i;
  reg rst_i;
  reg [fifo_width-1:0] data_i;
  reg enq_i;
  reg deq_i;

  // Outputs
  wire full_o;
  wire [fifo_bit_depth:0] count_o;
  wire [fifo_width-1:0] data_o;
  wire valid_o;

  // Instantiate the Unit Under Test (UUT)
  basic_fifo #(.fifo_width(fifo_width), .fifo_bit_depth(fifo_bit_depth)) uut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .data_i(data_i),
    .enq_i(enq_i),
    .full_o(full_o),
    .count_o(count_o),
    .data_o(data_o),
    .valid_o(valid_o),
    .deq_i(deq_i)
  );

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_i = 1;
    enq_i = 0;
    deq_i = 0;
    data_i = 0;

    // Release reset
    #10;
    rst_i = 0;

    // Test 1: Enqueue data
    data_i = 2'b01; enq_i = 1; #10;
    if (full_o !== 0) $display("FAIL: FIFO should not be full after first enqueue");
    
    data_i = 2'b10; #10;
    if (full_o !== 0) $display("FAIL: FIFO should not be full after second enqueue");

    enq_i = 0; #10;

    // Test 2: Check count
    if (count_o !== 2'b10) $display("FAIL: Count should be 2 after two enqueues");

    // Test 3: Dequeue data
    deq_i = 1; #10;
    if (data_o !== 2'b01) $display("FAIL: Output data should be 01 after first dequeue");
    if (count_o !== 2'b01) $display("FAIL: Count should be 1 after one dequeue");

    deq_i = 0; #10;

    // Test 4: Dequeue again
    deq_i = 1; #10;
    if (data_o !== 2'b10) $display("FAIL: Output data should be 10 after second dequeue");
    if (count_o !== 2'b00) $display("FAIL: Count should be 0 after second dequeue");

    deq_i = 0; #10;

    // Test 5: Check empty state
    if (valid_o !== 0) $display("FAIL: FIFO should not be valid after dequeuing all data");

    // Test 6: Enqueue when full
    enq_i = 1; data_i = 2'b11; #10;
    if (full_o !== 0) $display("FAIL: FIFO should not be full after enqueueing when empty");

    enq_i = 1; data_i = 2'b00; #10;
    if (full_o !== 0) $display("FAIL: FIFO should not be full after enqueueing when not full");

    // Finalize
    enq_i = 0; #10;
    if (count_o !== 2'b10) $display("FAIL: Count should be 2 after two enqueues again");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule