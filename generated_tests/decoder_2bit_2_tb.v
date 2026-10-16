`timescale 1ns/1ps

module tb_decoder_2bit;

  reg [1:0] i_addr;
  reg i_we;
  wire [3:0] o_decoder;

  // Instantiate the module under test (uut)
  decoder_2bit uut (
    .i_addr(i_addr),
    .i_we(i_we),
    .o_decoder(o_decoder)
  );

  initial begin
    // Initialize inputs
    i_addr = 2'b00;
    i_we = 1'b0;

    // Test case 1: Check output when i_we is low
    #10;
    if (o_decoder !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", o_decoder);
      $finish;
    end

    // Test case 2: Enable and check for address 00
    i_we = 1'b1;
    i_addr = 2'b00;
    #10;
    if (o_decoder !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", o_decoder);
      $finish;
    end

    // Test case 3: Check for address 01
    i_addr = 2'b01;
    #10;
    if (o_decoder !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 0010, got %b", o_decoder);
      $finish;
    end

    // Test case 4: Check for address 10
    i_addr = 2'b10;
    #10;
    if (o_decoder !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected 0100, got %b", o_decoder);
      $finish;
    end

    // Test case 5: Check for address 11
    i_addr = 2'b11;
    #10;
    if (o_decoder !== 4'b0000) begin
      $display("FAIL: Test case 5 failed, expected 0000, got %b", o_decoder);
      $finish;
    end

    // Test case 6: Check output when i_we is low again
    i_we = 1'b0;
    #10;
    if (o_decoder !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 0000, got %b", o_decoder);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule