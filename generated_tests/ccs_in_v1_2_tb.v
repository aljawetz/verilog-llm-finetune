`timescale 1ns/1ps

module tb_ccs_in_v1;

  parameter integer width = 8;

  reg [width-1:0] dat;
  wire [width-1:0] idat;

  // Instantiate the module under test (uut)
  ccs_in_v1 #(.width(width)) uut (
    .idat(idat),
    .dat(dat)
  );

  initial begin
    // Initialize inputs
    dat = 0;

    // Test case 1: Check pass-through functionality
    dat = 8'hAA; // 10101010 in binary
    #10; // Wait for 10 time units
    if (idat !== dat) begin
      $display("FAIL: Test case 1 failed, expected %h but got %h", dat, idat);
      $finish;
    end

    // Test case 2: Check another value
    dat = 8'h55; // 01010101 in binary
    #10; // Wait for 10 time units
    if (idat !== dat) begin
      $display("FAIL: Test case 2 failed, expected %h but got %h", dat, idat);
      $finish;
    end

    // Test case 3: Check all bits set
    dat = 8'hFF; // 11111111 in binary
    #10; // Wait for 10 time units
    if (idat !== dat) begin
      $display("FAIL: Test case 3 failed, expected %h but got %h", dat, idat);
      $finish;
    end

    // Test case 4: Check all bits cleared
    dat = 8'h00; // 00000000 in binary
    #10; // Wait for 10 time units
    if (idat !== dat) begin
      $display("FAIL: Test case 4 failed, expected %h but got %h", dat, idat);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule