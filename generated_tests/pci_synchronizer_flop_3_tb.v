`timescale 1ns/1ps

module tb_pci_synchronizer_flop;

  parameter WIDTH = 2;
  parameter RESET_VAL = 2'b00;

  reg [WIDTH-1:0] data_in;
  reg clk_out;
  reg async_reset;
  wire [WIDTH-1:0] sync_data_out;

  // Instantiate the Unit Under Test (UUT)
  pci_synchronizer_flop #(
    .width(WIDTH),
    .reset_val(RESET_VAL)
  ) uut (
    .data_in(data_in),
    .clk_out(clk_out),
    .sync_data_out(sync_data_out),
    .async_reset(async_reset)
  );

  // Clock generation
  initial begin
    clk_out = 0;
    forever #5 clk_out = ~clk_out; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    async_reset = 1;
    data_in = 2'b00;

    // Wait for a clock edge
    #10;

    // Release reset
    async_reset = 0;

    // Test case 1: Check reset value
    #10;
    if (sync_data_out !== RESET_VAL) begin
      $display("FAIL: Expected sync_data_out to be %b after reset, got %b", RESET_VAL, sync_data_out);
      $finish;
    end

    // Test case 2: Check data synchronization
    data_in = 2'b11;
    #10;
    if (sync_data_out !== 2'b11) begin
      $display("FAIL: Expected sync_data_out to be 2'b11, got %b", sync_data_out);
      $finish;
    end

    // Test case 3: Change data and check synchronization
    data_in = 2'b01;
    #10;
    if (sync_data_out !== 2'b01) begin
      $display("FAIL: Expected sync_data_out to be 2'b01, got %b", sync_data_out);
      $finish;
    end

    // Test case 4: Assert reset and check output
    async_reset = 1;
    #10;
    if (sync_data_out !== RESET_VAL) begin
      $display("FAIL: Expected sync_data_out to be %b after reset, got %b", RESET_VAL, sync_data_out);
      $finish;
    end

    // Test case 5: Release reset and check synchronization again
    async_reset = 0;
    data_in = 2'b10;
    #10;
    if (sync_data_out !== 2'b10) begin
      $display("FAIL: Expected sync_data_out to be 2'b10, got %b", sync_data_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule