`timescale 1ns/1ps

module tb_fifo;
  reg clk;
  reg resetn;
  reg wr_enb;
  reg rd_enb;
  reg [15:0] wr_data;
  wire [15:0] rd_data;
  wire f_full;
  wire f_empty;
  wire f_almostfull;
  wire f_almostempty;
  wire f_underrun;
  wire f_overrun;

  // Instantiate the FIFO module
  fifo uut (
    .clk(clk),
    .resetn(resetn),
    .wr_enb(wr_enb),
    .rd_enb(rd_enb),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .f_full(f_full),
    .f_empty(f_empty),
    .f_almostfull(f_almostfull),
    .f_almostempty(f_almostempty),
    .f_underrun(f_underrun),
    .f_overrun(f_overrun)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    resetn = 0;
    wr_enb = 0;
    rd_enb = 0;
    wr_data = 0;

    // Apply reset
    #10 resetn = 1;

    // Test writing to FIFO
    wr_enb = 1;
    wr_data = 16'hA5A5; // Write data
    #10;
    if (f_full) $display("FAIL: FIFO should not be full after one write");
    
    wr_data = 16'h5A5A; // Write more data
    #10;
    if (f_full) $display("FAIL: FIFO should not be full after two writes");

    // Fill the FIFO
    repeat (6) begin
      wr_data = $random; // Random data
      #10;
    end

    if (!f_full) $display("FAIL: FIFO should be full after 8 writes");
    
    // Attempt to write when full
    wr_enb = 1;
    wr_data = 16'hFFFF; // Attempt to write when full
    #10;
    if (!f_overrun) $display("FAIL: FIFO should indicate overrun when writing to full FIFO");

    // Start reading from FIFO
    wr_enb = 0;
    rd_enb = 1;
    #10;
    if (f_empty) $display("FAIL: FIFO should not be empty after one read");

    // Read all data
    repeat (8) begin
      #10;
    end

    if (!f_empty) $display("FAIL: FIFO should be empty after reading all data");

    // Attempt to read when empty
    rd_enb = 1; // Attempt to read when empty
    #10;
    if (!f_underrun) $display("FAIL: FIFO should indicate underrun when reading from empty FIFO");

    // End of test
    $display("PASS");
    $finish;
  end
endmodule