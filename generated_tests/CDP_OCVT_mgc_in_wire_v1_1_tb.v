`timescale 1ns/1ps

module tb_CDP_OCVT_mgc_in_wire_v1;

  parameter integer width = 8;

  reg  [width-1:0] z;
  wire [width-1:0] d;

  // Instantiate the module under test
  CDP_OCVT_mgc_in_wire_v1 #(.width(width)) uut (
    .d(d),
    .z(z)
  );

  initial begin
    // Test case 1: Check pass-through functionality
    z = 8'b00000000; // Set input to 0
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 1 failed, expected d = %b, got d = %b", z, d);
      $finish;
    end

    // Test case 2: Check pass-through with a non-zero value
    z = 8'b10101010; // Set input to a specific pattern
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 2 failed, expected d = %b, got d = %b", z, d);
      $finish;
    end

    // Test case 3: Check pass-through with another pattern
    z = 8'b11111111; // Set input to all ones
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 3 failed, expected d = %b, got d = %b", z, d);
      $finish;
    end

    // Test case 4: Check pass-through with another pattern
    z = 8'b00001111; // Set input to a different pattern
    #10; // Wait for some time
    if (d !== z) begin
      $display("FAIL: Test case 4 failed, expected d = %b, got d = %b", z, d);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule