`timescale 1ns/1ps

module tb_adv_dbg_if_wb_bytefifo;

  reg CLK;
  reg RST;
  reg [7:0] DATA_IN;
  wire [7:0] DATA_OUT;
  reg PUSH_POPn;
  reg EN;
  wire [3:0] BYTES_AVAIL;
  wire [3:0] BYTES_FREE;

  // Instantiate the Unit Under Test (UUT)
  adv_dbg_if_wb_bytefifo uut (
    .CLK(CLK),
    .RST(RST),
    .DATA_IN(DATA_IN),
    .DATA_OUT(DATA_OUT),
    .PUSH_POPn(PUSH_POPn),
    .EN(EN),
    .BYTES_AVAIL(BYTES_AVAIL),
    .BYTES_FREE(BYTES_FREE)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RST = 1;
    EN = 0;
    PUSH_POPn = 1; // Push operation
    DATA_IN = 8'h00;

    // Release reset
    #10;
    RST = 0;

    // Test pushing data into FIFO
    EN = 1;
    for (integer i = 0; i < 8; i = i + 1) begin
      DATA_IN = i;
      #10; // Wait for clock edge
      if (BYTES_AVAIL !== i + 1) begin
        $display("FAIL: Expected BYTES_AVAIL = %d, got %d", i + 1, BYTES_AVAIL);
        $finish;
      end
    end

    // Check that FIFO is full
    if (BYTES_AVAIL !== 4'h8) begin
      $display("FAIL: Expected BYTES_AVAIL = 8, got %d", BYTES_AVAIL);
      $finish;
    end

    // Test popping data from FIFO
    PUSH_POPn = 0; // Pop operation
    for (integer i = 0; i < 8; i = i + 1) begin
      #10; // Wait for clock edge
      if (BYTES_AVAIL !== 8 - (i + 1)) begin
        $display("FAIL: Expected BYTES_AVAIL = %d, got %d", 8 - (i + 1), BYTES_AVAIL);
        $finish;
      end
    end

    // Check that FIFO is empty
    if (BYTES_AVAIL !== 4'h0) begin
      $display("FAIL: Expected BYTES_AVAIL = 0, got %d", BYTES_AVAIL);
      $finish;
    end

    // Check BYTES_FREE
    if (BYTES_FREE !== 4'h8) begin
      $display("FAIL: Expected BYTES_FREE = 8, got %d", BYTES_FREE);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule