`timescale 1ns/1ps

module tb_demux8to1D;

  reg [2:0] s;
  reg i;
  wire [7:0] y;

  // Instantiate the module under test
  demux8to1D uut (
    .y(y),
    .s(s),
    .i(i)
  );

  initial begin
    // Test case 1: Input i = 1, select line s = 3'b000
    i = 1;
    s = 3'b000;
    #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed, expected y = 8'b00000001, got y = %b", y);
      $finish;
    end

    // Test case 2: Input i = 1, select line s = 3'b001
    s = 3'b001;
    #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed, expected y = 8'b00000010, got y = %b", y);
      $finish;
    end

    // Test case 3: Input i = 1, select line s = 3'b010
    s = 3'b010;
    #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed, expected y = 8'b00000100, got y = %b", y);
      $finish;
    end

    // Test case 4: Input i = 1, select line s = 3'b011
    s = 3'b011;
    #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed, expected y = 8'b00001000, got y = %b", y);
      $finish;
    end

    // Test case 5: Input i = 1, select line s = 3'b100
    s = 3'b100;
    #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed, expected y = 8'b00010000, got y = %b", y);
      $finish;
    end

    // Test case 6: Input i = 1, select line s = 3'b101
    s = 3'b101;
    #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed, expected y = 8'b00100000, got y = %b", y);
      $finish;
    end

    // Test case 7: Input i = 1, select line s = 3'b110
    s = 3'b110;
    #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed, expected y = 8'b01000000, got y = %b", y);
      $finish;
    end

    // Test case 8: Input i = 1, select line s = 3'b111
    s = 3'b111;
    #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed, expected y = 8'b10000000, got y = %b", y);
      $finish;
    end

    // Test case 9: Input i = 0, select line s = 3'b000
    i = 0;
    s = 3'b000;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed, expected y = 8'b00000000, got y = %b", y);
      $finish;
    end

    // Test case 10: Input i = 0, select line s = 3'b111
    s = 3'b111;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 10 failed, expected y = 8'b00000000, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule