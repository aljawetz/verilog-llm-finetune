`timescale 1ns/1ps

module tb_sync_w2r;
  parameter ADDR_SIZE = 12;
  
  reg [ADDR_SIZE:0] wptr;
  reg rclk;
  reg rrst_n;
  wire [ADDR_SIZE:0] rq2_wptr;

  // Instantiate the module under test (uut)
  sync_w2r #(ADDR_SIZE) uut (
    .rq2_wptr(rq2_wptr),
    .wptr(wptr),
    .rclk(rclk),
    .rrst_n(rrst_n)
  );

  // Clock generation
  initial begin
    rclk = 0;
    forever #5 rclk = ~rclk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rrst_n = 0; // Assert reset
    wptr = 0;
    #10; // Wait for a clock edge

    rrst_n = 1; // Deassert reset
    #10; // Wait for a clock edge

    // Test case 1: Check initial state after reset
    if (rq2_wptr !== 0) begin
      $display("FAIL: Initial state after reset is not zero");
      $finish;
    end

    // Test case 2: Write pointer transfer
    wptr = 12'hA; // Set write pointer
    #10; // Wait for a clock edge
    if (rq2_wptr !== 12'h0) begin
      $display("FAIL: rq2_wptr should be 0 after first clock edge");
      $finish;
    end

    // Test case 3: Check after second clock edge
    #10; // Wait for a clock edge
    if (rq2_wptr !== 12'hA) begin
      $display("FAIL: rq2_wptr should be A after second clock edge");
      $finish;
    end

    // Test case 4: Change write pointer
    wptr = 12'hF; // Change write pointer
    #10; // Wait for a clock edge
    if (rq2_wptr !== 12'hA) begin
      $display("FAIL: rq2_wptr should still be A before next clock edge");
      $finish;
    end

    // Test case 5: Check after third clock edge
    #10; // Wait for a clock edge
    if (rq2_wptr !== 12'hF) begin
      $display("FAIL: rq2_wptr should be F after third clock edge");
      $finish;
    end

    // Test case 6: Reset during operation
    rrst_n = 0; // Assert reset
    #10; // Wait for a clock edge
    if (rq2_wptr !== 0) begin
      $display("FAIL: rq2_wptr should be 0 after reset");
      $finish;
    end

    // Test case 7: Check after reset
    rrst_n = 1; // Deassert reset
    wptr = 12'h5; // Set write pointer
    #10; // Wait for a clock edge
    if (rq2_wptr !== 0) begin
      $display("FAIL: rq2_wptr should be 0 after reset and before next clock edge");
      $finish;
    end

    // Final check after second clock edge
    #10; // Wait for a clock edge
    if (rq2_wptr !== 12'h5) begin
      $display("FAIL: rq2_wptr should be 5 after second clock edge post-reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule