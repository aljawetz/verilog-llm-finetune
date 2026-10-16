`timescale 1ns/1ps

module tb_fifo;

  // Parameters
  parameter WIDTH = 8;
  parameter DEPTH = 4;

  // Testbench signals
  reg rst_n;
  reg clk;
  reg [WIDTH-1:0] data_in;
  wire [WIDTH-1:0] data_out;
  reg clear;
  reg wr_en;
  reg rd_en;
  wire full;
  wire empty;

  // Instantiate the FIFO module
  fifo #(WIDTH, DEPTH) uut (
    .rst_n(rst_n),
    .clk(clk),
    .data_in(data_in),
    .data_out(data_out),
    .clear(clear),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    clear = 0;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'h00;

    // Apply reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test writing to FIFO
    wr_en = 1;
    data_in = 8'hAA; // Write data 0xAA
    #10;
    if (full) $display("FAIL: FIFO should not be full after one write");
    
    data_in = 8'hBB; // Write data 0xBB
    #10;
    if (full) $display("FAIL: FIFO should not be full after two writes");

    // Read from FIFO
    rd_en = 1;
    #10;
    if (data_out !== 8'hAA) $display("FAIL: Expected data_out to be 0xAA");
    
    rd_en = 0; // Stop reading
    #10;

    // Clear FIFO
    clear = 1;
    #10;
    clear = 0;

    // Check empty status
    if (!empty) $display("FAIL: FIFO should be empty after clear");

    // Fill FIFO
    wr_en = 1;
    data_in = 8'hCC; // Write data 0xCC
    #10;
    data_in = 8'hDD; // Write data 0xDD
    #10;
    data_in = 8'hEE; // Write data 0xEE
    #10;
    data_in = 8'hFF; // Write data 0xFF
    #10;

    if (!full) $display("FAIL: FIFO should be full after filling");

    // Attempt to write when full
    data_in = 8'h11; // Write data 0x11
    #10;
    if (full) $display("FAIL: FIFO should still be full and not accept new data");

    // Read all data
    rd_en = 1;
    #10;
    if (data_out !== 8'hCC) $display("FAIL: Expected data_out to be 0xCC");
    #10;
    if (data_out !== 8'hDD) $display("FAIL: Expected data_out to be 0xDD");
    #10;
    if (data_out !== 8'hEE) $display("FAIL: Expected data_out to be 0xEE");
    #10;
    if (data_out !== 8'hFF) $display("FAIL: Expected data_out to be 0xFF");
    #10;

    if (!empty) $display("FAIL: FIFO should be empty after reading all data");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule