`timescale 1ns/1ps

module tb_sync_fifo;

  reg [7:0] data_in;
  reg clk;
  reg rst;
  reg rd;
  reg wr;
  wire empty;
  wire full;
  wire [3:0] fifo_cnt;
  wire [7:0] data_out;

  // Instantiate the Unit Under Test (UUT)
  sync_fifo uut (
    .data_in(data_in),
    .clk(clk),
    .rst(rst),
    .rd(rd),
    .wr(wr),
    .empty(empty),
    .full(full),
    .fifo_cnt(fifo_cnt),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    wr = 0;
    rd = 0;
    data_in = 8'h00;

    // Release reset
    #10;
    rst = 0;

    // Test writing to FIFO
    for (integer i = 0; i < 8; i = i + 1) begin
      @(posedge clk);
      wr = 1;
      data_in = i;
      #1;
      wr = 0;
      if (fifo_cnt !== i + 1) begin
        $display("FAIL: Expected fifo_cnt = %d, got %d", i + 1, fifo_cnt);
        $finish;
      end
    end

    // Check full condition
    @(posedge clk);
    wr = 1; // Try to write when full
    data_in = 8'hFF;
    #1;
    wr = 0;
    if (!full) begin
      $display("FAIL: FIFO should be full");
      $finish;
    end

    // Test reading from FIFO
    for (integer i = 0; i < 8; i = i + 1) begin
      @(posedge clk);
      rd = 1;
      #1;
      rd = 0;
      if (data_out !== i) begin
        $display("FAIL: Expected data_out = %h, got %h", i, data_out);
        $finish;
      end
      if (fifo_cnt !== 7 - i) begin
        $display("FAIL: Expected fifo_cnt = %d, got %d", 7 - i, fifo_cnt);
        $finish;
      end
    end

    // Check empty condition
    @(posedge clk);
    rd = 1; // Try to read when empty
    #1;
    rd = 0;
    if (!empty) begin
      $display("FAIL: FIFO should be empty");
      $finish;
    end

    // Final check
    @(posedge clk);
    if (fifo_cnt !== 0) begin
      $display("FAIL: Expected fifo_cnt = 0, got %d", fifo_cnt);
      $finish;
    end

    // If all tests passed
    $display("PASS");
    $finish;
  end

endmodule