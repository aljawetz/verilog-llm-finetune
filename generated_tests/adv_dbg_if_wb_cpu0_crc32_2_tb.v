`timescale 1ns/1ps

module tb_adv_dbg_if_wb_cpu0_crc32;

  reg clk;
  reg data;
  reg enable;
  reg shift;
  reg clr;
  reg rst;
  wire [31:0] crc_out;
  wire serial_out;

  // Instantiate the module under test (uut)
  adv_dbg_if_wb_cpu0_crc32 uut (
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
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC should have changed after enabling with data");
      $finish;
    end

    // Test 3: Shift operation
    shift = 1;
    #10;
    if (crc_out[31] !== 0) begin
      $display("FAIL: CRC should shift left, MSB should be 0");
      $finish;
    end

    // Test 4: Clear operation
    clr = 1;
    #10;
    clr = 0; // Clear should reset CRC
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: CRC value is incorrect after clear");
      $finish;
    end

    // Test 5: Check serial output
    enable = 1;
    data = 1;
    #10;
    if (serial_out !== crc_out[0]) begin
      $display("FAIL: Serial output does not match expected CRC LSB");
      $finish;
    end

    // Test 6: Multiple data inputs
    data = 0; #10;
    data = 1; #10;
    data = 0; #10;
    data = 1; #10;

    // Final check
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC should have changed with multiple data inputs");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule