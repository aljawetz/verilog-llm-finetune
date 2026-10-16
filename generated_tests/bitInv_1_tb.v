`timescale 1ns/1ps

module tb_bitInv;

  reg [7:0] din;
  wire [7:0] out;

  // Instantiate the module under test
  bitInv uut (
    .din(din),
    .out(out)
  );

  initial begin
    // Test case 1: All bits set to 0
    din = 8'b00000000;
    #10;
    if (out !== 8'b11111111) begin
      $display("FAIL: Test case 1 failed, expected 11111111, got %b", out);
      $finish;
    end

    // Test case 2: All bits set to 1
    din = 8'b11111111;
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 2 failed, expected 00000000, got %b", out);
      $finish;
    end

    // Test case 3: Alternating bits
    din = 8'b10101010;
    #10;
    if (out !== 8'b01010101) begin
      $display("FAIL: Test case 3 failed, expected 01010101, got %b", out);
      $finish;
    end

    // Test case 4: Random bits
    din = 8'b11001100;
    #10;
    if (out !== 8'b00110011) begin
      $display("FAIL: Test case 4 failed, expected 00110011, got %b", out);
      $finish;
    end

    // Test case 5: All bits set to 0xAA
    din = 8'b10101010;
    #10;
    if (out !== 8'b01010101) begin
      $display("FAIL: Test case 5 failed, expected 01010101, got %b", out);
      $finish;
    end

    // Test case 6: All bits set to 0x55
    din = 8'b01010101;
    #10;
    if (out !== 8'b10101010) begin
      $display("FAIL: Test case 6 failed, expected 10101010, got %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule