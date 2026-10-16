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
    // Initialize inputs
    rst = 1;
    clr = 0;
    enable = 0;
    shift = 0;
    data = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Check reset behavior
    #10;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Reset did not set crc_out to 0xffffffff");
      $finish;
    end

    // Test case 2: Enable CRC calculation with data
    enable = 1;
    data = 1; // Input data
    #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC should change after enabling with data");
      $finish;
    end

    // Test case 3: Clear CRC
    clr = 1;
    #10;
    clr = 0;
    if (crc_out !== 32'hffffffff) begin
      $display("FAIL: Clear did not set crc_out to 0xffffffff");
      $finish;
    end

    // Test case 4: Shift operation
    enable = 0;
    shift = 1;
    #10;
    if (crc_out[31] !== 1'b0) begin
      $display("FAIL: Shift operation did not work as expected");
      $finish;
    end

    // Test case 5: Check serial output
    #10;
    if (serial_out !== crc_out[0]) begin
      $display("FAIL: Serial output does not match crc[0]");
      $finish;
    end

    // Test case 6: Multiple data inputs
    enable = 1;
    data = 1; #10;
    data = 0; #10;
    data = 1; #10;
    if (crc_out === 32'hffffffff) begin
      $display("FAIL: CRC should change with multiple data inputs");
      $finish;
    end

    // Final check
    #10;
    $display("PASS");
    $finish;
  end

endmodule