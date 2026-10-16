`timescale 1ns/1ps

module tb_read_write_fsm;

  reg clk;
  reg reset_b;
  reg cs;
  reg write;
  wire wr_en;
  wire rd_en;

  // Instantiate the module under test (uut)
  read_write_fsm uut (
    .clk(clk),
    .reset_b(reset_b),
    .cs(cs),
    .write(write),
    .wr_en(wr_en),
    .rd_en(rd_en)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_b = 0;
    cs = 0;
    write = 0;

    // Apply reset
    #10;
    reset_b = 1;

    // Test 1: Idle state
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Idle state outputs incorrect");
      $finish;
    end

    // Test 2: Chip select active, setup state
    cs = 1;
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Setup state outputs incorrect");
      $finish;
    end

    // Test 3: Write operation
    write = 1;
    #10;
    if (wr_en !== 1 || rd_en !== 0) begin
      $display("FAIL: Write state outputs incorrect");
      $finish;
    end

    // Test 4: Back to idle state after write
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Idle state outputs incorrect after write");
      $finish;
    end

    // Test 5: Chip select active, setup state for read
    cs = 1;
    write = 0;
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Setup state outputs incorrect for read");
      $finish;
    end

    // Test 6: Read operation
    #10;
    if (wr_en !== 0 || rd_en !== 1) begin
      $display("FAIL: Read state outputs incorrect");
      $finish;
    end

    // Test 7: Back to idle state after read
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Idle state outputs incorrect after read");
      $finish;
    end

    // Test 8: Chip select inactive
    cs = 0;
    #10;
    if (wr_en !== 0 || rd_en !== 0) begin
      $display("FAIL: Idle state outputs incorrect after cs deactivation");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule