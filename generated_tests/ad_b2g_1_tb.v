`timescale 1ns/1ps

module tb_ad_b2g;

  reg [7:0] din;
  wire [7:0] dout;

  // Instantiate the module under test
  ad_b2g uut (
    .din(din),
    .dout(dout)
  );

  initial begin
    // Test case 1: Input 0
    din = 8'b00000000; #10;
    if (dout !== 8'b00000000) begin
      $display("FAIL: Test case 1 failed, expected dout = 00000000, got dout = %b", dout);
      $finish;
    end

    // Test case 2: Input 1
    din = 8'b00000001; #10;
    if (dout !== 8'b00000001) begin
      $display("FAIL: Test case 2 failed, expected dout = 00000001, got dout = %b", dout);
      $finish;
    end

    // Test case 3: Input 2
    din = 8'b00000010; #10;
    if (dout !== 8'b00000011) begin
      $display("FAIL: Test case 3 failed, expected dout = 00000011, got dout = %b", dout);
      $finish;
    end

    // Test case 4: Input 3
    din = 8'b00000011; #10;
    if (dout !== 8'b00000010) begin
      $display("FAIL: Test case 4 failed, expected dout = 00000010, got dout = %b", dout);
      $finish;
    end

    // Test case 5: Input 4
    din = 8'b00000100; #10;
    if (dout !== 8'b00000110) begin
      $display("FAIL: Test case 5 failed, expected dout = 00000110, got dout = %b", dout);
      $finish;
    end

    // Test case 6: Input 255
    din = 8'b11111111; #10;
    if (dout !== 8'b10000000) begin
      $display("FAIL: Test case 6 failed, expected dout = 10000000, got dout = %b", dout);
      $finish;
    end

    // Test case 7: Input 128
    din = 8'b10000000; #10;
    if (dout !== 8'b11000000) begin
      $display("FAIL: Test case 7 failed, expected dout = 11000000, got dout = %b", dout);
      $finish;
    end

    // Test case 8: Input 64
    din = 8'b01000000; #10;
    if (dout !== 8'b01100000) begin
      $display("FAIL: Test case 8 failed, expected dout = 01100000, got dout = %b", dout);
      $finish;
    end

    // Test case 9: Input 32
    din = 8'b00100000; #10;
    if (dout !== 8'b00110000) begin
      $display("FAIL: Test case 9 failed, expected dout = 00110000, got dout = %b", dout);
      $finish;
    end

    // Test case 10: Input 16
    din = 8'b00010000; #10;
    if (dout !== 8'b00011000) begin
      $display("FAIL: Test case 10 failed, expected dout = 00011000, got dout = %b", dout);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule