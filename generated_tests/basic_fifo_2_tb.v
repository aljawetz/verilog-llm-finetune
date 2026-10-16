`timescale 1ns/1ps

module tb_basic_fifo;

  parameter fifo_width     = 2; // Adjusted for test simplicity
  parameter fifo_bit_depth = 2; // Adjusted for test simplicity

  reg clk_i;
  reg rst_i;
  reg [fifo_width-1:0] data_i;
  reg enq_i;
  reg deq_i;
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

  initial begin
    // Initialize Inputs
    clk_i = 0;
    rst_i = 1;
    data_i = 0;
    enq_i = 0;
    deq_i = 0;

    // Wait for global reset to finish
    #10;
    rst_i = 0;

    // Test 1: Enqueue data
    data_i = 2'b01; enq_i = 1; #10;
    if (full_o) $display("FAIL: FIFO should not be full after one enqueue");
    
    data_i = 2'b10; #10;
    if (full_o) $display("FAIL: FIFO should not be full after two enqueues");

    enq_i = 0; #10;

    // Test 2: Dequeue data
    deq_i = 1; #10;
    if (data_o !== 2'b01) $display("FAIL: Dequeued data should be 01");
    if (valid_o !== 1) $display("FAIL: Valid output should be high after dequeue");
    
    deq_i = 0; #10;

    // Test 3: Check count
    if (count_o !== 1) $display("FAIL: Count should be 1 after one enqueue and one dequeue");

    // Test 4: Fill FIFO
    enq_i = 1; data_i = 2'b11; #10;
    enq_i = 0; #10;
    if (count_o !== 2) $display("FAIL: Count should be 2 after two enqueues");

    // Test 5: Check full signal
    enq_i = 1; data_i = 2'b00; #10;
    if (!full_o) $display("FAIL: FIFO should be full after three enqueues");

    // Test 6: Attempt to enqueue when full
    enq_i = 1; data_i = 2'b01; #10;
    if (full_o) $display("FAIL: FIFO should still be full, no enqueue should occur");

    // Test 7: Dequeue all data
    deq_i = 1; #10;
    if (data_o !== 2'b11) $display("FAIL: Dequeued data should be 11");
    deq_i = 0; #10;

    deq_i = 1; #10;
    if (data_o !== 2'b01) $display("FAIL: Dequeued data should be 01");
    deq_i = 0; #10;

    // Test 8: Check empty condition
    if (count_o !== 0) $display("FAIL: Count should be 0 after dequeuing all data");

    // End simulation
    $display("PASS");
    $finish;
  end

  // Clock generation
  always #5 clk_i = ~clk_i;

endmodule