`timescale 1ns/1ps

module tb_adv_dbg_if_cpu1_crc32;

  reg clk;
  reg data;
  reg enable;
  reg shift;
  reg clr;
  reg rst;
  wire [31:0] crc_out;
  wire serial_out;

  // Instantiate the module under test (uut)
  adv_dbg_if_cpu1_crc32 uut (
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
    // Initialize inputs
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

    // Test 2: Enable CRC computation with data
    enable = 1;
    data = 1; // Input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC value should change after enabling with data");
      $finish;
    end

    // Test 3: Shift the CRC value
    shift = 1;
    #10;
    shift = 0; // Disable shift
    if (crc_out[31] !== 1'b0) begin
      $display("FAIL: CRC value should shift left");
      $finish;
    end

    // Test 4: Clear the CRC
    clr = 1;
    #10;
    clr = 0; // Disable clear
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: CRC value should be reset to ffffffff after clear");
      $finish;
    end

    // Test 5: Check serial output
    if (serial_out !== crc_out[0]) begin
      $display("FAIL: Serial output does not match LSB of CRC");
      $finish;
    end

    // Test 6: Enable CRC computation with different data
    data = 0; // Change input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC value should change after enabling with new data");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule