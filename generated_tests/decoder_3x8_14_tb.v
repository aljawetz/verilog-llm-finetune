`timescale 1ns/1ps

module tb_decoder_3x8;

  reg en;
  reg [4:0] i1;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  decoder_3x8 uut (
    .en(en),
    .i1(i1),
    .y(y)
  );

  initial begin
    // Test case 1: Enable decoder and input 0
    en = 1;
    i1 = 5'b00000; // Expect y = 8'b00000001
    #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed. Expected y = 8'b00000001, got y = %b", y);
      $finish;
    end

    // Test case 2: Enable decoder and input 1
    i1 = 5'b00001; // Expect y = 8'b00000010
    #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed. Expected y = 8'b00000010, got y = %b", y);
      $finish;
    end

    // Test case 3: Enable decoder and input 2
    i1 = 5'b00010; // Expect y = 8'b00000100
    #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed. Expected y = 8'b00000100, got y = %b", y);
      $finish;
    end

    // Test case 4: Enable decoder and input 3
    i1 = 5'b00011; // Expect y = 8'b00001000
    #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed. Expected y = 8'b00001000, got y = %b", y);
      $finish;
    end

    // Test case 5: Enable decoder and input 4
    i1 = 5'b00100; // Expect y = 8'b00010000
    #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed. Expected y = 8'b00010000, got y = %b", y);
      $finish;
    end

    // Test case 6: Enable decoder and input 5
    i1 = 5'b00101; // Expect y = 8'b00100000
    #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed. Expected y = 8'b00100000, got y = %b", y);
      $finish;
    end

    // Test case 7: Enable decoder and input 6
    i1 = 5'b00110; // Expect y = 8'b01000000
    #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed. Expected y = 8'b01000000, got y = %b", y);
      $finish;
    end

    // Test case 8: Enable decoder and input 7
    i1 = 5'b00111; // Expect y = 8'b10000000
    #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed. Expected y = 8'b10000000, got y = %b", y);
      $finish;
    end

    // Test case 9: Disable decoder
    en = 0;
    i1 = 5'b00000; // Expect y = 8'b00000000
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed. Expected y = 8'b00000000, got y = %b", y);
      $finish;
    end

    // Test case 10: Disable decoder with non-zero input
    i1 = 5'b00001; // Expect y = 8'b00000000
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 10 failed. Expected y = 8'b00000000, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule