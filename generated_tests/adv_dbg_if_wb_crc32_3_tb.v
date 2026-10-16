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

  // Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    rst = 1;
    clr = 0;
    enable = 0;
    shift = 0;
    data = 0;

    // Wait for a few clock cycles
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test reset functionality
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Reset did not initialize crc_out correctly");
      $finish;
    end

    // Test clear functionality
    clr = 1;
    #10;
    clr = 0;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Clear did not initialize crc_out correctly");
      $finish;
    end

    // Enable CRC calculation
    enable = 1;

    // Test CRC calculation with data
    data = 1; // Input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC calculation failed to update with data");
      $finish;
    end

    // Shift the CRC value
    shift = 1;
    #10;
    shift = 0;

    // Check serial output
    if (serial_out !== crc_out[0]) begin
      $display("FAIL: Serial output does not match expected value");
      $finish;
    end

    // Test with more data
    data = 0; // Change input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC calculation failed to update with new data");
      $finish;
    end

    // Final checks
    enable = 0; // Disable CRC calculation
    #10;
    if (crc_out !== crc_out) begin
      $display("FAIL: CRC output changed when it should not have");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule