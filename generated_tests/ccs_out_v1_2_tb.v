`timescale 1ns/1ps

module tb_ccs_out_v1;

  parameter integer width = 8;
  reg [width-1:0] idat;
  wire [width-1:0] dat;

  // Instantiate the module under test
  ccs_out_v1 #(.width(width)) uut (
    .dat(dat),
    .idat(idat)
  );

  initial begin
    // Initialize input
    idat = 0;

    // Test case 1: Check pass-through functionality
    idat = 8'hAA; // Set idat to 0xAA
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 1 failed, expected dat = %h, got dat = %h", idat, dat);
      $finish;
    end

    // Test case 2: Check another value
    idat = 8'h55; // Set idat to 0x55
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 2 failed, expected dat = %h, got dat = %h", idat, dat);
      $finish;
    end

    // Test case 3: Check all bits set
    idat = 8'hFF; // Set idat to 0xFF
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 3 failed, expected dat = %h, got dat = %h", idat, dat);
      $finish;
    end

    // Test case 4: Check all bits cleared
    idat = 8'h00; // Set idat to 0x00
    #10; // Wait for 10 time units
    if (dat !== idat) begin
      $display("FAIL: Test case 4 failed, expected dat = %h, got dat = %h", idat, dat);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule