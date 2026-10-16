`timescale 1ns/1ps

module tb_ccs_out_v1;

  parameter integer width = 8;

  reg [width-1:0] idat;
  wire [width-1:0] dat;

  // Instantiate the module under test (uut)
  ccs_out_v1 uut (
    .dat(dat),
    .idat(idat)
  );

  initial begin
    // Initialize inputs
    idat = 0;

    // Test case 1: Check if output matches input
    idat = 8'b00000001; // Set input
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", idat, dat);
      $finish;
    end

    // Test case 2: Check another value
    idat = 8'b11111111; // Set input
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", idat, dat);
      $finish;
    end

    // Test case 3: Check zero value
    idat = 8'b00000000; // Set input
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", idat, dat);
      $finish;
    end

    // Test case 4: Check mid-range value
    idat = 8'b01010101; // Set input
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", idat, dat);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule