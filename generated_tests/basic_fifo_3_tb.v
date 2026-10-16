`timescale 1ns/1ps

module tb_basic_fifo;

  parameter fifo_width = 2;
  parameter fifo_bit_depth = 2;
  
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

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_i = 1;
    enq_i = 0;
    deq_i = 0;
    data_i = 0;

    // Release reset
    #10 rst_i = 0;

    // Test 1: Enqueue data
    data_i = 2'b01; enq_i = 1; #10;
    enq_i = 0; #10;
    if (full_o !== 1'b0 || count_o !== 1) $display("FAIL: Test 1 failed");

    // Test 2: Enqueue more data
    data_i = 2'b10; enq_i = 1; #10;
    enq_i = 0; #10;
    if (full_o !== 1'b0 || count_o !== 2) $display("FAIL: Test 2 failed");

    // Test 3: Dequeue data
    deq_i = 1; #10;
    deq_i = 0; #10;
    if (data_o !== 2'b01 || valid_o !== 1'b1 || count_o !== 1) $display("FAIL: Test 3 failed");

    // Test 4: Dequeue again
    deq_i = 1; #10;
    deq_i = 0; #10;
    if (valid_o !== 1'b0 || count_o !== 0) $display("FAIL: Test 4 failed");

    // Test 5: Enqueue until full
    data_i = 2'b11; enq_i = 1; #10;
    enq_i = 0; #10;
    data_i = 2'b00; enq_i = 1; #10;
    enq_i = 0; #10;
    if (full_o !== 1'b1 || count_o !== 2'b10) $display("FAIL: Test 5 failed");

    // Test 6: Attempt to enqueue when full
    data_i = 2'b01; enq_i = 1; #10;
    enq_i = 0; #10;
    if (full_o !== 1'b1 || count_o !== 2'b10) $display("FAIL: Test 6 failed");

    // Test 7: Dequeue until empty
    deq_i = 1; #10;
    deq_i = 0; #10;
    deq_i = 1; #10;
    deq_i = 0; #10;
    if (valid_o !== 1'b0 || count_o !== 0) $display("FAIL: Test 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule