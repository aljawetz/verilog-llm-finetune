`timescale 1ns/1ps

module tb_adv_dbg_if_wb_crc32;

  reg clk;
  reg data;
  reg enable;
  reg shift;
  reg clr;
  reg rst;
  wire [31:0] crc_out;
  wire serial_out;

  // Instantiate the module under test (uut)
  adv_dbg_if_wb_crc32 uut (
    .clk(clk),
    .data(data),
    .enable(enable),
    .shift(shift),
    .clr(clr),
    .rst(rst),
    .crc_out(crc_out),
    .serial_out(serial_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    clr = 0;
    enable = 0;
    shift = 0;
    data = 0;

    // Release reset
    #10;
    rst = 0;

    // Test 1: Check initial CRC value after reset
    #10;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Initial CRC value is incorrect after reset");
      $finish;
    end

    // Test 2: Enable CRC calculation with data
    enable = 1;
    data = 1; // Input data
    #10; // Wait for one clock cycle
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC value did not update with data input");
      $finish;
    end

    // Test 3: Clear CRC
    clr = 1;
    #10; // Wait for one clock cycle
    clr = 0; // Release clear
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: CRC value is incorrect after clear");
      $finish;
    end

    // Test 4: Shift operation
    enable = 1;
    data = 1; // Input data
    #10; // Wait for one clock cycle
    shift = 1; // Shift the CRC
    #10; // Wait for one clock cycle
    shift = 0; // Release shift
    if (crc_out[31] !== 0) begin
      $display("FAIL: CRC value did not shift correctly");
      $finish;
    end

    // Test 5: Check serial output
    if (serial_out !== crc_out[0]) begin
      $display("FAIL: Serial output does not match CRC LSB");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule