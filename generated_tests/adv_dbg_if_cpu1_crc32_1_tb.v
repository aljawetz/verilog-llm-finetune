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

  // Instantiate the Unit Under Test (UUT)
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

    // Wait for a clock cycle
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test clear functionality
    clr = 1;
    #10;
    clr = 0;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Clear did not reset CRC to 0xFFFFFFFF");
      $finish;
    end

    // Test enabling CRC calculation
    enable = 1;
    data = 1; // Input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC did not update with data input");
      $finish;
    end

    // Shift the CRC
    shift = 1;
    #10;
    shift = 0;
    if (crc_out[31] !== 1'b0) begin
      $display("FAIL: Shift did not work as expected");
      $finish;
    end

    // Test with multiple data inputs
    data = 1; // Input data
    #10;
    data = 0; // Input data
    #10;
    data = 1; // Input data
    #10;

    // Check CRC output after several inputs
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC did not update after multiple inputs");
      $finish;
    end

    // Test reset functionality
    rst = 1;
    #10;
    rst = 0;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Reset did not set CRC to 0xFFFFFFFF");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule