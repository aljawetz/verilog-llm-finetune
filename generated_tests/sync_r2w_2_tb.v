`timescale 1ns/1ps

module tb_sync_r2w;
  parameter ADDR_SIZE = 12;
  
  reg [ADDR_SIZE:0] rptr;
  reg wclk;
  reg wrst_n;
  wire [ADDR_SIZE:0] wq2_rptr;

  // Instantiate the module under test (uut)
  sync_r2w #(ADDR_SIZE) uut (
    .wq2_rptr(wq2_rptr),
    .rptr(rptr),
    .wclk(wclk),
    .wrst_n(wrst_n)
  );

  // Clock generation
  initial begin
    wclk = 0;
    forever #5 wclk = ~wclk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    wrst_n = 0;
    rptr = 12'b0;

    // Apply reset
    #10;
    wrst_n = 1; // Release reset

    // Test case 1: Check output after reset
    #10;
    if (wq2_rptr !== 13'b0) begin
      $display("FAIL: Output not zero after reset");
      $finish;
    end

    // Test case 2: Drive rptr and check synchronization
    rptr = 12'b000000000001; // Set rptr to 1
    #10;
    if (wq2_rptr !== 13'b000000000000) begin
      $display("FAIL: wq2_rptr should be 0 after first clock");
      $finish;
    end

    // Test case 3: Check output after one more clock
    #10;
    if (wq2_rptr !== 13'b000000000001) begin
      $display("FAIL: wq2_rptr should be 1 after second clock");
      $finish;
    end

    // Test case 4: Change rptr and check synchronization
    rptr = 12'b000000000010; // Set rptr to 2
    #10;
    if (wq2_rptr !== 13'b000000000001) begin
      $display("FAIL: wq2_rptr should still be 1 after third clock");
      $finish;
    end

    // Test case 5: Check output after one more clock
    #10;
    if (wq2_rptr !== 13'b000000000010) begin
      $display("FAIL: wq2_rptr should be 2 after fourth clock");
      $finish;
    end

    // Test case 6: Test reset functionality
    #10;
    wrst_n = 0; // Assert reset
    #10;
    if (wq2_rptr !== 13'b0) begin
      $display("FAIL: Output not zero after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule