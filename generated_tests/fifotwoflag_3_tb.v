`timescale 1ns/1ps

module tb_fifotwoflag;

  reg clk;
  reg reset;
  reg push;
  reg pull;
  reg [7:0] din;
  wire full;
  wire empty;
  wire [7:0] dout;
  wire [7:0] mdin;
  wire write;
  wire [15:0] addrw;
  wire [15:0] addrr;

  // Instantiate the Unit Under Test (UUT)
  fifotwoflag uut (
    .clk(clk),
    .reset(reset),
    .push(push),
    .pull(pull),
    .din(din),
    .full(full),
    .empty(empty),
    .dout(dout),
    .mdin(mdin),
    .write(write),
    .addrw(addrw),
    .addrr(addrr)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    push = 0;
    pull = 0;
    din = 8'h00;

    // Release reset
    #10 reset = 0;

    // Test pushing data into FIFO
    for (integer i = 0; i < 10; i = i + 1) begin
      din = i;
      push = 1;
      #10 push = 0;
      if (full) begin
        $display("FAIL: FIFO should not be full after pushing %d", i);
        $finish;
      end
    end

    // Check if FIFO is not full
    if (!full) begin
      $display("PASS: FIFO is not full after pushing 10 elements");
    end else begin
      $display("FAIL: FIFO should be full after pushing 10 elements");
      $finish;
    end

    // Test pulling data from FIFO
    for (integer i = 0; i < 10; i = i + 1) begin
      pull = 1;
      #10 pull = 0;
      if (empty) begin
        $display("FAIL: FIFO should not be empty after pulling %d", i);
        $finish;
      end
    end

    // Check if FIFO is empty after pulling all elements
    if (empty) begin
      $display("PASS: FIFO is empty after pulling all elements");
    end else begin
      $display("FAIL: FIFO should be empty after pulling all elements");
      $finish;
    end

    // End simulation
    $finish;
  end

endmodule