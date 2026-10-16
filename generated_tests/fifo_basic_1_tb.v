`timescale 1ns/1ps

module tb_fifo_basic;

  reg clk;
  reg rst;
  reg read;
  reg write;
  reg enable;
  reg [7:0] data_in;
  wire empty;
  wire full;
  wire [7:0] data_out;

  fifo_basic uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .read(read),
    .write(write),
    .enable(enable),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  initial begin
    clk = 0;
    rst = 1;
    read = 0;
    write = 0;
    enable = 1;
    data_in = 8'h00;

    // Reset the FIFO
    #5 rst = 0; // Release reset
    #5 rst = 1; // Apply reset again
    #5;

    // Test writing to FIFO
    enable = 1;
    write = 1;
    data_in = 8'hAA; // Write data
    #10;
    write = 0; // Stop writing

    // Check if FIFO is not empty and not full
    if (empty !== 1'b0) $display("FAIL: FIFO should not be empty after write");
    if (full !== 1'b0) $display("FAIL: FIFO should not be full after one write");

    // Test reading from FIFO
    read = 1;
    #10;
    read = 0; // Stop reading

    // Check if data_out is correct
    if (data_out !== 8'hAA) $display("FAIL: Data out should be 0xAA after reading");

    // Test filling the FIFO
    for (integer i = 0; i < 8; i = i + 1) begin
      data_in = i; // Write data 0 to 7
      write = 1;
      #10;
      write = 0;
      #5;
    end

    // Check if FIFO is full
    if (full !== 1'b1) $display("FAIL: FIFO should be full after 8 writes");

    // Test reading all data from FIFO
    for (integer i = 0; i < 8; i = i + 1) begin
      read = 1;
      #10;
      read = 0;

      // Check if data_out is correct
      if (data_out !== i) $display("FAIL: Data out should be %0d after reading", i);
    end

    // Check if FIFO is empty after all reads
    if (empty !== 1'b1) $display("FAIL: FIFO should be empty after all reads");

    // End simulation
    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk; // Clock generation

endmodule