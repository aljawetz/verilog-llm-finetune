`timescale 1ns/1ps

module tb_CDP_ICVT_mgc_in_wire_v1;

  parameter integer width = 8;
  
  reg [width-1:0] z;
  wire [width-1:0] d;

  // Instantiate the module under test (uut)
  CDP_ICVT_mgc_in_wire_v1 #(.width(width)) uut (
    .d(d),
    .z(z)
  );

  initial begin
    // Test sequence
    // Test case 1: Check if output matches input
    z = 8'b00000000; // Input 0
    #10;
    if (d !== z) begin
      $display("FAIL: Output does not match input for z = %b", z);
      $finish;
    end

    // Test case 2: Check if output matches input
    z = 8'b11111111; // Input 255
    #10;
    if (d !== z) begin
      $display("FAIL: Output does not match input for z = %b", z);
      $finish;
    end

    // Test case 3: Check if output matches input
    z = 8'b10101010; // Input 170
    #10;
    if (d !== z) begin
      $display("FAIL: Output does not match input for z = %b", z);
      $finish;
    end

    // Test case 4: Check if output matches input
    z = 8'b01010101; // Input 85
    #10;
    if (d !== z) begin
      $display("FAIL: Output does not match input for z = %b", z);
      $finish;
    end

    // Test case 5: Check if output matches input
    z = 8'b00001111; // Input 15
    #10;
    if (d !== z) begin
      $display("FAIL: Output does not match input for z = %b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule