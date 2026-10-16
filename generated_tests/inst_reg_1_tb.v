`timescale 1ns/1ps

module tb_inst_reg;

  parameter PA_DATA_WIDTH = 32;
  reg clk;
  reg rst_b;
  reg [PA_DATA_WIDTH-1:0] data_in;
  reg ir_wr;
  wire [PA_DATA_WIDTH-1:0] data_out;
  wire ir_wr_ack;

  // Instantiate the module under test (uut)
  inst_reg #(.PA_DATA_WIDTH(PA_DATA_WIDTH)) uut (
    .clk(clk),
    .rst_b(rst_b),
    .data_in(data_in),
    .ir_wr(ir_wr),
    .data_out(data_out),
    .ir_wr_ack(ir_wr_ack)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_b = 0;
    ir_wr = 0;
    data_in = 32'd0;

    // Apply reset
    #10;
    rst_b = 1;

    // Test 1: Write data to instruction register
    data_in = 32'hA5A5A5A5; // Test data
    ir_wr = 1; // Assert write
    #10; // Wait one clock cycle
    ir_wr = 0; // Deassert write
    #10; // Wait for acknowledge

    // Check if data_out is correct
    if (data_out !== 32'hA5A5A5A5) begin
      $display("FAIL: data_out mismatch, expected 0xA5A5A5A5, got 0x%h", data_out);
      $finish;
    end

    // Check if ir_wr_ack is asserted in the next cycle
    #10;
    if (ir_wr_ack !== 1'b1) begin
      $display("FAIL: ir_wr_ack not asserted after write");
      $finish;
    end

    // Test 2: Ensure ir_wr_ack is deasserted after one cycle
    #10;
    if (ir_wr_ack !== 1'b0) begin
      $display("FAIL: ir_wr_ack not deasserted after one cycle");
      $finish;
    end

    // Test 3: Write another data
    data_in = 32'h5A5A5A5A; // New test data
    ir_wr = 1; // Assert write
    #10; // Wait one clock cycle
    ir_wr = 0; // Deassert write
    #10; // Wait for acknowledge

    // Check if data_out is correct
    if (data_out !== 32'h5A5A5A5A) begin
      $display("FAIL: data_out mismatch, expected 0x5A5A5A5A, got 0x%h", data_out);
      $finish;
    end

    // Check if ir_wr_ack is asserted in the next cycle
    #10;
    if (ir_wr_ack !== 1'b1) begin
      $display("FAIL: ir_wr_ack not asserted after second write");
      $finish;
    end

    // Check if ir_wr_ack is deasserted after one cycle
    #10;
    if (ir_wr_ack !== 1'b0) begin
      $display("FAIL: ir_wr_ack not deasserted after second cycle");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule