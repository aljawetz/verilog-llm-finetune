`timescale 1ns/1ps

module tb_dib_demux;

  parameter PA_DATA_WIDTH = 32;
  
  reg clk;
  reg rst_b;
  reg [PA_DATA_WIDTH-1:0] dib;
  reg dib_sel;
  reg ram_oe_ack;
  wire [PA_DATA_WIDTH-1:0] dib_id;
  wire [PA_DATA_WIDTH-1:0] dib_rb;
  wire dib_ack;

  // Instantiate the Unit Under Test (UUT)
  dib_demux #(.PA_DATA_WIDTH(PA_DATA_WIDTH)) uut (
    .clk(clk),
    .rst_b(rst_b),
    .dib(dib),
    .dib_sel(dib_sel),
    .ram_oe_ack(ram_oe_ack),
    .dib_id(dib_id),
    .dib_rb(dib_rb),
    .dib_ack(dib_ack)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_b = 0;
    dib = 32'h0;
    dib_sel = 0;
    ram_oe_ack = 0;

    // Release reset
    #10;
    rst_b = 1;

    // Test case 1: Select dib to dib_id
    dib = 32'hA5A5A5A5; // Input data
    dib_sel = 0; // Select dib_id
    #10; // Wait for a clock cycle
    ram_oe_ack = 1; // Acknowledge RAM output enable
    #10; // Wait for a clock cycle
    ram_oe_ack = 0; // Deassert acknowledge

    if (dib_id !== dib || dib_rb !== 32'h0 || dib_ack !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Select dib to dib_rb
    dib = 32'h5A5A5A5A; // New input data
    dib_sel = 1; // Select dib_rb
    #10; // Wait for a clock cycle
    ram_oe_ack = 1; // Acknowledge RAM output enable
    #10; // Wait for a clock cycle
    ram_oe_ack = 0; // Deassert acknowledge

    if (dib_rb !== dib || dib_id !== 32'hA5A5A5A5 || dib_ack !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check dib_ack deassertion
    dib_sel = 0; // Select dib_id
    #10; // Wait for a clock cycle
    ram_oe_ack = 0; // No acknowledge

    if (dib_ack !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Reset functionality
    rst_b = 0; // Assert reset
    #10; // Wait for a clock cycle
    rst_b = 1; // Release reset
    #10; // Wait for a clock cycle

    if (dib_id !== 32'h0 || dib_rb !== 32'h0 || dib_ack !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule