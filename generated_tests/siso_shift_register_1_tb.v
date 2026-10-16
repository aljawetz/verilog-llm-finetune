`timescale 1ns/1ps

module tb_siso_shift_register;

  reg clk;
  reg rst;
  reg serial_in;
  wire serial_out;

  // Instantiate the module under test (uut)
  siso_shift_register uut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    serial_in = 0;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: Shift in 8 bits
    // Serial input: 10101010
    serial_in = 1; #10; // Shift in 1
    serial_in = 0; #10; // Shift in 0
    serial_in = 1; #10; // Shift in 1
    serial_in = 0; #10; // Shift in 0
    serial_in = 1; #10; // Shift in 1
    serial_in = 0; #10; // Shift in 0
    serial_in = 1; #10; // Shift in 1
    serial_in = 0; #10; // Shift in 0

    // Check output after shifting in 8 bits
    if (serial_out !== 1) begin
      $display("FAIL: Expected serial_out to be 1 after shifting in 10101010");
      $finish;
    end

    // Reset the shift register
    rst = 1; #10;
    rst = 0; #10;

    // Test case 2: Shift in 8 bits
    // Serial input: 11110000
    serial_in = 1; #10; // Shift in 1
    serial_in = 1; #10; // Shift in 1
    serial_in = 1; #10; // Shift in 1
    serial_in = 1; #10; // Shift in 1
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0

    // Check output after shifting in 8 bits
    if (serial_out !== 1) begin
      $display("FAIL: Expected serial_out to be 1 after shifting in 11110000");
      $finish;
    end

    // Reset the shift register
    rst = 1; #10;
    rst = 0; #10;

    // Test case 3: Shift in 8 bits
    // Serial input: 00000000
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0
    serial_in = 0; #10; // Shift in 0

    // Check output after shifting in 8 bits
    if (serial_out !== 0) begin
      $display("FAIL: Expected serial_out to be 0 after shifting in 00000000");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule